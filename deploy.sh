#!/bin/zsh
set -euo pipefail

echo "Deploying A Head Full of Wishes"

source _cloudfront-distribution-id

# build site
bundle exec jekyll build --config _config.yml,_config_build.yml

# upload to s3
s3cmd sync --guess-mime-type --no-mime-magic --delete-removed --exclude '.sass-cache' --exclude 's3cfg*' --exclude 'database/*' _deploy/ s3://www.fullofwishes.co.uk

# copy rss to correct location
aws s3 mv --content-type "text/xml" --metadata-directive REPLACE s3://www.fullofwishes.co.uk/feed.xml s3://www.fullofwishes.co.uk/feed 

# update the routing rules
aws s3api put-bucket-website --bucket www.fullofwishes.co.uk --website-configuration file://config/routing-rules.json

# invalidate cloudfront
aws cloudfront create-invalidation --distribution-id $CDN_DISTRIBUTION_ID --paths "/*"

# ping feedburner
curl --write-out '%{http_code}' --silent --output /dev/null "https://www.feedburner.com/fb/a/pingSubmit?bloglink=https%3A%2F%2Fwww.fullofwishes.co.uk/"


echo "A Head Full of Wishes successfully deployed."