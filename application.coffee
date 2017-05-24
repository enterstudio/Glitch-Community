Observable = require 'o_0'
_ = require 'underscore'
axios = require 'axios'

API_URL = 'https://api.glitch.com/' # 'https://api.staging.glitch.com/
EDITOR_URL = 'https://glitch.com/edit/' # 'https://staging.glitch.com/edit/

# curated
curated = 
  featured: require "./curated/featured"
  categories: require "./curated/categories"
  collections: require "./curated/collections"
  partners: require "./curated/partners"
  projects: require "./curated/projects"

allProjectGroups = curated.categories.concat curated.collections.concat curated.partners

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

  # questions
  projectQuestions: Observable []

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
    event.preventDefault()
    self.overlay.showProjectOverlay project
  
  featuredProjects: ->
    _.shuffle curated.featured

  categories: ->
    homepageCategories = _.filter curated.categories, (category) ->
      !category.categoryPageOnly
    _.shuffle homepageCategories

  allProjects: ->
    # returns all projects, shuffled
    allProjects = []
    for category, projects of curated.projects
      allProjects = allProjects.concat projects
    _.shuffle allProjects

  projectsInCategory: (category) ->
    # returns all projects in a category domain, shuffled
    projectsInCategory = require("./curated/projects")[category]
    _.shuffle projectsInCategory

  selectedCategories: ->
    # returns 3 shuffled categories to display in full on the homepage
    shuffledCategories = self.categories()
    shuffledCategories.slice(0, 3)

  projectsInSelectedCategory: (category) ->
    # returns 3 projects for index page category box, shuffled
    shuffledProjects = self.projectsInCategory category
    shuffledProjects.slice(0, 3)

  isCategoryUrl: (url) ->
    if _.contains self.categoryUrls(), url.toLowerCase()
      true

  isHelpingUrl: (url) ->
    console.log 'url is', url
    if url is 'helping'
      true
      
  getCategoryFromUrl: (url) ->
    # in this function, categories include partner and collection pages
    category = _.findWhere allProjectGroups,
      url: url
      
  categoryUrls: ->
    # in this function, categories include partner and collection pages
    categories = allProjectGroups
    categoryUrls = _.map categories, (category) ->
      category.url

  projectUrl: (project) ->
    if project.line
      "#{EDITOR_URL}#!/#{project.domain}?path=#{project.path}:#{project.line}:#{project.character}"
    else
      "#{EDITOR_URL}#!/#{project.domain}"
  
  api: ->
    persistentToken = self.user.cachedUser()?.persistentToken
    if persistentToken
      axios.create
        baseURL: API_URL,
        headers:
          Authorization: persistentToken
    else
      axios.create
        baseURL: API_URL

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

  fogcreekAge: ->
    founded = 2001
    current = new Date().getFullYear()
    current - founded

self.overlay = Overlay self
self.tracking = tracking self
self.user = user self
self.search = Search self

global.application = self

module.exports = self
