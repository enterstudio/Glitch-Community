CategoryTemplate = require "../templates/includes/category"
# ProjectTemplate = require "../templates/includes/project"

ProjectPresenter = require "./project"

module.exports = (context, category) ->

  projectElements = context.projectsInSelectedCategory(category.id).map (project) ->
    # ProjectTemplate(project, category)
    ProjectPresenter(context, project, category)
  
  templateModel = Object.assign {}, category
  templateModel.projects = projectElements


  console.log "😇", templateModel
  
  CategoryTemplate templateModel

