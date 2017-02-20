CategoryTemplate = require "../templates/includes/category"
ProjectTemplate = require "../templates/includes/project"

module.exports = (context, category) ->
  console.log category

  projectElements = context.projectsInCategory(category.id).map (project) ->
    ProjectTemplate(project)
  
  templateModel = Object.assign {}, category
  templateModel.projects = projectElements

  console.log `projectElements`, projectElements
  
  CategoryTemplate templateModel
