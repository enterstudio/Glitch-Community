// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const WhatIsGlitchTemplate = require("../templates/includes/what-is-glitch");

module.exports = function(application) {

  const self = {
    baseUrl: application.normalizedBaseUrl(),

    hiddenIfUserIsSignedIn() {
      if (application.currentUser().isSignedIn()) { return 'hidden'; }
    },

    showVideoOverlay(event) {
      application.overlayVideoVisible(true);
      document.getElementsByClassName('video-overlay')[0].focus();
      return event.stopPropagation();
    }
  };

  return WhatIsGlitchTemplate(self);
};
