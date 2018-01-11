#!/bin/bash
set -e

mkdir -p cache

jadelet -d templates -r "require('jadelet')"

coffee  --transpile --compile .

browserify client.js > public/client.js

if [[ $ENVIRONMENT = 'production' ]]
  then
    (
      echo "💟 environment is in production mode"
      uglifyjs public/client.js \
        --compress \
        --mangle \
        --screw-ie8 \
        > public/client.min.js
    )
  else
    echo "🚒 environment is in development mode"
fi

stylus \
  --use autoprefixer-stylus \
  --sourcemap \
  --compress public/styles.styl \
  --out public/styles.css

coffee server.coffee
