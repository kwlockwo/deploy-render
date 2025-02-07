#!/usr/bin/env bash
# exit on error
set -o errexit

RENDER_SRC=/opt/render/project/src

echo "Testing Cache Clear"
if [[ ! -f $XDG_CACHE_DIR/my-cached-file ]]; then
    echo "No cached file .... creating"
    echo "File cached" > $XDG_CACHE_DIR/my-cached-file
    cat $XDG_CACHE_DIR/my-cached-file
else
    cat $XDG_CACHE_DIR/my-cached-file
fi

echo "Testing NextJS cache"
if [[ ! -d $RENDER_SRC/.next/cache ]]; then
    echo "No NextJS cache"
else
    echo "NextJS cache exists"
    echo $(ls -la $RENDER_SRC/.next/cache)
fi
