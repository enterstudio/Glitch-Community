ProjectUsersTemplate = require "../templates/includes/project-users"

module.exports = (application, project) ->

  self =

    users: ->
      project.users
  
    template: ->
      ProjectUsersTemplate self

