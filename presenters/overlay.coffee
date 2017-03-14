axios = require 'axios'
CancelToken = axios.CancelToken
source = CancelToken.source()
markdown = require('markdown-it')({html: true})
  .use(require('markdown-it-sanitizer'))

OverlayTemplate = require "../templates/includes/overlay"

module.exports = (application) ->

  self = 
  
    overlayReadme: application.overlayReadme

    template: ->
      OverlayTemplate self

    projectDomain: ->
      application.overlayProject()?.domain

    projectId: ->
      application.overlayProject()?.id

    currentUserIsInProject: (project) ->
      currentUserId = application.user.userId()
      project.users?.forEach (user) ->
        if user.id is currentUserId
          application.currentUserIsInProject true

    hiddenIfCurrentUserInProject: ->
      'hidden' if application.currentUserIsInProject()

    hiddenUnlessCurrentUserInProject: ->
      'hidden' unless application.currentUserIsInProject()

    projectUsers: ->
      application.overlayProject().users

    projectAvatar: ->
      if self.projectId()
        "https://cdn.gomix.com/project-avatar/#{self.projectId()}.png"

    showLink: -> 
      "https://#{self.projectDomain()}.glitch.me"

    editorLink: ->
      "https://glitch.com/edit/#!/project/#{self.projectDomain()}"

    remixLink: ->
      "https://glitch.com/edit/#!/remix/#{self.projectDomain()}/#{self.projectId()}"

    overlayButtonClickHandler: (event) ->
      application.tracking.init event
      
    hiddenUnlessProject: ->
      'hidden' unless application.overlayTemplate() is 'project'

    hiddenUnlessVideo: ->
      'hidden' unless application.overlayTemplate() is 'video'
    
    isOverlayHidden: ->
      "hidden" unless application.overlayVisible()

    stopPropagation: (event) ->
      event.stopPropagation()

    warningIfReadmeError: ->
      "warning" if application.overlayReadmeError()

    hiddenUnlessOverlayReadmeLoaded: ->
      'hidden' unless application.overlayReadmeLoaded()

    hiddenIfOverlayReadmeLoaded: ->
      'hidden' if application.overlayReadmeLoaded()

    showProjectOverlay: (project) ->
      application.currentUserIsInProject false
      application.overlayReadme ""
      application.overlayVisible true
      application.overlayReadmeLoaded false
      application.overlayReadmeError false
      application.overlayTemplate "project"
      application.overlayProject project
      self.currentUserIsInProject project
      self.getProjectReadme project
      history.replaceState(null, null, "#{application.normalizedBaseUrl()}~#{project.domain}")

    showVideoOverlay: ->
      application.overlayVisible true
      application.overlayTemplate "video"

    # used for direct /~my-project urls
    showProjectOverlayForProject: (projectDomain) ->
      application.overlayVisible true
      application.overlayReadmeLoaded false
      application.overlayTemplate 'project'
      projectInfoUrl = "https://api.glitch.com/projects/#{projectDomain}"
      axios.get projectInfoUrl,
        cancelToken: source.token
      .then (response) ->
        self.showProjectOverlay response.data
      .catch (error) ->
        console.error "showProjectOverlayIfPermalink", error
        self.showReadmeError()

    newRoute: ->
      newRoute = "#{application.normalizedBaseUrl()}"
      if application.searchQuery()
        newRoute += "?q=#{application.searchQuery()}"
      newRoute
        
    hideOverlay: ->
      application.overlayVisible false
      source.cancel()
      source = CancelToken.source()
      history.replaceState(null, null, self.newRoute())
      
    getProjectReadme: (project) ->
      readmeUrl = "https://api.glitch.com/projects/#{self.projectId()}/readme" # change to glitch later
      axios.get readmeUrl,
        cancelToken: source.token
      .then (response) ->
        application.overlayReadmeError false
        application.overlayReadme self.mdToNode(response.data)
        application.overlayReadmeLoaded true
      .catch (error) ->
        if axios.isCancel error
          console.log 'request cancelled', project.domain
        else
          console.error "getProjectReadme", error
          self.showReadmeError()

    mdToNode: (md) ->
      node = document.createElement 'span'
      node.innerHTML = markdown.render md
      return node

    showReadmeError: ->
      application.overlayReadmeLoaded true
      application.overlayReadmeError true
      node = document.createElement 'span'
      node.innerHTML = 
      """
        <h1>Couldn't get project info</h1>
        <p>Maybe try another project? Maybe we're too popular right now?</p>
        <p>(シ_ _)シ</p>
      """
      self.overlayReadme node
    
    projectThoughtsMailto: ->
      projectDomain = self.projectDomain()
      projectId = self.projectId()
      support = "customer-service@fogcreek.com"
      subject = "[Glitch] I have feelings about #{projectDomain}"
      body = """
        What do you think of the #{projectDomain} project? 
        Is it great? Should we feature it? Is it malicious?

        Let us know:





        --------------------

        Thanks 💖

        – Glitch Team

        (project id: #{projectId})
      """
      encodeURI "mailto:#{support}?subject=#{subject}&body=#{body}"

