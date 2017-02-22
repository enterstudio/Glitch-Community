Observable = require 'o_0'
_ = require 'underscore'

curated = require "./curated"
search = require "./utils/search"
trackEvent = require "./utils/track-event"

self = 

  overlayVisible: Observable false
  overlayProject: Observable {}

  utils:
    search: search
    trackEvent: trackEvent
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
    self.overlayProject project
    self.overlayVisible true
    console.log 'overlayVisible', self.overlayVisible()
    console.log 'overlayProject', self.overlayProject()

module.exports = self
