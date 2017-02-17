_ = require 'underscore'

search = require "./utils/search"
curated = require "./curated"


console.log 'curated', curated

self = 
  utils:
    search: search
    remixLink: (projectName, projectId) ->
      "https://gomix.com/#!/remix/#{projectName}/#{projectId}"

  featuredProjects: ->
    _.shuffle curated.featured()

  shuffledCategories: ->
    homepageCategories = _.filter curated.categories(), (category) ->
      if category.listedOnHomepage
        category
    shuffledCategories = _.shuffle homepageCategories
    shuffledCategories.slice(0, 3)

  projectsInCategory: (categoryId) -> 
    projectsInCategory = _.filter curated.projects(), (project) ->
      _.contains project.categoryIds, categoryId
    shuffledProject = _.shuffle projectsInCategory
    shuffledProject.slice(0, 3)


module.exports = self
