"use strict"

moment = require 'moment'

module.exports = (application) ->

  application.newStuffOverlayVisible.observe ->
    if application.newStuffOverlayVisible() is true
      self.getUpdates()
      self.updateNewStuffRead()

  self =

    newStuff: application.newStuff

    mdToNode: application.mdToNode

    visibility: ->
      "hidden" unless application.newStuffOverlayVisible()

    getUpdates: ->
      MAX_UPDATES = 3
      updates = application.newStuffLog.updates()
      newStuffReadId = application.getUserPref 'newStuffReadId'
      totalUpdates = application.newStuffLog.totalUpdates()
      unread = totalUpdates - newStuffReadId
      latestStuff = updates.slice(0, MAX_UPDATES)

      if newStuffReadId
        newStuff = updates.slice(0, unread)
        application.newStuff newStuff
      else
        application.newStuff latestStuff
      if application.newStuff().length is 0
        application.newStuff latestStuff

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
