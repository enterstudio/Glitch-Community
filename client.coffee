# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

model = require './model.coffee'
console.log(model.hello + ' world :o') #

IndexTemplate = require "./templates/index"
index = IndexTemplate(model)

document.body.appendChild index
