HeaderTemplate = require "../templates/includes/header"

module.exports = (application) ->

  self = 
    application: application
  
    template: ->
      HeaderTemplate self

    toggleSignInPopVisible: (event) ->
      application.signInPopVisible.toggle()
      event.stopPropagation()

    showVideoOverlay: ->
      application.overlay.showVideoOverlay()
