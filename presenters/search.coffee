  # getSearchResults: (url) ->
    
SearchPageTemplate = require "../templates/pages/search-page"
ProjectPresenter = require "./project"

# SignInPopTemplate = require "../templates/includes/sign-in-pop"

module.exports = (application) ->

  self = 

    application: application

    template: ->
      SearchPageTemplate self