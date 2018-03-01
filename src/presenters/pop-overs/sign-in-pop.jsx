/*  From sign-in-pop.jade

dialog.pop-over.sign-in-pop(click=@stopPropagation)
  section.pop-over-actions.last-section

    a.button-link(href=@facebookAuthLink)
      .button.button-small Sign in with Facebook
        span.emoji.facebook

    a.button-link(href=@githubAuthLink)
      .button.button-small Sign in with GitHub
        span.emoji.octocat

*/

/*  From sign-in-pop.coffee
# called by header and recent-projects
# TODO should return node, instead of requiring .template()

SignInPopTemplate = require "../../templates/pop-overs/sign-in-pop"

module.exports = (application) ->

  self =
  
    githubAuthLink: ->
      clientId = GITHUB_CLIENT_ID
      scope = "user:email"
      redirectUri = encodeURIComponent "#{APP_URL}/login/github"
      "https://github.com/login/oauth/authorize?client_id=#{clientId}&scope=#{scope}&redirect_uri=#{redirectUri}"

    facebookAuthLink: ->
      clientId = FACEBOOK_CLIENT_ID
      scopes="email"
      callbackURL = encodeURIComponent "#{APP_URL}/login/facebook"
      "https://www.facebook.com/v2.9/dialog/oauth?" +
        "client_id=#{clientId}&scope=#{scopes}&redirect_uri=#{callbackURL}"

    template: ->
      SignInPopTemplate self

    stopPropagation: (event) ->
      event.stopPropagation()

*/

///
/// What follows is the JSX-ified sign-in-pop, being invoked by jadelet!
///

import React from 'react';
/* global GITHUB_CLIENT_ID, FACEBOOK_CLIENT_ID, APP_URL */

// old Jadelet presenter functions can live here:

function githubAuthLink() {
      var clientId, redirectUri, scope;
      clientId = GITHUB_CLIENT_ID;
      scope = "user:email";
      redirectUri = encodeURIComponent(`${APP_URL}/login/github`);
      return `https://github.com/login/oauth/authorize?client_id=${clientId}&scope=${scope}&redirect_uri=${redirectUri}`;
}

function facebookAuthLink() {
  var callbackURL, clientId, scopes;
  clientId = FACEBOOK_CLIENT_ID;
  scopes = "email";
  callbackURL = encodeURIComponent(`${APP_URL}/login/facebook`);
  return "https://www.facebook.com/v2.9/dialog/oauth?" + `client_id=${clientId}&scope=${scopes}&redirect_uri=${callbackURL}`;
}

function stopPropagation(event) {
  return event.stopPropagation();
}

// And then we can replace the jadelet files with React templates here:

const SignInPopButton = (props) => (
  <a className="button-link" href={props.href}>
    <div className="button button-small">Sign in with {props.company}
      <span className={`emoji ${props.emoji}`}></span>
    </div>
  </a>
);

const SignInPop = () => (
  <div className="pop-over sign-in-pop" onClick={stopPropagation}>
    <section className="pop-over-actions last-section">
      <SignInPopButton href={facebookAuthLink()} company="Facebook" emoji="facebook"/>
      <SignInPopButton href={githubAuthLink()} company="GitHub" emoji="octocat"/>
    </section>
  </div>
);

export default SignInPop;
