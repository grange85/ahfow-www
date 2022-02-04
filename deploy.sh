#!/bin/zsh
set -euo pipefail

while getopts n flag
do
    case "${flag}" in
        n) dryrun=true;;
    esac
done



branch=$(git symbolic-ref --short -q HEAD)

if [[ $branch != 'master' ]]
then
	echo "not on 'master' - so not deployed"
	exit 1
fi

echo "Deploying A Head Full of Wishes"

source _cloudfront-distribution-id
# build site
bundle exec jekyll build --config _config.yml,_config_build.yml

validxml=$(xmllint --noout _deploy/feed.xml > /dev/null 2>&1;)

if [[ $validxml > 0 ]]
then
	echo "feed not valid - site not deployed"
	exit 1
fi

mkdir -p _deploy/_admin

if [ -d "/media/xander4/DATA/ahfow/media" ] 

then

	touch _deploy/_admin/full-list.html
	cat _includes/html-head.html >_deploy/_admin/full-list.html


	# list images
	echo '<h2 id="images">Images</h2><ul>' >>_deploy/_admin/full-list.html
	find /media/xander4/DATA/ahfow/media/ -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.gif' \)| sed -e 's/^\/media\/xander4\/DATA\/ahfow\/media//g' -e 's/.*/<li><a href="https:\/\/media.fullofwishes.co.uk&">&<\/a><\/li>/' | sort >> _deploy/_admin/full-list.html
	echo '</ul>' >>_deploy/_admin/full-list.html
	echo "Image list created..."

	# list audio
	echo '<h2 id="audio">Audio</h2><ul>' >>_deploy/_admin/full-list.html
	find /media/xander4/DATA/ahfow/media/ -type f \( -iname '*.mp3' -o -iname '*.m4a' \) | sed -e 's/^\/media\/xander4\/DATA\/ahfow\/media//g' -e 's/.*/<li><a href="https:\/\/media.fullofwishes.co.uk&">&<\/a><\/li>/' | sort >> _deploy/_admin/full-list.html
	echo '</ul>' >>_deploy/_admin/full-list.html
	echo "Audio list created..."

	# list video
	echo '<h2 id="videa">Video</h2><ul>' >>_deploy/_admin/full-list.html
	find /media/xander4/DATA/ahfow/media/ -type f \( -iname '*.mov' -o -iname '*.mp4' -o -iname '*.flv' \) | sed -e 's/^\/media\/xander4\/DATA\/ahfow\/media//g' -e 's/.*/<li><a href="https:\/\/media.fullofwishes.co.uk&">&<\/a><\/li>/' | sort >> _deploy/_admin/full-list.html
	echo '</ul>' >>_deploy/_admin/full-list.html
	echo "Video list created..."


	# list misc
	echo '<h2 id="misc">Misc</h2><ul>' >>_deploy/_admin/full-list.html
	find /media/xander4/DATA/ahfow/media/ -type f \( -iname '*.zip' -o -iname '*.pdf' -o -iname '*.doc' \) | sed -e 's/^\/media\/xander4\/DATA\/ahfow\/media//g' -e 's/.*/<li><a href="https:\/\/media.fullofwishes.co.uk&">&<\/a><\/li>/' | sort >> _deploy/_admin/full-list.html
	echo '</ul>' >>_deploy/_admin/full-list.html
	echo "Misc list created..."

	cat _includes/html-foot.html >>_deploy/_admin/full-list.html

else

	aws s3 cp s3://www.fullofwishes.co.uk/_admin/full-list.html _deploy/_admin/full-list.html --profile grange85

fi

echo "create minified json for search"
python3 -c 'import json, sys;json.dump(json.load(sys.stdin), sys.stdout)'  < _deploy/search.json > _deploy/search-min.json

if [[ -v dryrun ]]
then
	echo "dryrun - site not deployed"
	exit 1
fi


# upload to s3
echo "sync content..."
# s3cmd sync --guess-mime-type --no-mime-magic --delete-removed --exclude '.sass-cache' --exclude 's3cfg*' --exclude 'database/*' _deploy/ s3://www.fullofwishes.co.uk
aws s3 sync --size-only --delete --exclude '.sass-cache' _deploy/ s3://www.fullofwishes.co.uk --profile grange85

# copy rss to correct location
echo "copy rss..."
aws s3 mv --content-type "text/xml" --metadata-directive REPLACE s3://www.fullofwishes.co.uk/feed.xml s3://www.fullofwishes.co.uk/feed --profile grange85

# update the routing rules
echo "update routing rules..."
aws s3api put-bucket-website --bucket www.fullofwishes.co.uk --website-configuration file://config/routing-rules.json --profile grange85

# invalidate cloudfront
echo "invalidate cloudfont distribution..."
aws cloudfront create-invalidation --distribution-id $CDN_DISTRIBUTION_ID --paths "/*" --profile grange85

# ping feedburner
curl --write-out 'pinged feedburner\n' --silent --output /dev/null "https://www.feedburner.com/fb/a/pingSubmit?bloglink=https%3A%2F%2Fwww.fullofwishes.co.uk/"


echo "A Head Full of Wishes successfully deployed."	
