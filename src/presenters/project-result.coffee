ProjectResultTemplate = require "../templates/includes/project-result"
UsersListPresenter = require "./users-list"

module.exports = (application, project, options, analytics) ->

  options = options or {}
  # options.addProjectToTeam
  analytics = analytics or {}
  
  self =

    usersListPresenter: UsersListPresenter(project)

    name: ->
      project.name()

    description: ->
      MAX_LENGTH = 44
      if project.description().length > MAX_LENGTH
        project.description().substring(0, MAX_LENGTH) + '…'
      else
        project.description()
      
    addProjectToTeam: ->
      console.log "adding #{project.name()} to #{application.team().id()}"
      application.team().addProject application, project
      # application.closeAllPopOvers()

    setAnalyticsProjectDomain: ->
      console.log "setting analytics to #{project.domain()}"
      analytics.analyticsProjectDomain project.domain()
      analytics.gettingAnalyticsProjectDomain true
      # application.closeAllPopOvers()

    projectAction: ->
      if options.addProjectToTeam
        self.addProjectToTeam()
      else if analytics
        self.setAnalyticsProjectDomain()
      # event.preventDefault()

    projectResultKey: (event) ->
      ENTER = 13
      if event.keyCode is ENTER
        self.projectAction()    

    avatarUrl: ->
      project.avatar()

    activeIfSelectedProjects: ->
      console.log "🐸",analytics
      if analytics.analyticsProjectDomain?() is project.domain()
        'active'
    
    preventDefault: (event) ->
      event.preventDefault()
    
  return ProjectResultTemplate self
