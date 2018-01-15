#!/bin/bash

echo "uglification underway"
uglifyjs public/client.js \
      --compress \
      --mangle \
      --screw-ie8 \
      > public/client.min.js