"use strict"

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
      
      latestStuff = updates.slice(0, MAX_UPDATES)
      self.newStuff latestStuff

      hasNewStuff = true
      if newStuffReadId
        unread = totalUpdates - newStuffReadId
        newStuff = updates.slice(0, unread)
        unless unread == 0
          self.newStuff newStuff
          hasNewStuff = true
      else 
        
      
      isSignedIn = application.currentUser().isSignedIn()
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

    updateNewStuffRead: ->
      application.updateUserPrefs 'newStuffReadId', self.newStuffLog.totalUpdates()
      
    hiddenUnlessNewStuffNotificationVisible: ->
      'hidden' unless self.newStuffNotificationVisible()
        
    showNewStuffOverlay: ->
      application.overlayNewStuffVisible(true)

  self.getUpdates()
  return OverlayNewStuffTemplate self
