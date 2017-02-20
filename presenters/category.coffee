CategoryTemplate = require "../templates/includes/category"
ProjectTemplate = require "../templates/includes/project"

module.exports = (context, category) ->
  console.log category
  projectElements = context.projectsInCategory(category.id).map (project) ->
    ProjectTemplate(project, category)
  
  viewModel = Object.assign {}, category
  viewModel.projects = projectElements

  CategoryTemplate viewModel
