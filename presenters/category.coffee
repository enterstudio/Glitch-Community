CategoryTemplate = require "../templates/includes/category"
ProjectPresenter = require "./project"

module.exports = (application, category) ->
  # get the projects of this category based on the curatedName property of the category
  projects = application.projectsInSelectedCategory(category.curatedName)
  self =
    template: ->
      try
        projectElements = projects.map (project) ->
          ProjectPresenter(application, project, category)

        templateModel = Object.assign {}, category
        templateModel.projects = projectElements
        CategoryTemplate templateModel
      catch error
        "#{category.curatedName} #{error}"
