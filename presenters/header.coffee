moment = require 'moment'

HeaderTemplate = require "../templates/includes/header"

module.exports = (application) ->

  console.log "⛵️ baseUrl is ", baseUrl
  self = 
    application: application
    baseUrl: application.normalizedBaseUrl()
  
    template: ->
      HeaderTemplate self

    toggleSignInPopVisible: (event) ->
      application.signInPopVisibleOnHeader.toggle()
      event.stopPropagation()

    toggleUserOptionsPopVisible: (event) ->
      application.userOptionsPopVisible.toggle()
      event.stopPropagation()

    showVideoOverlay: ->
      application.overlay.showVideoOverlay()

    hiddenIfUserIsSignedIn: ->
      'hidden' if application.user.isSignedIn()

    hiddenUnlessUserIsSignedIn: ->
      'hidden' unless application.user.isSignedIn()
      
    popHiddenUnlessSignInPopVisible: ->
      'hidden' unless application.signInPopVisibleOnHeader()

    userAvatar: ->
      application.user.avatarImage()

    logo: ->
      LOGO_DAY = "https://cdn.gomix.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Flogo-day.svg"
      LOGO_SUNSET = "https://cdn.gomix.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Flogo-sunset.svg"
      LOGO_NIGHT = "https://cdn.gomix.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Flogo-night.svg"
      hour = moment().format('HH')
      if hour >= 16 and hour <=18
        LOGO_SUNSET
      else if hour > 18 or hour <= 8
        LOGO_NIGHT
      else
        LOGO_DAY
      
    # userPageLink: ->
    #   userName = application.user.userName()
    # "/@#{userName}"
