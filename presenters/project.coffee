ProjectTemplate = require "../templates/includes/project"

module.exports = (application, project, category) ->

  self = 
  
    category: category
    project: project
    
    template: ->
      ProjectTemplate self

    projectLink: ->
      if project.isRecentProject
        self.editorLink()
      else
        "/~#{project.domain}"
      
    editorLink: ->
      "https://glitch.com/edit/#!/#{project.domain}"
      
    showProject: (project) ->
      event.preventDefault()
      if project.isRecentProject
        window.location.href = self.editorLink()
      else
        application.showProjectOverlay project

    buttonCtaIfEdit: ->
      if project.isRecentProject
        "button-cta"
