axios = require 'axios'

module.exports = (application) ->
  
  self = 
    
    cachedUser: ->
      if localStorage.cachedUser
        JSON.parse(localStorage.cachedUser)
  
    isSignedIn: ->
      true if localStorage.cachedUser and self.cachedUser().login

    avatarColor: ->
      # console.log "💃🏻", self.cachedUser().color
      self.cachedUser().color

    avatarImage: ->
      self.cachedUser().avatarUrl

    recentProjectIds: ->
      recentFiles = self.cachedUser().recentFiles
      recentFiles.map (recent) ->
        recent.projectId

    getRecentProjects: ->
      recentProjectIds = self.recentProjectIds().toString()
      projectInfoUrl = "https://api.gomix.com/projects/byIds?ids=#{recentProjectIds}"
      axios.get projectInfoUrl
      .then (response) ->
        projects = response.data.map (project) ->
          console.log 'raw project', project
          self.normalizeProject project
        application.userRecentProjects projects
        console.log 'application.userRecentProjects', application.userRecentProjects()
        # console.log 'projects', projects
      .catch (error) ->
        console.error "recentProjects", error

    normalizeProject: (projectFromAPI) ->
      project =
        name: projectFromAPI.name
        projectId: projectFromAPI.id
        projectName: projectFromAPI.name
        description: projectFromAPI.description
        categoryIds: []
        users: self.normalizeUsersInProject projectFromAPI.users

    normalizeUsersInProject: (usersInProjectFromAPI) ->
      users = []
      console.log 'usersInProjectFromAPI', usersInProjectFromAPI
      usersInProjectFromAPI.forEach (user) ->
        users.push
            name: user.name
            avatar: user.avatarUrl
      return users
        
  if localStorage.cachedUser
    self.getRecentProjects()

  return self
