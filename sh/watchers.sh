#!/bin/bash
set -e

# Specifically invoke 'coffeescript', not the older 'coffee-script' imported by jadelet
node_modules/coffeescript/bin/coffee --watch --compile . &

nodemon --exec "bash sh/compile-jade.sh" --watch src/templates --ext .jade &
pnpx webpack --watch &
bash sh/stylus.sh &

# ESLint the server files:
nodemon --exec "eslint --config .eslintrc.server.js server.js routes.js --cache" --watch server.js --watch routes.js &
  
wait