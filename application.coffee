search = require "./utils/search"

curated = require "./curated"

console.log curated

self = 
  utils:
    search: search
  
  # presenters:
  featured: ->
    "sdf"

  hello: 'sup'

  clickTest: ->
    alert 'yo'

module.exports = self
