Observable = require 'o_0'
_ = require 'underscore'

curated = require "./curated"
tracking = require "./tracking"

Overlay = require "./presenters/overlay"

self = 

  overlayVisible: Observable false
  overlayTemplate: Observable "" # video, project
  overlayProject: Observable {}
  overlayReadme: Observable ""
  overlayReadmeLoaded: Observable false
  overlayReadmeError: Observable false
  
  showProjectOverlay: (project) ->
    self.overlay.showProjectOverlay project

  showVideoOverlay: (project) ->
    self.overlay.showVideoOverlay project

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

  closeAllPopOvers: (event) ->
    escapeKey = 27
    if event.keyCode is escapeKey
      self.overlay.hideOverlay()



  isCategoryUrl: (url) ->
    if _.contains self.categoryUrls(), url.toLowerCase()
      true

  getCategoryFromUrl: (url) ->
    category = _.findWhere curated.categories(),
      url: url

  categoryUrls: ->
    categories = curated.categories()
    categoryUrls = _.map categories, (category) ->
      category.url


self.overlay = Overlay self
self.tracking = tracking self

module.exports = self
