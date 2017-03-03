Observable = require 'o_0'
_ = require 'underscore'

curated = require "./curated"
tracking = require "./tracking"
user = require "./user"

Overlay = require "./presenters/overlay"

self = 

  # overlays
  overlayVisible: Observable false
  overlayTemplate: Observable "" # video, project
  overlayProject: Observable {}
  overlayReadme: Observable ""
  overlayReadmeLoaded: Observable false
  overlayReadmeError: Observable false

  # users
  userRecentProjects: Observable []

  # pop overs
  signInPopVisibleOnHeader: Observable false
  signInPopVisibleOnRecentProjects: Observable false
  
  closeAllPopOvers: ->
    console.log 'closeAllPopOvers'
    self.signInPopVisibleOnHeader false
    self.signInPopVisibleOnRecentProjects false

  showProjectOverlay: (project) ->
    self.overlay.showProjectOverlay project
  
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
self.user = user self

module.exports = self
