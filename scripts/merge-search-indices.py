#!/usr/bin/env python3
"""
Merge search indices from main site and database repo.
Runs after both repos have deployed to S3.
Uses AWS CLI (pre-installed in GitHub Actions).
"""

import json
import subprocess
import sys
import os

def run_command(cmd):
    """Run shell command and return output or None if it fails"""
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, shell=True, check=False)
        if result.returncode != 0:
            return None
        return result.stdout.strip()
    except Exception as e:
        print(f"Error running command: {e}")
        return None

def merge_search_indices(bucket_name, main_site_key, database_key, output_key):
    """
    Fetch search indices from S3, merge them, and upload the result.
    Uses AWS CLI which is pre-installed in GitHub Actions runners.

    Args:
        bucket_name: S3 bucket name
        main_site_key: S3 key for main site search index (e.g., 'search-min.json')
        database_key: S3 key for database search index (e.g., 'database/search-min.json')
        output_key: S3 key for merged output (e.g., 'search-min.json')
    """

    # Download main site search index
    print(f"Fetching main site search index from s3://{bucket_name}/{main_site_key}")
    main_output = run_command(f"aws s3 cp s3://{bucket_name}/{main_site_key} - 2>/dev/null")

    if main_output:
        try:
            main_search = json.loads(main_output)
            print(f"  ✓ Found {len(main_search)} main site entries")
        except json.JSONDecodeError as e:
            print(f"  ✗ Invalid JSON: {e}")
            main_search = []
    else:
        print(f"  ⚠ Warning: Main site search index not found")
        main_search = []

    # Download database search index
    print(f"Fetching database search index from s3://{bucket_name}/{database_key}")
    db_output = run_command(f"aws s3 cp s3://{bucket_name}/{database_key} - 2>/dev/null")

    if db_output:
        try:
            database_search = json.loads(db_output)
            print(f"  ✓ Found {len(database_search)} database entries")
        except json.JSONDecodeError as e:
            print(f"  ✗ Invalid JSON: {e}")
            database_search = []
    else:
        print(f"  ⚠ Warning: Database search index not found")
        database_search = []

    # Merge indices
    merged = main_search + database_search
    print(f"\n✓ Merged total: {len(merged)} entries ({len(main_search)} posts + {len(database_search)} database)")

    # Write to temp file and upload
    try:
        temp_file = '/tmp/search-merged.json'
        with open(temp_file, 'w') as f:
            json.dump(merged, f)

        print(f"Uploading merged search index to s3://{bucket_name}/{output_key}")
        cmd = f"aws s3 cp {temp_file} s3://{bucket_name}/{output_key} --content-type application/json --cache-control max-age=3600"
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)

        if result.returncode == 0:
            print("  ✓ Upload successful")
            return True
        else:
            print(f"  ✗ Upload failed: {result.stderr}")
            return False

    except Exception as e:
        print(f"  ✗ Error: {e}")
        return False


if __name__ == '__main__':
    bucket = sys.argv[1] if len(sys.argv) > 1 else 'ahfow-www'

    success = merge_search_indices(
        bucket_name=bucket,
        main_site_key='search-min.json',
        database_key='database/search-min.json',
        output_key='search-min.json'
    )

    sys.exit(0 if success else 1)
