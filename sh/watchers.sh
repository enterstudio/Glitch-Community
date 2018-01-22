#!/bin/bash
set -e

coffee --watch --transpile --compile . &
nodemon --exec "bash sh/compile-jade.sh" --ext jade &
watchify client.js -o public/client.js -v &
nodemon --delay 2.5 --exec "bash sh/uglify.sh" --watch public/client.js
nodemon --delay 2.5 --exec "stylus --use autoprefixer-stylus --sourcemap --compress public/styles.styl --out public/styles.css" --watch public/styles.css

  
wait