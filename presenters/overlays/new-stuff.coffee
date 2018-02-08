"use strict"

moment = require 'moment'
markdown = require('markdown-it')({html: true})
  .use(require('markdown-it-sanitizer'))
Observable = require 'o_0'

OverlayNewStuffTemplate = require "../../templates/overlays/new-stuff"

module.exports = (application) ->
  
  application.overlayNewStuffVisible.observe ->
    if application.overlayNewStuffVisible() is true
      self.updateNewStuffRead()
      self.newStuffNotificationVisible(false)

  self =

    newStuffLog: require('../new-stuff-log')(self)
    
    newStuffNotificationVisible: Observable false
    newStuff: Observable []
    
    mdToNode: (md) ->
      node = document.createElement 'span'
      node.innerHTML = markdown.render md
      return node

    visibility: ->
      "hidden" unless application.overlayNewStuffVisible()
        
    getUpdates: ->
      MAX_UPDATES = 3
      updates = self.newStuffLog.updates()
      newStuffReadId = application.getUserPref 'newStuffReadId'
      totalUpdates = self.newStuffLog.totalUpdates()

      if newStuffReadId
        unread = totalUpdates - newStuffReadId
        newStuff = updates.slice(0, unread)
        self.newStuff newStuff
      else 
        latestStuff = updates.slice(0, MAX_UPDATES)
        self.newStuff latestStuff
      
      isSignedIn = application.currentUser().isSignedIn()
      hasNewStuff = self.newStuff.length
      ignoreNewStuff = application.getUserPref('showNewStuff') == false
      visible = isSignedIn and hasNewStuff and not ignoreNewStuff
      
      self.newStuffNotificationVisible(visible)


    checked: (event) ->
      showNewStuff = application.getUserPref 'showNewStuff'
      if showNewStuff? and event?
        application.updateUserPrefs 'showNewStuff', event
      else if showNewStuff?
        return showNewStuff
      else
        application.updateUserPrefs 'showNewStuff', true
        true

    updateNewStuffRead: ->
      application.updateUserPrefs 'newStuffReadId', self.newStuffLog.updates()[0].id
      
    hiddenUnlessNewStuffNotificationVisible: ->
      'hidden' unless self.newStuffNotificationVisible()
        
    showNewStuffOverlay: ->
      application.overlayNewStuffVisible(true)

  self.getUpdates()
  return OverlayNewStuffTemplate self
