UserOptionsPopTemplate = require "../templates/pop-overs/user-options-pop"

module.exports = (application) ->

  self =
  
    template: ->
      UserOptionsPopTemplate self

    stopPropagation: (event) ->
      event.stopPropagation()

    hiddenUnlessUserOptionsPopVisible: ->
      'hidden' unless application.userOptionsPopVisible()

    signOut: ->
      analytics.reset()
      localStorage.removeItem('cachedUser')
      location.reload()
