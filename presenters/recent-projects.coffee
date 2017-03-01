RecentProjectsTemplate = require "../templates/includes/recent-projects"

module.exports = (application) ->

  self = 

    template: ->
      # get projects, add them to self
      RecentProjectsTemplate self

    userAvatarIsAnon: ->
      'anon-avatar' unless application.user.isSignedIn()

    avatarColor: application.user.avatarColor()
    
    