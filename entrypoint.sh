#!/bin/sh
if ! [ -e ".netlify" ]; then
    echo "“.netlify” is missing, create it in your repository with “netlify deploy”"
    exit 1
fi

if [ -z "$NETLIFY_KEY" ]; then
    if [ -z "$PLUGIN_KEY" ]; then
        echo "No key specified!"
        exit 1
    fi
    NETLIFY_KEY="$PLUGIN_KEY"
fi

netlify deploy -t "$NETLIFY_KEY"
