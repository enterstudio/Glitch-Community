Observable = require 'o_0'
_ = require 'underscore'
axios = require 'axios'
CancelToken = axios.CancelToken
source = CancelToken.source()
markdown = require('markdown-it')({html: true})
  .use(require('markdown-it-sanitizer'))

curated = require "./curated"
trackEvent = require "./utils/track-event"

self = 

  overlayVisible: Observable false
  overlayTemplate: Observable "" # video, project
  overlayProject: Observable {}
  overlayReadme: Observable ""
  overlayReadmeLoaded: Observable false
  overlayReadmeError: Observable false

  utils:
    trackEvent: trackEvent

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

  # TODO move below to overlay presenter
    
  showProjectOverlay: (project) ->
    self.overlayReadme ""
    self.overlayVisible true
    self.overlayReadmeLoaded false
    self.overlayReadmeError false
    self.overlayTemplate "project"
    self.overlayProject project
    self.getProjectReadme project
    self.utils.trackEvent.overlayProject project

  showVideoOverlay: ->
    self.overlayVisible true
    self.overlayTemplate "video"
    self.utils.trackEvent.overlayVideo()

  # uncalled, make global (will dismiss future pops as well)
  # closeAllPopOvers: (event) ->
  #   console.log 'hi', event
  #   escapeKey = 27
  #   if event?.which is escapeKey
  #     self.hideOverlay()

  hideOverlay: ->
    self.overlayVisible false
    source.cancel()
    source = CancelToken.source()

  getProjectReadme: (project) ->
    readmeUrl = "https://api.gomix.com/projects/#{project.projectId}/readme" # change to glitch path later
    axios.get readmeUrl,
      cancelToken: source.token
    .then (response) ->
      self.overlayReadmeError false
      self.overlayReadme self.mdToNode(response.data)
      self.overlayReadmeLoaded true
    .catch (error) ->
      if axios.isCancel error
        console.log 'request cancelled', project.projectName
      else
        console.error error
        self.overlayReadmeLoaded true
        self.overlayReadmeError true
        node = document.createElement 'span'
        node.innerHTML = 
        """
          <h1>Couldn't get project info</h1>
          <p>Maybe try another project? Maybe we're too popular right now?</p>
          <p>(シ_ _)シ</p>
        """
        self.overlayReadme node

  mdToNode: (md) ->
    node = document.createElement 'span'
    node.innerHTML = markdown.render md
    return node


module.exports = self
