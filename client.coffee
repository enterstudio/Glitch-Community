# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

model = require './model.coffee'
console.log(model.hello + ' world :o')

HelloTemplate = require "./templates/hello"
hello = HelloTemplate(model)

document.body.appendChild hello

document.getElementsByTagName('head')[0].appendChild('<x></x>')