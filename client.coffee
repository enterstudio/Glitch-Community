# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

application = require './application.coffee'

IndexTemplate = require "./templates/index"
index = IndexTemplate application

changePage (newPage) = ->
  
  document.body.removeChild
  document.body.appendChild newPage

# client-side routes

document.body.appendChild index
