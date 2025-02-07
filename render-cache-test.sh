#!/usr/bin/env bash
# exit on error
set -o errexit

RENDER_CACHE=/opt/render/project/.render
RENDER_SRC=/opt/render/project/src

echo "Testing Cache Clear"
if [[ ! -f $RENDER_CACHE/cache-test/my-cached-file ]]; then
    echo "No cached file .... creating"
    mkdir -p $RENDER_CACHE/cache-test
    echo "File cached" > $RENDER_CACHE/cache-test/my-cached-file
    cat $RENDER_CACHE/cache-test/my-cached-file
else
    cat $RENDER_CACHE/cache-test/my-cached-file
fi

echo "Testing NextJS cache"
if [[ ! -d $RENDER_SRC/.next/cache ]]; then
    echo "No NextJS cache"
else
    echo "NextJS cache exists"
    echo $(ls -la $RENDER_SRC/.next/cache)
fi
