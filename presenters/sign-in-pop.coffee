SignInPopTemplate = require "../templates/includes/sign-in-pop"

module.exports = (application) ->

  self =
  
    githubAuthLink: ->
      clientId = "b4cb743ed07e20abf0b2"
      scope = "user:email,repo"
      redirectUri = "https://gomix.com/community-test/login/github"
      "https://github.com/login/oauth/authorize?client_id=#{clientId}&scope=#{scope}&redirect_uri=#{redirectUri}"

    facebookAuthLink: ->
      callbackURL = "https://gomix.com/community-test/login/facebook"
      "https://api.gomix.com/auth/facebook?callbackURL=#{callbackURL}"

    template: ->
      SignInPopTemplate self

    stopPropagation: (event) ->
      event.stopPropagation()
