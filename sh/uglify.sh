0#!/bin/bash

uglifyjs public/client.js \
      --compress \
      --mangle \
      --screw-ie8 \
      > public/client.min.js