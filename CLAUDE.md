# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**A Head Full of Wishes** is a Jekyll-based static site about Galaxie 500, Luna, Damon & Naomi, Dean & Britta, and Dean Wareham. It includes news, articles, discography/gigography database references, record collection posts, and category-based content.

**Tech Stack:**
- Jekyll 4.3.3 (static site generator)
- Ruby with Bundler for dependency management
- Custom Ruby plugins for Liquid template tags
- Theme: no-style-please (custom fork)
- AWS S3 + CloudFront for hosting and CDN
- GitHub Actions for CI/CD

## Development Setup

### Prerequisites
- Ruby 3.3+ (check `.ruby-version` if present)
- Bundler

### Installation
```bash
bundle install
```

### Running Locally

**Development build** (includes drafts, future posts):
```bash
bundle exec jekyll serve --config _config.yml,_config_development.yml
```
Site runs at `http://0.0.0.0:4040`

**Production build** (no drafts):
```bash
JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_config_production.yml
```
Output goes to `_deploy/` directory.

## Project Structure

### Content Organization
- `_posts/` - Main blog posts (use frontmatter with `layout: post`, `categories`, `tags`)
- `_drafts/` - Draft posts (not published in production)
- `_newsletters/` - Newsletter content
- `_articles/` - Long-form articles (collection)
- `_articles/substack-*` - Substack imports (collection)
- `category/` - Category index pages (auto-generated from post frontmatter)
- `_data/` - YAML data files (menu structure, artists, authors, shows)

### Key Directories
- `_layouts/` - Page templates (minimal; mostly uses theme)
- `_includes/` - Reusable HTML fragments (mainly footer)
- `_plugins/` - Custom Jekyll Liquid tags (see below)
- `_sass/` - Custom styles (compiled by Jekyll)
- `_aws/` - AWS-related deployment configuration
- `assets/` - Static assets (CSS, JS, images)

### Configuration
- `_config.yml` - Main Jekyll config (development defaults)
- `_config_development.yml` - Development overrides
- `_config_production.yml` - Production overrides (e.g., analytics)
- `_data/menu.yml` - Site navigation and menu structure

## Content Frontmatter

Posts use this frontmatter structure:
```yaml
---
layout: post
title: Post title
date: YYYY-MM-DD HH:MM +0000
categories:
  - category-name
  - another-category
tags:
  - tag-name
author:
  display_name: Andy
  login: admin
  email: andy@grange85.co.uk
  url: https://www.grange85.co.uk
image: https://media.fullofwishes.co.uk/path/to/image.jpg
series-title: Optional series name
catno: Optional catalog number (used in record collection posts)
---
```

## Custom Jekyll Plugins

All plugins are in `_plugins/` and add custom Liquid template tags:

### `ahfowimage`
Renders images with captions and optional source links.
```liquid
{% ahfowimage "image-url" "caption text" %}
{% ahfowimage "image-url" "caption (c) text" "source-url" %}
```
Converts `(c)` and `(cc)` to copyright and creative commons icons.

### `ahfowaudio`
Renders audio players with download links and analytics tracking.
```liquid
{% ahfowaudio {
  "audiourl": "https://...",
  "audiocap": "Download name",
  "sourceurl": "https://...",
  "sourcecap": "Source attribution"
} %}
```

### `ahfowbandcamp`
Embeds Bandcamp players (takes URL, caption, and optional thumbnail).

### `ahfowvideo`
Embeds videos with captions.

### `ahfowtrack`
Creates links to track pages in the database.
```liquid
{% ahfowtrack "Track name" %}
```

## Data Files

Located in `_data/`:
- `menu.yml` - Navigation menu with nested entries, post lists by category
- `artists.yml` - Artist metadata (Galaxie 500, Luna, Damon & Naomi, etc.)
- `authors.yml` - Author profiles
- `primary-categories.yml` - Main category list

## Deployment

### GitHub Actions Workflow
The `production-deployment.yml` workflow:
1. Triggers on push to `main` branch
2. Also scheduled to run at 6am, 9am, 12pm, 3pm, 6pm UTC daily (for scheduled posts)
3. Builds with production config
4. Minifies search JSON
5. Syncs to S3 (either full sync with `[data]` in commit message, or size-only incremental)
6. Invalidates CloudFront caches

### Building for Production
```bash
JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_config_production.yml
```

### Search Index
The site generates a `search.json` file from all posts. During deployment, this is minified to `search-min.json` for frontend use.

## Important Notes

- **Post dates and future scheduling**: Set `future: false` in config (production) to hide future-dated posts. The GitHub Actions scheduler allows scheduled post publication.
- **Media hosting**: All media (images, audio, video) is hosted on a separate media server (`media.fullofwishes.co.uk`). Don't embed local assets.
- **Theme customization**: The site uses a custom fork of the "no-style-please" theme. Custom styles in `_sass/` override or extend theme styles.
- **Analytics**: GoatCounter tracking is configured for analytics and download/play event tracking.
- **Comments**: GitHub issues are used for comments (via separate repo `ahfow-www-comments`).
