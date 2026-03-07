#!/usr/bin/env python3
"""
Merge search indices from main site and database repo.
Runs after both repos have deployed to S3.
"""

import json
import boto3
import sys
from datetime import datetime

def merge_search_indices(bucket_name, main_site_key, database_key, output_key):
    """
    Fetch search indices from S3, merge them, and upload the result.

    Args:
        bucket_name: S3 bucket name
        main_site_key: S3 key for main site search index (e.g., 'search-min.json')
        database_key: S3 key for database search index (e.g., 'database/search-min.json')
        output_key: S3 key for merged output (e.g., 'search-min.json')
    """
    s3 = boto3.client('s3')

    try:
        # Fetch main site search index
        print(f"Fetching main site search index from s3://{bucket_name}/{main_site_key}")
        response = s3.get_object(Bucket=bucket_name, Key=main_site_key)
        main_search = json.loads(response['Body'].read())
        print(f"  Found {len(main_search)} main site entries")

    except s3.exceptions.NoSuchKey:
        print(f"Warning: Main site search index not found at {main_site_key}")
        main_search = []
    except Exception as e:
        print(f"Error fetching main site search index: {e}")
        return False

    try:
        # Fetch database search index
        print(f"Fetching database search index from s3://{bucket_name}/{database_key}")
        response = s3.get_object(Bucket=bucket_name, Key=database_key)
        database_search = json.loads(response['Body'].read())
        print(f"  Found {len(database_search)} database entries")

    except s3.exceptions.NoSuchKey:
        print(f"Warning: Database search index not found at {database_key}")
        database_search = []
    except Exception as e:
        print(f"Error fetching database search index: {e}")
        database_search = []

    # Merge indices
    merged = main_search + database_search
    print(f"\nMerged total: {len(merged)} entries")

    # Upload merged index
    try:
        print(f"Uploading merged search index to s3://{bucket_name}/{output_key}")
        s3.put_object(
            Bucket=bucket_name,
            Key=output_key,
            Body=json.dumps(merged),
            ContentType='application/json',
            CacheControl='max-age=3600'
        )
        print("Upload successful")
        return True

    except Exception as e:
        print(f"Error uploading merged search index: {e}")
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
