ProjectItemPresenter = require "./project-item"
DeletedProjectsListTemplate = require "../templates/deleted-projects-list"

module.exports = (application, title, projects) ->

  self =
  
    deletedProjectsCache: Observable []

    sectionTitle: "Deleted Projects"

    projects: ->
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

    visibleIfNoPins: ->
      if title is 'Pinned Projects' and projects.length is 0
        'visible'

    hiddenUnlessTitleIsPinned: ->
      'hidden' unless title is 'Pinned Projects'


  return DeletedProjectsListTemplate self
