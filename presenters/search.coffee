axios = require 'axios'

SearchPageTemplate = require "../templates/pages/search-page"
ProjectPresenter = require "./project"

module.exports = (application, query) ->

  self = 

    application: application

    template: ->
      self.searchProjects(query).then (results) ->
        application.searchResultsProjects results
      self.searchUsers(query).then (results) ->
        application.searchResultsUsers results
        SearchPageTemplate self
      .catch (error) ->
        console.error error

    searchProjects: (query) ->
      console.log "Q", query
      return new Promise (resolve, reject) ->
        searchProjectsUrl = "https://api.gomix.com/projects/search?q=#{query}"
        axios.get searchProjectsUrl
          .then (response) ->
            resolve response.data
          .catch (error) ->
            console.error "searchProjects", error
            reject error

    searchUsers: (query) ->
      return new Promise (resolve, reject) ->
        searchUsersUrl = "https://api.gomix.com/users/search?q=#{query}"
        axios.get searchUsersUrl
          .then (response) ->
            resolve response.data
          .catch (error) ->
            console.error "searchUsers", error
            reject error

    searchResultsIsEmpty: ->
      true if application.searchResultsUsers().length + application.searchResultsProjects().length is 0

        
        