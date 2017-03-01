axios = require 'axios'

module.exports = (application) ->

  self = 

    cachedUser: ->
      console.log '👺', JSON.parse(localStorage.cachedUser)
      JSON.parse(localStorage.cachedUser)
  
    isSignedIn: ->
      true if self.cachedUser().login

    avatarColor: ->
      self.cachedUser().color
        
    recentProjectIds: ->
      recentFiles = self.cachedUser().recentFiles
      recentFiles.map (recent) ->
        recent.projectId

    recentProjects: ->
      recentProjectIds = self.recentProjectIds().toString()
      projectInfoUrl = "https://api.gomix.com/projects/byIds?ids=#{recentProjectIds}"
      axios.get projectInfoUrl
      .then (response) ->
        projects = response.data.map (project) ->
          project
        console.log projects # send these to the presenter
        # userProjectsLoaded observable?
      .catch (error) ->
        console.error "recentProjects", error
