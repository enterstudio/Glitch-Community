Observable = require 'o_0'
_ = require 'underscore'
axios = require 'axios'

curated = require "./curated"
tracking = require "./tracking"
user = require "./user"

Overlay = require "./presenters/overlay"

self = 

  overlayVisible: Observable false
  overlayTemplate: Observable "" # video, project
  overlayProject: Observable {}
  overlayReadme: Observable ""
  overlayReadmeLoaded: Observable false
  overlayReadmeError: Observable false

  userRecentProjectsVisible: Observable false
  userRecentProjects: Observable []
  
  signInPopVisible: Observable false
  
  showProjectOverlay: (project) ->
    self.overlay.showProjectOverlay project

  closeAllPopOvers: ->
    self.signInPopVisible false
  
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
      
  api: ->
    persistentToken = self.user.cachedUser()?.persistentToken
    if persistentToken
      axios.create
        baseURL: 'https://api.gomix.com/',
        headers:
          Authorization: persistentToken
    else
      axios.create
        baseURL: 'https://api.gomix.com/'
        
  storeLocal: (key, value) ->
    try
      window.localStorage[key] = JSON.stringify value
    catch
      console.warn "Could not save to localStorage. (localStorage is disabled in private Safari windows)"
      
  loginWithOAuthCode: (code, provider) ->
    authURL = "authenticate/"
    if provider == "facebook"
      callbackURL = "https://gomix.com/community-test/login/facebook"
      authURL = "auth/facebook/callback?callbackURL=#{callbackURL}&code="
    self.api().post "#{authURL}#{code}"
    .then (response) ->
      console.log "USER", response.data
      cachedUser = self.user.cachedUser() ? {}
      Object.assign cachedUser, cachedUser, response.data
      self.storeLocal "cachedUser", cachedUser
      history.replaceState(null, null, baseUrl)

self.overlay = Overlay self
self.tracking = tracking self
self.user = user self

global.communityApp = self

module.exports = self
