HelpingPageTemplate = require "../templates/pages/helping-page"

module.exports = (application) ->
  self =
    template: ->
        templateModel = Object.assign {}, application
        HelpingPageTemplate templateModel
