_ = require 'underscore'

search = require "./utils/search"
curated = require "./curated"

# OverlayTemplate =
# OverlayPresenter = 

self = 
  utils:
    search: search
    remixLink: (projectName, projectId) ->
      "https://gomix.com/#!/remix/#{projectName}/#{projectId}"

  featuredProjects: ->
    _.shuffle curated.featured()

  categories: ->
    homepageCategories = _.filter curated.categories(), (category) ->
      if category.listedOnHomepage
        category
    _.shuffle homepageCategories

  projectsInCategory: (categoryId) ->
    projectsInCategory = _.filter curated.projects(), (project) ->
      _.contains project.categoryIds, categoryId
    _.shuffle projectsInCategory

  selectedCategories: ->
    shuffledCategories = self.categories()
    shuffledCategories.slice(0, 3)

  projectsInSelectedCategory: (categoryId) -> 
    shuffledProjects = self.projectsInCategory categoryId
    shuffledProjects.slice(0, 3)

  showProjectOverlay: (project) ->
    console.log 'project has been been clicked', project

module.exports = self
