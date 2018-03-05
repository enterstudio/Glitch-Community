// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const Observable = require('o_0');

const CtaButtonsTemplate = require("../templates/includes/cta-buttons");
const CtaPopPresenter = require("./pop-overs/cta-pop");

module.exports = function(application) {

  const self = {

    ctaPop: CtaPopPresenter(application),

    toggleCtaPop() {
      return application.ctaPopVisible.toggle();
    },

    hiddenUnlessIsSignedIn() {
      if (!application.currentUser().isSignedIn()) { return 'hidden'; }
    }
  };

  return CtaButtonsTemplate(self);
};
