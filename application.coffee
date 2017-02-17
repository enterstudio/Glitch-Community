search = require "./utils/search"

curated = require "./curated"

console.log curated
console.log 'hi'

self = 
  utils:
    search: search
  
  # presenters:
  featured: ->
    "sdf"

  hello: 'sup'

  clickTest: ->
    alert 'yo'

  featured: ->
    curated.featured()
    
module.exports = self
