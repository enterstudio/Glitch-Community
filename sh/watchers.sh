#!/bin/bash
set -e

coffee --watch --transpile --compile . &
nodemon --exec "bash sh/compile-jade.sh" --ext jade &
nodemon --exec "bash sh/uglify.sh" --watch public/client.js
watchify client.js -o public/client.js &
stylus \
  --watch \
  --use autoprefixer-stylus \
  --sourcemap \
  --compress public/styles.styl \
  --out public/styles.css \
  &

wait
