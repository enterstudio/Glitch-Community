_ = require 'underscore'

module.exports = (project, application, projectItemPresenter) ->

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
                  
    deleteProject: (event) ->
      projectContainer = event.target.closest 'li'
      application.closeAllPopOvers()
      $(projectContainer).addClass 'slide-down'
      project.delete().then ->
        # Remove from user's project collection
        index = application.user().projects.indexOf(project)
        if index != -1
          application.user().projects.splice(index, 1)
        
        # Add to user's deleted project collection
        application.user().deletedProjects.unshift(project)
        
      
