#!/bin/bash
set -e

# json file cache:
mkdir -p cache

coffee --watch --transpile --compile . &
nodemon --exec "bash sh/compile-jade.sh" --ext jade &
watchify client.js -o public/client.js -v &
nodemon --exec "bash sh/uglify.sh" --watch public/client.js
stylus \
  --watch \
  --use autoprefixer-stylus \
  --sourcemap \
  --compress public/styles.styl \
  --out public/styles.css \
  &


nodemon --exec "coffee server.coffee" --watch server.coffee --watch routes.coffee
