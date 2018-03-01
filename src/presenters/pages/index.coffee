IndexTemplate = require "../../templates/pages/index"
LayoutPresenter = require "../layout"
WhatIsGlitchPresenter = require "../what-is-glitch"
CtaButtonsPresenter = require "../cta-buttons"
HeaderPresenter = require "../header"
FeaturedCollectionPresenter = require "../featured-collection"

module.exports = (application) ->
  console.log "Presented index"
  
  self =
    application: application
    projects: application.projects
    
    user: application.user

    whatIsGlitch: ->
      WhatIsGlitchPresenter(application)

    ctaButtons: ->
      CtaButtonsPresenter(application)

    header: ->
      HeaderPresenter(application)

    currentUser: application.currentUser

#     featuredProjects: ->
#       application.featuredProjects()
      
    featuredCollections: ->
      application.featuredCollections.map (collection) ->
        FeaturedCollectionPresenter application, collection

    randomCategories: ->
      application.categories().filter (category) ->
        category.hasProjects()

    categories: ->
      application.categories()

  content = IndexTemplate(self)

  return LayoutPresenter application, content
