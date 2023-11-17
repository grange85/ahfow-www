#!/bin/bash

help() 
{
	printf "NAME\n\tnewpost - a tool for setting up new posts"
	printf "\n\nOPTIONS\n"
	printf "\t-d\n"
	printf "\tCreate a draft post\n\n"
}	


while getopts dt:sh flag
do
    case "${flag}" in
        d) 
        draft="true"
        ;;
        t)
        posttitle=${OPTARG}
        ;;
        s)
        starteditor="true"
        ;;
        h)
        help
        exit 1
    esac
done

if [[ ${draft} ]]; then
    echo "it's a draft\n"
    echo " ${posttitle}"
    bundle exec jekyll draft "${posttitle}"
    exit 1
fi



echo "it's a post"

