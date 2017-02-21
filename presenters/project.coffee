ProjectTemplate = require "../templates/includes/project"

module.exports = (application, project, category) ->

  templateModel = Object.assign {}, application
  templateModel.category = category
  templateModel.project = project
  
  ProjectTemplate templateModel
