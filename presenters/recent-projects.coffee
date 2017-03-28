RecentProjectsTemplate = require "../templates/includes/recent-projects"
ProjectPresenter = require "./project"

# SignInPopTemplate = require "../templates/includes/sign-in-pop"

module.exports = (application) ->

  self = 

    application: application
    userAvatarColor: application.user.avatarColor()
    userAvatarImage: application.user.avatarImage()
    userCoverColor: application.user.coverColor()
    userCoverImage: application.user.coverImage()

    userIsAnon: application.user.isAnon()
    userIsSignedIn: application.user.isSignedIn()

    template: ->
      RecentProjectsTemplate self

    # signInPopTemplate: ->
    #   SignInPopTemplate self

    projects: ->
      filteredProjects = self.filterProjects()
      projectElements = filteredProjects.map (project) ->
        unless project.id
          project.id = project.projectId
        project.isRecentProject = true
        category = 
          color: undefined
        ProjectPresenter(application, project, category)

    filterProjects: ->
      projects = application.userRecentProjects()
      if self.userIsAnon
        projects.slice(0,1)
      else if self.userIsSignedIn
        projects.slice(0,3)

    userAvatarIsAnon: ->
      'anon-user-avatar' if self.userIsAnon

    # hiddenUnlessUserIsAnon: ->
    #   'hidden' unless self.userIsAnon
  
    toggleSignInPopVisible: (event) ->
      application.signInPopVisibleOnRecentProjects.toggle()
      event.stopPropagation()

    popHiddenUnlessSignInPopVisible: ->
      'hidden' unless application.signInPopVisibleOnRecentProjects()

    hiddenIfUserRecentProjects: ->
      'hidden' if application.userRecentProjects().length
    