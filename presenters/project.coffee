ProjectTemplate = require "../templates/includes/project"

self = (application, project, category) ->

  template: ->
    templateModel = Object.assign {}, application
    templateModel.category = category
    templateModel.project = project
    ProjectTemplate templateModel
  
module.exports = self
