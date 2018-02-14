module.exports = (project, application, projectItemPresenter, userPagePresenter) ->

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
        
    hiddenIfPageIsTeamPage: ->
      'hidden' if application.pageIsTeamPage()
    
    removeProjectFromTeam: ->
      application.team().removeProject application, project
                  
    deleteProject: (event) ->
      userPagePresenter.deleteProject project, event
