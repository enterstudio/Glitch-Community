OverlayTemplate = require "../templates/includes/overlay"

module.exports = (application, category) ->
  templateModel = Object.assign {}, application
  templateModel.project = project
  
  OverlayTemplate templateModel
