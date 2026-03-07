# Unified Search Index Setup

## Overview

This implements a post-deployment merge of search indices from both the main site and database repository, creating a single unified search that spans both sites.

## Architecture

```
Main site build              Database repo build
     |                                |
     v                                v
search-min.json                 search-min.json
(posts only)                (releases/shows/tracks)
     |                                |
     └────────────────┬───────────────┘
                      v
            Merge script (Python)
                      |
                      v
            Unified search-min.json
            (all searchable content)
```

## Files Changed

### Main Site (ahfow-www)

1. **scripts/merge-search-indices.py** (NEW)
   - Python script that fetches both search indices from S3
   - Merges them into a single combined JSON array
   - Uploads merged result back to S3
   - Arguments: `S3_BUCKET` name

2. **.github/workflows/production-deployment.yml** (UPDATED)
   - Added step to run merge script after S3 sync completes
   - Runs before CloudFront invalidation
   - Requires boto3 (usually pre-installed in Ubuntu runners)

### Database Repo (ahfow-database)

1. **search.json** (NEW)
   - Jekyll template that generates search index from all collections
   - Includes: releases (all artists), shows, tracks
   - Uses `layout` property to categorize results

2. **.github/workflows/autodeploy-workflow.yml** (UPDATED)
   - Added step to minify search.json to search-min.json
   - Ensures search data is available in _deploy/ for upload

## Search Index Structure

### Main Site Entries (posts)
```json
{
  "series-title": "My record collection:",
  "title": "Album Title",
  "category": "galaxie 500, my record collection",
  "tags": "tag1, tag2",
  "url": "/2026/04/27/post-url/",
  "date": "2026-04-27 01:00:00 +0100"
}
```

### Database Entries (releases, shows, tracks)
```json
{
  "title": "Release/Show/Track Title",
  "category": "Release|Show|Track",
  "url": "/database/galaxie-500/releases/album-name/",
  "date": "2026-03-07T00:00:00Z"
}
```

## Workflow

1. **Main site pushes to main branch**
   - Builds Jekyll → generates search-min.json
   - Syncs _deploy/ to S3 root (excluding database/*)

2. **Database repo pushes to main branch** (separate repo)
   - Builds Jekyll → generates search-min.json
   - Minifies search-min.json
   - Syncs _deploy/ to S3/database/

3. **Merge step** (in main site's production-deployment workflow)
   - Waits for both repos to deploy (timestamps handled by GitHub)
   - Fetches search-min.json from S3 root
   - Fetches search-min.json from S3/database/
   - Combines into single array
   - Uploads merged result to S3 root as search-min.json

## Frontend Integration

The frontend JavaScript that loads search.json automatically gets the unified index:
- All post results continue to work as before
- Database results now appear in search too
- Both have consistent structure (title, category, url, date)

## Notes

- **Dependency timing**: The merge script handles cases where database hasn't deployed yet (gracefully includes only main site results)
- **Caching**: Merged search-min.json has Cache-Control: max-age=3600 (1 hour)
- **Search updates**: Changes to either site will eventually flow through the merge on next main site deployment
- **S3 paths**:
  - Main site search: `s3://bucket/search-min.json`
  - Database search: `s3://bucket/database/search-min.json`
  - Merged result: `s3://bucket/search-min.json` (overwrites main site version)

## Testing Locally

Database search generation can be tested with:
```bash
cd ../ahfow-database
JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_config_production.yml
cat _deploy/search.json | python3 -m json.tool | head -50
```

Main site merge can be simulated by combining both search files:
```bash
# After building both sites locally
python3 -c "
import json
with open('../ahfow-database/_deploy/search.json') as f:
    db = json.load(f)
with open('_deploy/search.json') as f:
    main = json.load(f)
merged = main + db
print(json.dumps(merged))
" | head -100
```
