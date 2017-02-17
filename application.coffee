_ = require 'underscore'

search = require "./utils/search"
curated = require "./curated"


console.log curated

self = 
  utils:
    search: search
    remixLink: (projectName, projectId) ->
      "https://gomix.com/#!/remix/#{projectName}/#{projectId}"

  featuredProjects: ->
    _.shuffle curated.featured()

  shuffledCategories: ->
    MAX_CATEOGIES_DISPLAYED = 3
    shuffledCategories = _.shuffle curated.categories()
    shuffledCategories.slice(0, MAX_CATEOGIES_DISPLAYED)


module.exports = self
