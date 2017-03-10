UserOptionsPopTemplate = require "../templates/pop-overs/user-options-pop"

module.exports = (application) ->

  self =
  
    template: ->
      UserOptionsPopTemplate self

    stopPropagation: (event) ->
      event.stopPropagation()

    hiddenUnlessSignInPopVisible: ->
      'hidden'