RecentProjectsTemplate = require "../templates/includes/recent-projects"
ProjectPresenter = require "./project"

module.exports = (application) ->

  self = 

    userRecentProjects: application.userRecentProjects()
    userRecentProjectsVisible: application.userRecentProjectsVisible() #
    
    userAvatarColor: application.user.avatarColor()
    userAvatarImage: application.user.avatarImage()
  
    template: ->
      RecentProjectsTemplate self

    projects: ->
      projects = self.filteredProjects()
      projectElements = projects.map (project) ->
        category = 
          color: undefined
        ProjectPresenter(application, project, category)

    filteredProjects: ->
      if application.user.isAnon()
        application.userRecentProjects().slice(0,1)
      else if application.user.isSignedIn()
        application.userRecentProjects().slice(0,3)

    userAvatarIsAnon: ->
      'anon-user-avatar' unless application.user.isSignedIn()

