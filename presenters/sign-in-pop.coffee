SignInPopTemplate = require "../templates/includes/sign-in-pop"

module.exports = (application) ->

  self = 

    template: ->
      SignInPopTemplate self

    hiddenUnlessSignInPopVisibile: ->
      'hidden' unless application.signInPopVisible()

    stopPropagation: (event) ->
      event.stopPropagation()
