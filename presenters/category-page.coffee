CategoryPageTemplate = require "../templates/pages/category-page"
ProjectPresenter = require "./project"

module.exports = (application, category) ->
  # get the projects of this category based on the curatedName property of the category
  projects = application.projectsInCategory(category.curatedName)
  self =
    template: ->
      try
        projectElements = projects.map (project) ->
          ProjectPresenter(application, project, category)

        templateModel = Object.assign {}, application
        templateModel.category = category
        templateModel.projects = projectElements
        CategoryPageTemplate templateModel
      catch error
        "#{category.curatedName}"