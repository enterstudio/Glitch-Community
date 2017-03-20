SignInPopTemplate = require "../templates/pop-overs/sign-in-pop"

module.exports = (application) ->

  self =
  
    githubAuthLink: ->
      clientId = "b4cb743ed07e20abf0b2"
      scope = "user:email"
      redirectUri = "https://glitch.com/login/github"
      "https://github.com/login/oauth/authorize?client_id=#{clientId}&scope=#{scope}&redirect_uri=#{redirectUri}"

    facebookAuthLink: ->
      callbackURL = "https://glitch.com/login/facebook"
      "https://api.glitch.com/auth/facebook?callbackURL=#{callbackURL}"

    template: ->
      SignInPopTemplate self

    stopPropagation: (event) ->
      event.stopPropagation()
