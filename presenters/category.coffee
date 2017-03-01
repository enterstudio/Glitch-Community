CategoryTemplate = require "../templates/includes/category"
ProjectPresenter = require "./project"

module.exports = (application, category) ->

  self =

    template: ->
      projectElements = application.projectsInSelectedCategory(category.id).map (project) ->
        ProjectPresenter(application, project, category)

      templateModel = Object.assign {}, category
      templateModel.projects = projectElements
      CategoryTemplate templateModel
