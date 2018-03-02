moment = require 'moment'

HeaderTemplate = require "../templates/includes/header"
import UserOptionsPop from "./pop-overs/user-options-pop.jsx"

import SignInPop from "./pop-overs/sign-in-pop.jsx"
import {render, unmountComponentAtNode} from 'react-dom'
import React from 'react'

module.exports = (application) ->
  
  getTeamsPojo = (teams) -> 
    unless teams && teams.length
      return []
    
    # https://our.manuscript.com/f/cases/3292168/
    # teams is inconsistent;
    # pending a fix, let's normalize that here.
    # Just need to extract name, url, and teamAvatarUrl
    # trouble is they're inconsistently functions, strings, or undefined
    return teams.map (team) ->
      extract = (prop) ->
        item = team[prop]
        if typeof(item) == "string"
          return item
        else if typeof(item) == "function"
          return item()
        else if typeof(item) == "undefined"
          return ""
        else
          console.error "Unxpected team property type", item, typeof(item)
    
      return 
        name: extract("name")
        url: extract("url")
        teamAvatarUrl: extract("teamAvatarUrl")
  
  # React will complain/break if non-react components remove a react component
  # from the dom.  We heal that by observing and cleaning up here:
  application.userOptionsPopVisible.observe ->
    if application.userOptionsPopVisible() is false
      unmountComponentAtNode(document.getElementById(self.userOptionsPopContainerId))

  self =

    application: application
    baseUrl: application.normalizedBaseUrl()
  
    toggleSignInPopVisible: (event) ->
      application.signInPopVisibleOnHeader.toggle()
      event.stopPropagation()

    toggleUserOptionsPopVisible: (event) ->
      application.userOptionsPopVisible.toggle()
      event.stopPropagation()

    hiddenUnlessUserIsExperienced: ->
      'hidden' unless application.currentUser().isAnExperiencedUser()
      
    hiddenUnlessSignInPopVisible: ->
      'hidden' unless application.signInPopVisibleOnHeader()

    userAvatar: ->
      application.currentUser().avatarUrl()

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

    hiddenIfSignedIn: ->
      'hidden' if application.currentUser().login()
        
    hiddenUnlessSignedIn: ->
      'hidden' unless application.currentUser().login()
        
    SignInPop: (containerId) ->
      setTimeout () => 
        render(
          React.createElement(SignInPop, null),
          document.getElementById(containerId)
        )

    userOptionsPopContainerId: 'userOptionsPopContainer'

    UserOptionsPop: (visible) ->
      props =
        visible: visible
        teams: getTeamsPojo(application.currentUser().teams()),
        profileLink: "/@#{application.currentUser().login()}",
        avatarUrl: application.currentUser().avatarUrl(),
        showNewStuffOverlay: ->
          application.userOptionsPopVisible(false)
          application.overlayNewStuffVisible(true)
        signOut: ->
          analytics.track("Logout");
          analytics.reset();
          localStorage.removeItem('cachedUser');
          return location.reload();

      setTimeout () => 
        render(
          React.createElement(UserOptionsPop, props),
          document.getElementById(self.userOptionsPopContainerId)
        )
    
    submit: (event) ->
      if event.target.children.q.value.trim().length is 0
        event.preventDefault()
        
  return HeaderTemplate self
