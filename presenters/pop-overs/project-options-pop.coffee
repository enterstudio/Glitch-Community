_ = require 'underscore'

module.exports = (project, application, projectItemPresenter) ->

  self =

    stopPropagation: (event) ->
      event.stopPropagation()
    
    style: -> undefined

    addPin: (event) ->
      projectContainer = event.target.closest 'li'
      application.closeAllPopOvers()
      $(projectContainer).one 'animationend', -> 
        projectItemPresenter.togglePinnedState()
      $(projectContainer).addClass 'slide-up'

    removePin: (event) ->
      projectContainer = event.target.closest 'li'
      application.closeAllPopOvers()
      $(projectContainer).one 'animationend', -> 
        projectItemPresenter.togglePinnedState()
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
      $(projectContainer).one 'animationend', -> 
        # Remove from user's project collection
        index = application.user().projects.indexOf(project)
        if index != -1
          application.user().projects.splice(index, 1)
        
      $(projectContainer).addClass 'slide-down'
      
      project.delete().then ->
        # Fetch the deleted project and add it to deletedProjects()
        path = "projects/#{project.id()}?showDeleted=true"
        application.api().get path
        .then ({data}) ->
          rawProject = data
          rawProject.fetched = true
          deletedProject = Project(rawProject).update(rawProject)
          application.user().deletedProjects.unshift(deletedProject)     
        .catch (error) ->
            console.error "getDeletedProject", error
        
      
