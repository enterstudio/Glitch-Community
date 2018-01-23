Observable = require 'o_0'
_ = require 'underscore'
md = require('markdown-it')
  breaks: true
  linkify: true
  typographer: true
.disable(['image'])

UserTemplate = require "../../templates/pages/user"
DeletedProjectsTemplate = require "../../templates/deleted-projects"
LayoutPresenter = require "../layout"
CtaButtonsPresenter = require "../cta-buttons"
ProjectsListPresenter = require "../projects-list"
assetUtils = require('../../utils/assets')(application)

module.exports = (application, userLoginOrId) ->
  self =

    user: application.user    
    
    newDescription: Observable ""
    editingDescription: Observable false
    
    userLoginOrId: ->
      decodeURI userLoginOrId

    application: application
  
    ctaButtons: ->
      CtaButtonsPresenter(application)

    coverUrl: ->
      if application.user().localCoverImage()
        application.user().localCoverImage()
      else
        application.user().coverUrl()

    userProfileStyle: ->
      backgroundColor: application.user().coverColor()
      backgroundImage: "url('#{self.coverUrl()}')"

    userName: ->
      application.user().name()

    hiddenUnlessUserHasName: ->
      'hidden' unless self.userName()

    hiddenUnlessUserHasThanks: ->
      'hidden' unless application.user().thanksCount() > 0

    userThanks: -> application.user().userThanks()
    
    hiddenIfEditingDescription: ->
      'hidden' if self.editingDescription()

    hiddenUnlessEditingDescription: ->
      'hidden' unless self.editingDescription()

    focusOnEditableDescription: ->
      self.editingDescription true
      element = document.getElementById('description-markdown')
      element.focus()
    
    defocusOnEditableDescription: (event) ->
      self.editingDescription false
      text = event.target.textContent
      self.newDescription text

    editableDescriptionMarkdown: ->
      if application.user().description().trim().length is 0
        return ""
      else if self.newDescription()
        text = self.newDescription()
        node = document.createElement 'span'
        node.innerHTML = md.render text
        return node
      else
        application.user().initialDescriptionMarkdown()

    editableDescription: ->
      if self.newDescription()
        self.newDescription()
      else
        application.user().initialDescription()

    description: ->
      application.user().descriptionMarkdown()

    updateDescription: (event) ->
      text = event.target.textContent
      application.user().description text
      self.updateUser
        description: text

    # applyDescription: (event) ->
    #   event.target = application.user().descriptionMarkdown()

    updateUser: _.debounce (data) ->
      application.user().updateUser application, data
    , 250

    userHasData: ->
      true if application.user().id()

    userAvatarUrl: ->
      application.user().userAvatarUrl('large')

    userAvatarStyle: ->
      backgroundColor: application.user().color()
      backgroundImage: "url('#{self.userAvatarUrl()}')"

    hiddenIfUserFetched: -> 
      application.user().hiddenIfFetched()

    hiddenUnlessUserFetched: -> 
      application.user().hiddenUnlessFetched()

    visibleIfUserNotFound: ->
      if application.user().notFound()
        'visible'

    hiddenIfUserNotFound: ->
      if application.user().notFound()
        'hidden'

    isCurrentUser: ->
      application.user().isCurrentUser application

    hiddenUnlessUserIsCurrentUser: ->
      'hidden' unless self.isCurrentUser()

    hiddenIfUserIsNotCurrentUser: ->
      'hidden' if self.isCurrentUser()

    hiddenIfNoDescription: ->
      'hidden' if application.user().description().length is 0

    possessivePronoun: ->
      'Your ' if self.isCurrentUser()

    cover: ->
      cover = self.coverUrl()
      "url(#{cover})" if cover

    uploadCover: ->
      input = document.createElement "input"
      input.type = 'file'
      input.accept = "image/*"
      input.onchange = (event) ->   
        file = event.target.files[0]
        console.log '☔️☔️☔️ input onchange', file
        assetUtils.addCoverFile file
      input.click()
      return false

    projects: ->
      self.user().projects()

    pinnedProjectIds: ->
      self.user().pins().map (pin) ->
        pin.projectId

    recentProjects: ->
      recentProjects = self.projects().filter (project) ->
        !_.contains self.pinnedProjectIds(), project.id()
      ProjectsListPresenter application, "Recent Projects", recentProjects  
    
    pinnedProjectsList: ->
      pinnedProjects = self.projects().filter (project) ->
        _.contains self.pinnedProjectIds(), project.id()
      ProjectsListPresenter application, "Pinned Projects", pinnedProjects

    hiddenIfNotCurrentUserAndNoPins: ->
      if !self.isCurrentUser() and self.user().pins().length is 0
        'hidden'
    
    hiddenUnlessUserIsAnon: ->
      'hidden' unless self.user().isAnon()
        
    undeleteProject: (project) -> 
      console.log("Undelete request received!", project)
      # hit the api to actually undelete the project
      project.undelete()
      # restore the project to self.projects(),
      
      # remove from deletedProjectsObservable, 
      
      # and animate
      return
     
    deletedProjectsObservable: Observable []
    getDeletedProjects: ->
      console.log("Get current projects");
      if !self.isCurrentUser()
        return
      
      application.api().get("/user/deleted-projects/").then (response) -> 
        console.log(response)
        deletedProjectsRaw = response.data
        deletedProjects = deletedProjectsRaw.map (projectRaw) ->
          projectRaw.fetched = true
          project = Project(projectRaw).update(projectRaw)
          # Give the project access to this presenter:
          project.presenterUndelete = ->
            self.undeleteProject(project)
          return project

        self.deletedProjectsObservable(deletedProjects)
        console.log "got some projects", response.data
      .catch (error) -> 
        console.error 'Failed to get deleted projects', error
            
    deletedProjects: ->
      DeletedProjectsTemplate self
      
      
        
  # application.user.observe (newVal) ->
  #   if newVal
  #     self.setInitialUserDescription()
        
  content = UserTemplate(self)
  return LayoutPresenter application, content
