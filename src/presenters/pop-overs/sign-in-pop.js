// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
// called by header and recent-projects
// TODO should return node, instead of requiring .template()

const SignInPopTemplate = require("../../templates/pop-overs/sign-in-pop");

module.exports = function(application) {

  let self;
  return self = {
  
    githubAuthLink() {
      const clientId = GITHUB_CLIENT_ID;
      const scope = "user:email";
      const redirectUri = encodeURIComponent(`${APP_URL}/login/github`);
      return `https://github.com/login/oauth/authorize?client_id=${clientId}&scope=${scope}&redirect_uri=${redirectUri}`;
    },

    facebookAuthLink() {
      const clientId = FACEBOOK_CLIENT_ID;
      const scopes="email";
      const callbackURL = encodeURIComponent(`${APP_URL}/login/facebook`);
      return "https://www.facebook.com/v2.9/dialog/oauth?" +
        `client_id=${clientId}&scope=${scopes}&redirect_uri=${callbackURL}`;
    },

    template() {
      return SignInPopTemplate(self);
    },

    stopPropagation(event) {
      return event.stopPropagation();
    }
  };
};
