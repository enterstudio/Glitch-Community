CtaButtonsTemplate = require "../templates/includes/cta-buttons"
CtaPop = require "./pop-overs/cta-pop"

module.exports = (application) ->

  self =

    ctaPop: CtaPop(application)

    toggleCtaPop: ->
      application.ctaPopVisible.toggle()

    hiddenUnlessIsSignedIn: ->
      'hidden' unless application.currentUser().isSignedIn()
        
  return CtaButtonsTemplate self
