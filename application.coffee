Observable = require 'o_0'
_ = require 'underscore'
axios = require 'axios'

curated = require "./curated"
tracking = require "./tracking"
user = require "./user"

Overlay = require "./presenters/overlay"
Search = require "./presenters/search"

self = 

  # overlays
  overlayVisible: Observable false
  overlayTemplate: Observable "" # video, project
  overlayProject: Observable {}
  overlayProjectAvatarUrl: Observable ""
  overlayReadme: Observable ""
  overlayReadmeLoaded: Observable false
  overlayReadmeError: Observable false
  currentUserIsInProject: Observable false

  # users
  userRecentProjects: Observable []

  # pop overs
  signInPopVisibleOnHeader: Observable false
  signInPopVisibleOnRecentProjects: Observable false
  userOptionsPopVisible: Observable false
  
  # search
  searchQuery: Observable ""
  searchResultsUsers: Observable []
  searchResultsUsersLoaded: Observable false
  searchResultsProjects: Observable []
  searchResultsProjectsLoaded: Observable false

  normalizedBaseUrl: ->
    urlLength = baseUrl.length
    lastCharacter = baseUrl.charAt(urlLength-1)
    if baseUrl is ""
      return "/"
    else if lastCharacter is not "/"
      return baseUrl + "/"
    else
      return baseUrl
  
  closeAllPopOvers: ->
    self.signInPopVisibleOnHeader false
    self.signInPopVisibleOnRecentProjects false
    self.userOptionsPopVisible false

  showProjectOverlay: (project) ->
    self.overlay.showProjectOverlay project
  
  featuredProjects: ->
    _.shuffle curated.featured()

  categories: ->
    homepageCategories = _.filter curated.categories(), (category) ->
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
      
  login: (provider, code) ->
    console.log provider, code
    authURL = "/authenticate/"
    if provider == "facebook"
      callbackURL = "https://glitch.com/login/facebook"
      authURL = "/auth/facebook/callback?callbackURL=#{callbackURL}&code="
    self.api().post "#{authURL}#{code}"
    .then (response) ->
      console.log "LOGGED IN!", response.data
      cachedUser = self.user.cachedUser() ? {}
      Object.assign cachedUser, response.data
      self.storeLocal 'cachedUser', cachedUser

  removeFirstCharacter: (string) ->
    # ex: ~cool to cool
    firstCharacterPosition = 1
    end = string.length
    string.substring(firstCharacterPosition, end)

  isProjectUrl: (url) ->
    if url.charAt(0) is "~"
      true

  isUserProfileUrl: (url) ->
    if url.charAt(0) is "@"
      true

  isSearchUrl: (url, queryString) ->
    queryStringKeys = _.keys queryString # ['q', 'blah']
    if (url is 'search') and (_.contains queryStringKeys, 'q')
      true
      

self.overlay = Overlay self
self.tracking = tracking self
self.user = user self
self.search = Search self

global.communityApp = self

module.exports = self
