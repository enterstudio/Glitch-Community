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
      application.overlayProject()?.projectId

    projectUsers: ->
      # console.log 'hi', application.overlayProject()?.users
      application.overlayProject().users

    showLink: -> 
      "https://#{self.projectDomain()}.gomix.me" # change to glitch later

    editorLink: ->
      "https://gomix.com/#!/project/#{self.projectDomain()}" # change to glitch later

    remixLink: ->
      "https://gomix.com/#!/remix/#{self.projectDomain()}/#{self.projectId()}" # change to glitch later

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
      application.overlayReadme ""
      application.overlayVisible true
      application.overlayReadmeLoaded false
      application.overlayReadmeError false
      application.overlayTemplate "project"
      application.overlayProject project
      self.getProjectReadme project
      history.replaceState(null, null, "?project=#{project.domain}")

    showVideoOverlay: ->
      application.overlayVisible true
      application.overlayTemplate "video"

    showProjectOverlayIfPermalink: (queryString) ->
      if queryString.project
        application.overlayVisible true
        application.overlayReadmeLoaded false
        application.overlayTemplate 'project'
        projectInfoUrl = "https://api.gomix.com/projects/#{queryString.project}"
        axios.get projectInfoUrl,
          cancelToken: source.token
        .then (response) ->
          project = {
            projectId: response.data.id
            domain: response.data.domain
          }
          self.showProjectOverlay project
        .catch (error) ->
          console.error "showProjectOverlayIfPermalink", error
          self.showReadmeError()
      
    hideOverlay: ->
      application.overlayVisible false
      source.cancel()
      source = CancelToken.source()

      history.replaceState(null, null, baseUrl + route)

    getProjectReadme: (project) ->
      readmeUrl = "https://api.gomix.com/projects/#{project.projectId}/readme" # change to glitch later
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

