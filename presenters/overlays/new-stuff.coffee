"use strict"

moment = require 'moment'
markdown = require('markdown-it')({html: true})
  .use(require('markdown-it-sanitizer'))
Observable = require 'o_0'

OverlayNewStuffTemplate = require "../../templates/overlays/new-stuff"


module.exports = (application) ->

  #application.newStuffOverlayVisible.observe ->
#    if application.newStuffOverlayVisible() is true
#      self.getUpdates()
#      self.updateNewStuffRead()

  self =

    newStuffLog: require('../new-stuff-log')(self)
    
    checkIfNewStuffVisible: Observable false
    newStuffNotificationVisible: Observable false
    newStuff: Observable []
    
    mdToNode: (md) ->
      node = document.createElement 'span'
      node.innerHTML = markdown.render md
      return node

    visibility: ->
      "hidden" unless self.newStuffOverlayVisible()
        
    newStuffOverlayVisibile: ->
      true

    getUpdates: ->
      MAX_UPDATES = 3
      updates = self.newStuffLog.updates()
      newStuffReadId = application.getUserPref 'newStuffReadId'
      totalUpdates = self.newStuffLog.totalUpdates()
      unread = totalUpdates - newStuffReadId
      latestStuff = updates.slice(0, MAX_UPDATES)

      if newStuffReadId
        newStuff = updates.slice(0, unread)
        self.newStuff newStuff
      else
        self.newStuff latestStuff
      if self.newStuff().length is 0
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
      application.updateUserPrefs 'newStuffReadId', application.newStuffLog.updates()[0].id
      application.updateUserPrefs 'newStuffReadDate', new Date
      
  return OverlayNewStuffTemplate self