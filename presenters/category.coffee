CategoryTemplate = require "../templates/category"
ProjectTemplate = require "../templates/includes/project"

module.exports = (context, category) ->
  projectElements = context.projectsInCategory(category.id).map (project) ->
    ProjectTemplate(project)
  
  viewModel = Object.assign {}, category
  viewModel.projects = projectElements

  CategoryTemplate viewModel
