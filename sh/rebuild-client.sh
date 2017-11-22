#!/bin/bash
set -e

browserify client.js > public/client.js

uglifyjs public/client.js \
  --compress \
  --mangle \
  --screw-ie8 \
  > public/client.min.js.tmp

mv -f public/client.min.js.tmp public/client.min.js
