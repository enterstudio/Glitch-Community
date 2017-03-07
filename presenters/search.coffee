axios = require 'axios'

SearchPageTemplate = require "../templates/pages/search-page"
ProjectPresenter = require "./project"

module.exports = (application, query) ->

  self = 

    application: application

    template: ->
      # self.results = self.getSearchResults query
      SearchPageTemplate self
    
    searchProjects: (query) ->
      searchProjectsUrl = "https://api.gomix.com/projects/search?q=#{query}"
      axios.get searchProjectsUrl
        .then (response) ->
          application.searchResultsProjects response.data
        .catch (error) ->
          console.error "searchProjects", error

    searchUsers: (query) ->
      searchUsersUrl = "https://api.gomix.com/users/search?q=#{query}"
      axios.get searchUsersUrl
        .then (response) ->
          application.searchResultsUsers response.data
        .catch (error) ->
          console.error "searchUsers", error

    searchResultsIsEmpty: ->
      true if application.searchResultsUsers().length + application.searchResultsProjects().length is 0