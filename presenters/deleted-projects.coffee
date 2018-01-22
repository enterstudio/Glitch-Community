ProjectItemPresenter = require "./project-item"
DeletedProjectsTemplate = require "../templates/deleted-projects"

module.exports = (application, parent) ->

  self =
  
    deletedProjectsCache: [] 
    wat: Observable []


    sectionTitle: "Deleted Projects"

    deletedProjects: ->
      return "fishsticks"
      if self.deletedProjectsCache().length == 0 
        application.api().get("/user/deleted-projects/").then (response) -> 
          console.log(response)
          deletedProjectsRaw = response.data
          deletedProjects = deletedProjectsRaw.map (project) ->
            project.fetched = true
            Project(project).update(project)

          self.deletedProjectsCache(deletedProjects)
          console.log "got some projects", deletedProjects
        .catch (error) -> 
          console.error 'Failed to get deleted projects', error
      
      console.log 'self.deletedProjectsCache()', self.deletedProjectsCache()
      self.deletedProjectsCache().map (project) ->
        ProjectItemPresenter(application, project, {})


      return DeletedProjectsTemplate self
