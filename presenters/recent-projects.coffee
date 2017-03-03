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
      project = application.userRecentProjects()
      # if application.user.isAnon()
      #   1
      # else if application.user.isSignedIn()
      # 3
      # if user is signed in , then 3
      # 
      projectElements = application.userRecentProjects.map (project) ->
        category = 
          color: undefined
        ProjectPresenter(application, project, category)

    # hiddenUnlessUser: ->
    #   console.log 'hiddenUnlessUser'
    #   'hidden' unless application.user.cachedUser()

    userAvatarIsAnon: ->
      'anon-user-avatar' unless application.user.isSignedIn()

#     hiddenUnlessUserRecentProjectsVisible: ->
#       'hidden' unless application.userRecentProjectsVisible()

#     hiddenIfUserRecentProjectsVisible: ->
#       'hidden' if application.userRecentProjectsVisible()
        
  # userRecentProjectsVisibile: Observable false
  # userRecentProjects: Observable []
    
