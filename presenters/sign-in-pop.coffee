SignInPopTemplate = require "../templates/includes/sign-in-pop"

module.exports = (application) ->

  self = 

    GITHUB_AUTH_LINK: "https://github.com/login/oauth/authorize?client_id=b4cb743ed07e20abf0b2&scope=user:email&redirect_uri=https://gomix.com/community-test/%23!/facebook"
    FACEBOOK_AUTH_LINK: "https://facebook.com/blah/blah"

    template: ->
      SignInPopTemplate self

    stopPropagation: (event) ->
      event.stopPropagation()
