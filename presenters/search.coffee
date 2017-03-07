axios = require 'axios'

SearchPageTemplate = require "../templates/pages/search-page"
ProjectPresenter = require "./project"

module.exports = (application) ->

  self = 

    application: application
    
    template: ->
      self.searchUsers()
      self.searchProjects()
      templateModel = Object.assign {}, application
      SearchPageTemplate templateModel

    searchProjects: ->
      query = application.searchQuery()
      searchProjectsUrl = "https://api.gomix.com/projects/search?q=#{query}"
      axios.get searchProjectsUrl
        .then (response) ->
          application.searchResultsProjects response.data
        .catch (error) ->
          console.error "searchProjects", error

    searchUsers: ->
      query = application.searchQuery()
      console.log "Q", query
      searchUsersUrl = "https://api.gomix.com/users/search?q=#{query}"
      axios.get searchUsersUrl
        .then (response) ->
          application.searchResultsUsers response.data
        .catch (error) ->
          console.error "searchUsers", error
        
        