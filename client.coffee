# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

hello = require './coffee-module'
console.log(hello + ' world :o')

template = require "./templates/hello"

console.log template()
