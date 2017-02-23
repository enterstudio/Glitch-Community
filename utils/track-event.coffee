GoogleAnalytics = require 'ga'
ua = "UA-225715-41"
host = 'gomix.me'
ga = new GoogleAnalytics(ua, host)

self =

  #- # ga_help_footer = "javascript: ga('send', {hitType: 'pageview',page: '/internal-links/help/footer-link'});"
  # https://www.npmjs.com/package/ga  
  # @utils.trackEvent.aboutPageFooter

  # @jenn I got rid of the 'new' after community because it won't age well ('new' -> 'new new' -> 'super new'..) and it'll be fine if new and old community stats mix because we'll be filtering by date in ga usually
  # ^ February 23, 2017

  aboutPageFooter: ->
    console.log ga
    ga.trackEvent
      category: 'Community'
      action: 'Footer About Link Clicked'
    
  blogPageFooter: ->
    ga.trackEvent
      category: 'Community'
      action: 'Footer Blog Link Clicked'
    
  helpPageFooter: ->
    ga.trackEvent
      category: 'Community'
      action: 'Footer FAQ Link Clicked'
    
  statusPageFooter: ->
    ga.trackEvent
      category: 'Community'
      action: 'Footer Status Link Clicked'
    
  supportPageFooter: ->
    ga.trackEvent
      category: 'Community'
      action: 'Footer Support Link Clicked'
    
  legalPageFooter: ->
    ga.trackEvent
      category: 'Community'
      action: 'Footer Legal Link Clicked'

  overlayVideo: ->
    ga.trackEvent
      category: 'Community'
      action: 'Video Overlay Opened'

  overlayProject: (project) ->
    ga.trackEvent
      category: 'Community'
      action: 'Project Overlay Opened'
      label: project.projectName

  overlayProjectShow: (project) ->
    ga.trackEvent
      category: 'Community'
      action: 'Project Overlay Show button clicked'
      label: project.projectName
  
  overlayProjectViewCode: (project) ->
    ga.trackEvent
      category: 'Community'
      action: 'Project Overlay View Code button clicked'
      label: project.projectName

  overlayProjectRemix: (project) ->
    ga.trackEvent
      category: 'Community'
      action: 'Project Overlay Remix button clicked'
      label: project.projectName

module.exports = self
