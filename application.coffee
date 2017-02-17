_ = require 'underscore'

search = require "./utils/search"
curated = require "./curated"


console.log curated

self = 
  utils:
    search: search
    remixLink: (projectName, projectId) ->
      "https://gomix.com/#!/remix/#{projectName}/#{projectId}"

  featuredProjects: ->
    _.shuffle curated.featured()

  shuffledCategories: ->
    MAX_CATEOGIES_DISPLAYED = 3
    shuffledCategories = _.shuffle curated.categories()
    shuffledCategories.slice(0, MAX_CATEOGIES_DISPLAYED)

  projectsInCategory: (categoryId) -> 
    MAX_PROJECTS_PER_CATEGORY = 3
    projectsInCategory = _.filter curated.projects(), (project) ->
      _.contains project.categoryIds, categoryId
    shuffledProject = _.shuffle projectsInCategory
    shuffledProject.slice(0, MAX_PROJECTS_PER_CATEGORY)
      # project
    # projects = _.where curated.projects(),
    #   categoryId: categoryId
    # console.log projectsInCategory
    # shuffle

#   shuffledProjects: (categoryId) ->
#     MAX_PROJECTS_PER_CATEGORY = 3
#     console.log "x", categoryId
    
#     shuffledProjects = _.shuffle projects
#     shuffledProjects.slice(0, MAX_PROJECTS_PER_CATEGORY)
    


module.exports = self
