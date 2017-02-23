OverlayTemplate = require "../templates/includes/overlay"

self = (application) ->

  template: ->
    console.log 'overlay template', application # leaks
    templateModel = Object.assign {}, application
    templateModel.self = self application
    templateModel.trackEvent = application.utils.trackEvent
    OverlayTemplate templateModel
  
  isOverlayHidden: ->
    "hidden" unless application.overlayVisible()
      
  stopPropagation: (event) ->
    event.stopPropagation()

  warningIfReadmeError: ->
    "warning" if application.overlayReadmeError()

  hiddenUnlessOverlayReadmeLoaded: ->
    'hidden' unless application.overlayReadmeLoaded()

      
      
      
      
      
      
  projectThoughtsMailto: (projectName, projectId) ->
    support = "customer-service@fogcreek.com"
    subject = "[Glitch] I have feelings about #{projectName}"
    body = """
      What do you think of the #{projectName} project? 
      Is it great? Should we feature it? Is it malicious?

      Let us know:





      --------------------

      Thanks 💖

      – Glitch Team

      (project id: #{projectId})
    """
    encodeURI "mailto:#{support}?subject=#{subject}&body=#{body}"


module.exports = self


