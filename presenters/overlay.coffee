OverlayTemplate = require "../templates/includes/overlay"

# methods for md, videoplaying, what child to render based on observables

module.exports = (application, category) ->
  templateModel = Object.assign {}, application
  templateModel.project = project
  
  OverlayTemplate templateModel
