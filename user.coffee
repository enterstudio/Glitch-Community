axios = require 'axios'

ANON_AVATAR = "https://cdn.gomix.com/f6949da2-781d-4fd5-81e6-1fdd56350165%2Fanon-user-on-project-avatar.svg"

module.exports = (application) ->
  
  self = 

    cachedUser: ->
      if localStorage.cachedUser
        JSON.parse(localStorage.cachedUser)
  
    isAnon: ->
      true if self.cachedUser() and not self.cachedUser().login
  
    isSignedIn: ->
      true if self.cachedUser() and self.cachedUser().login

    avatarColor: ->
      self.cachedUser().color

    avatarImage: ->
      self.cachedUser()?.avatarUrl

    userName: ->
      self.cachedUser().login

    # fullName: ->
    #   self.cachedUser().name

    userRecentProjectIds: ->
      recentFiles = self.cachedUser().recentFiles
      recentFiles.map (recent) ->
        recent.projectId

    getUserRecentProjects: ->
      userRecentProjectIds = self.userRecentProjectIds().toString()
      projectInfoUrl = "https://api.gomix.com/projects/byIds?ids=#{userRecentProjectIds}"
      axios.get projectInfoUrl
      .then (response) ->
        projects = response.data.map (project) ->
          self.normalizeProject project
        application.userRecentProjects projects
      .catch (error) ->
        console.error "recentProjects", error

#     getUser: ->
      # userId = self.cachedUser().id
#        axios.get "https://api.gomix.com/users/#{userId}"

    normalizeProject: (projectFromAPI) ->
      project =
        name: projectFromAPI.domain
        projectId: projectFromAPI.id
        domain: projectFromAPI.domain
        description: projectFromAPI.description
        categoryIds: []
        users: self.normalizeUsersInProject projectFromAPI.users

    normalizeUsersInProject: (usersInProjectFromAPI) ->
      users = []
      usersInProjectFromAPI.forEach (user) ->
        users.push
            login: user.login
            avatarUrl: user.avatarUrl or ANON_AVATAR
            color: user.color
      return users

  if localStorage.cachedUser
    self.getUserRecentProjects()

  return self
