CtaButtonsTemplate = require "../templates/includes/cta-buttons"

module.exports = (application) ->

  self = 

    template: ->
      CtaButtonsTemplate self

    hiddenUnlessIsSignedIn: ->
      'hidden' unless application.user.isSignedIn()
        
    trackNewProject: ->
      analytics.track "Create Project"
