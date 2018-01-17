_ = require 'underscore'

module.exports = (project, application) ->

  self =

    stopPropagation: (event) ->
      event.stopPropagation()
    
    style: -> undefined

    addPinAnimation: (event) ->
      projectContainer = event.target.closest 'li'
      application.closeAllPopOvers()
      $(projectContainer).addClass 'slide-up'

    removePinAnimation: (event) ->
      projectContainer = event.target.closest 'li'
      application.closeAllPopOvers()
      $(projectContainer).addClass 'slide-down'

    pinnedProjectIds: ->
      application.user().pins().map (pin) ->
        pin.projectId

    hiddenIfProjectIsPinned: ->
      if project.isPinnedByUser(application) or project.isPinnedByTeam(application)
        'hidden' 

    hiddenUnlessProjectIsPinned: ->
      unless project.isPinnedByUser(application) or project.isPinnedByTeam(application)
        'hidden'

    hiddenUnlessPageIsTeamPage: ->
      'hidden' unless application.pageIsTeamPage()
    
    removeProjectFromTeam: ->
      application.team().removeProject application, project
      
    hiddenUnlessProjectIsDeleted: ->
      console.log project
      unless project.isDeleted()
        'hidden'
        
    hiddenIfProjectIsDeleted: ->
      console.log project
      if project.isDeleted()
        'hidden'
      
    deleteProject: ->
      projectPath = "/projects/#{project.id()}"
      application.api().delete projectPath
      .then (response) ->
        console.log 'project deleted.', project
      .catch (error) ->
        console.error 'deleteProject', error
      
    undeleteProject: ->
      projectPath = "/projects/#{project.id()}/undelete"
      application.api().post projectPath
      .then (response) ->
        console.log 'project restored!', project
      .catch (error) ->
        console.error 'undeleteProject', error
