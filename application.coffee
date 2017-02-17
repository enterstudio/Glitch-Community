_ = require 'underscore'

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
    _.shuffle curated.featured()

  remixLink: (projectName, projectId) ->
    "https://gomix.com/#!/remix/#{projectName}/#{projectId}"

    
module.exports = self
