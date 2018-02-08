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

    checked: (event) ->
      showNewStuff = application.getUserPref 'showNewStuff'
      if showNewStuff? and event?
        application.updateUserPrefs 'showNewStuff', event
      else if showNewStuff?
        return showNewStuff
      else
        application.updateUserPrefs 'showNewStuff', true
        true

    newStuffReadDate: ->
      newStuffReadDate = application.getUserPref 'newStuffReadDate'
      if newStuffReadDate
        new Date newStuffReadDate

    updateNewStuffRead: ->
      application.updateUserPrefs 'newStuffReadId', self.newStuffLog.updates()[0].id
      application.updateUserPrefs 'newStuffReadDate', new Date
      
    hiddenUnlessNewStuffNotificationVisible: ->
      hasNewStuff = self.newStuff.length
      ignoreNewStuff = application.getUserPref 'showNewStuff' == false
      
      'hidden' unless hasNewStuff and
        
    showNewStuffOverlay: ->
      application.overlayNewStuffVisible(true)
    
    
    
  self.getUpdates()
  return OverlayNewStuffTemplate self
