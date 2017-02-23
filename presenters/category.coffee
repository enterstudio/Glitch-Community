CategoryTemplate = require "../templates/includes/category"
ProjectPresenter = require "./project"

self = (application, category) ->

  template: ->
    projectElements = application.projectsInSelectedCategory(category.id).map (project) ->
      ProjectPresenter(application, project, category)

    templateModel = Object.assign {}, category
    templateModel.projects = projectElements
    CategoryTemplate templateModel

module.exports = self

