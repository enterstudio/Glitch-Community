GoogleAnalytics = require 'ga'
ua = "UA-XXX"
host = 'nodega.jga.me'
ga = new GoogleAnalytics(ua, host)

self =

  #- # ga_help_footer = "javascript: ga('send', {hitType: 'pageview',page: '/internal-links/help/footer-link'});"
  # https://www.npmjs.com/package/ga  
  # @utils.trackEvent.aboutPageFooter

  aboutPageFooter: ->
    ga.trackPage '/internal-links/help/footer-link'
  
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
