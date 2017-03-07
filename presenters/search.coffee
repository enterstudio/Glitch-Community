axios = require 'axios'

SearchPageTemplate = require "../templates/pages/search-page"
ProjectPresenter = require "./project"

module.exports = (application) ->

  self = 

    application: application
    searchQuery: application.searchQuery
    searchResultsProjects: Observable {}
    searchResultsUsers: Observable {}


    
    
    template: ->
      # console.log self
      # SearchPageTemplate self
      # projectElements = application.projectsInCategory(category.id).map (project) ->
      #   ProjectPresenter(application, project, category)

      templateModel = Object.assign {}, application
      # templateModel.category = category
      # templateModel.projects = projectElements
      # templateModel.users = 
      SearchPageTemplate templateModel


      
      
    searchProjects: ->
      query = application.searchQuery()
      # return new Promise (resolve, reject) ->
      searchProjectsUrl = "https://api.gomix.com/projects/search?q=#{query}"
      axios.get searchProjectsUrl
        .then (response) ->
          # console.log 'response', response
          # resolve response.data
          application.searchResultsProjects response.data
        .catch (error) ->
          console.error "searchProjects", error
          # reject error

    searchUsers: ->
      query = application.searchQuery()
      console.log "Q", query
      # return new Promise (resolve, reject) ->
      searchUsersUrl = "https://api.gomix.com/users/search?q=#{query}"
      axios.get searchUsersUrl
        .then (response) ->
          # resolve response.data
          application.searchResultsUsers response.data
        .catch (error) ->
          console.error "searchUsers", error
          # reject error

    searchResultsIsEmpty: ->
      true if application.searchResultsUsers().length + application.searchResultsProjects().length is 0

        
        