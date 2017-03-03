ProjectTemplate = require "../templates/includes/project"

self = (application, project, category) ->

  template: ->
    # console.log "🎏",@
    # console.log self()
    templateModel = Object.assign {}, application
    templateModel.category = category
    templateModel.project = project
    # templateModel.self = self()
    templateModel.projectName = self().projectName project
    ProjectTemplate templateModel
  
  projectName: (project) ->
    console.log 'hi', project
    # if project.name
    project.domain
    # else
    #   project.domain

module.exports = self
