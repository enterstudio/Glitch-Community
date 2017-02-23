OverlayTemplate = require "../templates/includes/overlay"

# methods for md, videoplaying, what child to render based on observables

module.exports = (application, project) ->
  templateModel = Object.assign {}, application
  templateModel.self = self
  templateModel.project = application.overlayProject()
  
  OverlayTemplate templateModel

self = 

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

