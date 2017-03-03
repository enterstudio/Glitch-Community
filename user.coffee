axios = require 'axios'

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
      # console.log "💃🏻", self.cachedUser().color
      self.cachedUser().color

    avatarImage: ->
      self.cachedUser().avatarUrl

    recentProjectIds: ->
      recentFiles = self.cachedUser().recentFiles
      recentFiles?.map (recent) ->
        recent.projectId

    getRecentProjects: ->
      recentProjectIds = self.recentProjectIds()?.toString()
      if !recentProjectIds
        return
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
      console.log 'projectFromAPI', projectFromAPI
      project =
        name: projectFromAPI.domain
        projectId: projectFromAPI.id
        domain: projectFromAPI.domain
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
            color: user.color
      return users
        
  if localStorage.cachedUser
    self.getRecentProjects()

  return self
