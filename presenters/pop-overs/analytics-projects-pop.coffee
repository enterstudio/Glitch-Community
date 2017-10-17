Observable = require 'o_0'
# _ = require 'underscore'

AnalyticsProjectsPopTemplate = require "../../templates/pop-overs/analytics-projects-pop"

module.exports = (application, analytics) ->

  self =
  
    application: application  
    teamProjects: Observable application.team().projects()
    analytics: analytics

    # hiddenUnlessAnalyticsProjectsPopVisible: ->
    #   'hidden' unless application.analyticsProjectsPopVisible()
    
    stopPropagation: (event) ->
      event.stopPropagation()

    filter: (event) ->
      query = event.target.value.trim()
      projects = application.team().projects()
      if query.length
        filtered = projects.filter (project) ->
          project.domain().match(query) or project.description().match(query)
        self.teamProjects filtered
      else
        self.teamProjects projects

    spacekeyDoesntClosePop: (event) ->
      event.stopPropagation()
      event.preventDefault()

    activeIfAllProjects: ->
      'active' if analytics.analyticsProjectDomain() is 'All Projects'

    selectAllProjects: ->
      analytics.analyticsProjectDomain 'All Projects'
        
  return AnalyticsProjectsPopTemplate self
