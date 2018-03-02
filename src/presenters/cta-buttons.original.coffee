Observable = require 'o_0'

CtaButtonsTemplate = require "../templates/includes/cta-buttons"
CtaPopPresenter = require "./pop-overs/cta-pop"

module.exports = (application) ->

  self =

    ctaPop: CtaPopPresenter application

    toggleCtaPop: ->
      application.ctaPopVisible.toggle()

    hiddenUnlessIsSignedIn: ->
      'hidden' unless application.currentUser().isSignedIn()

  return CtaButtonsTemplate self
