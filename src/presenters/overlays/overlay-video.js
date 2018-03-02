// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const OverlayVideoTemplate = require("../../templates/overlays/overlay-video");

module.exports = function(application) {

  const self = {     
    application,
    
    hiddenUnlessOverlayVideoVisible() {
      if (!application.overlayVideoVisible()) { return "hidden"; }
    },

    stopPropagation(event) {
      return event.stopPropagation();
    }
  };

  return OverlayVideoTemplate(self);
};
