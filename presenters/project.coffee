ProjectTemplate = require "../templates/includes/project"

self = (application, project, category) ->

  template: ->
    console.log 'project template box rendered'
    templateModel = Object.assign {}, application
    templateModel.category = category
    templateModel.project = project
    ProjectTemplate templateModel

module.exports = self
