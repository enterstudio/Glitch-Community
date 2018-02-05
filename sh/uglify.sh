#!/bin/bash
set -e

uglifyjs public/client.js \
      --compress \
      --mangle \
      --screw-ie8 \
      > public/client.min.js.tmp
echo "Updating public/client.min.js"
mv public/client.min.js.tmp public/client.min.js