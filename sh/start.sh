#!/bin/bash

# json file cache:
mkdir -p src/cache

bash sh/watchers.sh &  

nodemon ./server.js --watch server.js --watch routes.js -L
