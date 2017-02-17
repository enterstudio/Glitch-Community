_ = require 'underscore'

search = require "./utils/search"
curated = require "./curated"

console.log curated

self = 
  utils:
    search: search
    remixLink: (projectName, projectId) ->
      "https://gomix.com/#!/remix/#{projectName}/#{projectId}"

  # presenters:
  featured: ->
    _.shuffle curated.featured()

  
module.exports = self
