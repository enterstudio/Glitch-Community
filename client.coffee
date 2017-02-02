# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

model = require './model.coffee'

# hello = require './coffee-module'
console.log(model.hello + ' world :o')

HelloTemplate = require "./templates/hello"

template = HelloTemplate(model)

document.body.appendChild template
