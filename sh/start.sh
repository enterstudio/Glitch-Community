#!/bin/bash
set -e

# jadelet cache:
mkdir -p cache

if [[ $ENVIRONMENT = 'production' ]]; then
  (
    echo "💟 environment is in production mode"
    jadelet -d templates -r "require('jadelet')"
    coffee  --transpile --compile .
    browserify client.js -o public/client.js
    uglifyjs public/client.js \
      --compress \
      --mangle \
      --screw-ie8 \
      > public/client.min.js

    stylus \
      --use autoprefixer-stylus \
      --sourcemap \
      --compress public/styles.styl \
      --out public/styles.css
  )
else
  echo "🚒 environment is in development mode"
  bash sh/watchers.sh &  
fi

nodemon --exec "coffee server.coffee" --watch server.coffee --watch routes.coffee
