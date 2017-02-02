# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

hello = require './coffee-module'
console.log(hello + ' world :o')

HelloTemplate = require "./templates/hello"

template = HelloTemplate()

document.body.appendChild template
