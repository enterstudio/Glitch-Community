#!/bin/bash
set -e

coffee --watch --transpile --compile . &
nodemon --exec "bash sh/compile-jade.sh" --ext jade &
watchify client.js -o public/client.js -v &
nodemon --delay 2.5 --exec "bash sh/uglify.sh" --watch public/client.js &
bash sh/stylus.sh &
  
wait