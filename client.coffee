# client-side JavaScript
# run by the browser each time your view template is loaded
# This is compiled by express browserify middleware

require('coffee-script/register')

hello = require('./coffee-module')

$ ->
  console.log(hello + ' world :o')
