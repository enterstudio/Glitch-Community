HeaderTemplate = require "../templates/includes/header"

module.exports = (application) ->

  self = 
    application: application
  
    template: ->
      HeaderTemplate self

    toggleSignInPopVisible: (event) ->
      console.log application
      application.signInPopVisible.toggle()
      console.log application.signInPopVisible()
      event.stopPropagation()

    showVideoOverlay: ->
      application.overlay.showVideoOverlay()
