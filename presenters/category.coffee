CategoryTemplate = require "../templates/includes/category"
ProjectTemplate = require "../templates/includes/project"

module.exports = (context, category) ->

  projectElements = context.projectsInSelectedCategory(category.id).map (project) ->
    ProjectTemplate(project, category)
  
  templateModel = Object.assign {}, category
  templateModel.projects = projectElements
  templateModel.category = category
  
  CategoryTemplate templateModel
