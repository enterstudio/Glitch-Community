search = require "./utils/search"

curated = require "./utils/curated"

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
