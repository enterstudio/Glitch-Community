#!/bin/bash
set -e

# json file cache:
mkdir -p cache

bash sh/watchers.sh &  

nodemon --exec "coffee server.coffee" --watch server.coffee --watch routes.coffee
