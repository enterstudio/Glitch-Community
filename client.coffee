# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

application = require './application.coffee'
console.log(application.hello + ' world :o') #

IndexTemplate = require "./templates/index"
index = IndexTemplate application

document.body.appendChild index
