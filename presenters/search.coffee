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
      templateModel.self = self
      SearchPageTemplate templateModel

    searchProjects: ->
      application.searchResultsProjectsLoaded false
      query = application.searchQuery()
      searchProjectsUrl = "https://api.gomix.com/projects/search?q=#{query}"
      axios.get searchProjectsUrl
        .then (response) ->
          application.searchResultsProjects response.data
          application.searchResultsProjectsLoaded true
        .catch (error) ->
          console.error "searchProjects", error

    searchUsers: ->
      application.searchResultsUsersLoaded false
      query = application.searchQuery()
      searchUsersUrl = "https://api.gomix.com/users/search?q=#{query}"
      axios.get searchUsersUrl
        .then (response) ->
          application.searchResultsUsers response.data
          application.searchResultsUsersLoaded true
        .catch (error) ->
          console.error "searchUsers", error

    searchResultsIsLoaded: ->
      true if application.searchResultsProjectsLoaded() and application.searchResultsUsersLoaded()

    searchResultsHasProjects: ->
      true if application.searchResultsProjects().length

    searchResultsHasUsers: ->
      true if application.searchResultsUsers().length      

    hiddenIfSearchResultsLoaded: ->
      'hidden' if self.searchResultsIsLoaded()
  
    hiddenUnlessUsers: ->
      'hidden' unless application.searchResultsUsersLoaded() and self.isSearchResultsUsers()

    hiddenIfNoResults: ->
      'hidden' if (self.searchResultsHasProjects()) or !self.searchResultsIsLoaded()
      # 'hidden' if (self.searchResultsHasProjects() or self.searchResultsHasUsers()) or !self.searchResultsIsLoaded()

