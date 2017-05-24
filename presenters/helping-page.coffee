HelpingPageTemplate = require "../templates/pages/helping-page"

module.exports = (application) ->
  self =
    template: ->
      try
        console.log 'calling HelpingPageTemplate'
        templateModel = Object.assign {}, application
        HelpingPageTemplate templateModel
      catch error
        "helping-page"
