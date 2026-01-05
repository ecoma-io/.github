#!/bin/sh
set -e

CACHE_DIR="/cache"
echo "Initializing agnostic cache directory at $CACHE_DIR"

mkdir -p $CACHE_DIR/go-build \
         $CACHE_DIR/go-mod \
         $CACHE_DIR/npm \
         $CACHE_DIR/yarn \
         $CACHE_DIR/pnpm \
         $CACHE_DIR/terraform \
         $CACHE_DIR/pip \
         $CACHE_DIR/ansible/galaxy \
         $CACHE_DIR/ansible/roles \
         $CACHE_DIR/ansible/collections \
         $CACHE_DIR/dprint


chmod -R 777 $CACHE_DIR

echo "Done!"