GoogleAnalytics = require 'ga'
ua = "UA-225715-41"
host = 'gomix.me'
ga = new GoogleAnalytics(ua, host)

self =

  #- # ga_help_footer = "javascript: ga('send', {hitType: 'pageview',page: '/internal-links/help/footer-link'});"
  # https://www.npmjs.com/package/ga  
  # @utils.trackEvent.aboutPageFooter

  aboutPageFooter: ->
    console.log ga
    ga.trackEvent
      category: 'Community New'
      action: 'Footer About Link Clicked'
    
  blogPageFooter: ->
    ga.trackEvent
      category: 'Community New'
      action: 'Footer Blog Link Clicked'
    
  helpPageFooter: ->
    ga.trackEvent
      category: 'Community New'
      action: 'Footer FAQ Link Clicked'
    
  statusPageFooter: ->
    ga.trackEvent
      category: 'Community New'
      action: 'Footer Status Link Clicked'
    
  supportPageFooter: ->
    ga.trackEvent
      category: 'Community New'
      action: 'Footer Support Link Clicked'
    
  legalPageFooter: ->
    ga.trackEvent
      category: 'Community New'
      action: 'Footer Legal Link Clicked'
  
  openVideoOverlay: ->
    ga.trackEvent
      category: 'Community'
      action: 'Video Overlay Opened'

  openProjectOverlay: (project) ->
    ga.trackEvent
      category: 'Community'
      action: 'Project Overlay Opened'
      label: 'project-name'

module.exports = self
