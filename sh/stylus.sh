#!/bin/bash

# Stylus tends to crash, so run it in a loop so that it'll come back to life on failure.

echo "Starting stylus watcher"

while true; do
  stylus \
    --watch \
    --use autoprefixer-stylus \
    --sourcemap \
    --compress public/styles/styles.styl \
    --out public/styles.css
  
  echo "Restarting stylus watcher"
done
