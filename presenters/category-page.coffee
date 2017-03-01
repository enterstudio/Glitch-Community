curated = require "../curated"
CategoryPageTemplate = require "../templates/pages/category-page"
ProjectPresenter = require "./project"

module.exports = (application, category) ->

  self =

    template: ->
      projectElements = application.projectsInCategory(category.id).map (project) ->
        ProjectPresenter(application, project, category)

      templateModel = Object.assign {}, application
      templateModel.category = category
      templateModel.projects = projectElements
      CategoryPageTemplate templateModel

