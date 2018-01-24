ProjectItemPresenter = require "./project-item"
ProjectsListTemplate = require "../templates/projects-list"

module.exports = (application, title, projects, userPagePresenter) ->

  self =

    sectionTitle: title

    projects: ->
      projects.map (project) ->
        ProjectItemPresenter(application, project, {}, userPagePresenter)

    visibleIfNoPins: ->
      if title is 'Pinned Projects' and projects.length is 0
        'visible'

    hiddenUnlessTitleIsPinned: ->
      'hidden' unless title is 'Pinned Projects'


  return ProjectsListTemplate self
