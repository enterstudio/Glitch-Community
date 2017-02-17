_ = require 'underscore'

search = require "./utils/search"
curated = require "./curated"

console.log curated
console.log 'hi'

self = 
  utils:
    search: search
    remixLink: (projectName, projectId) ->
      "https://gomix.com/#!/remix/#{projectName}/#{projectId}"

  # presenters:
  featured: ->
    "sdf"

  hello: 'sup'

  clickTest: ->
    alert 'yo'

  featured: ->
    _.shuffle curated.featured()

  
    
module.exports = self
