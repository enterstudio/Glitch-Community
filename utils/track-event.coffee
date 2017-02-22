ga = require 'ga'
ua = "UA-XXX"
host = 'nodega.jga.me'
ga = new GoogleAnalytics(ua, host)

self =

  #- # ga_help_footer = "javascript: ga('send', {hitType: 'pageview',page: '/internal-links/help/footer-link'});"
  
  # @utils.trackEvent.aboutPageFooter

  aboutPageFooter: ->
    ga.trackEvent
      category: 'Videos',
      action: 'Video Loading',
      label: 'Gone With the Wind',
      value: 42
    

    
module.exports = self
