// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const CtaPopTemplate = require("../../templates/pop-overs/cta-pop");

module.exports = function(application) {

  const self = {

    newProjectLink: `${EDITOR_URL}#!/new-project`,
    newWebsiteLink: `${EDITOR_URL}#!/remix/hello-website`,
    
    trackNewProject() {
      analytics.track("New Project Clicked",
        {projectType: "node app"});
      // return true means "follow href"
      return true;
    },
    
    trackNewWebsite() {
      analytics.track("New Project Clicked",
        {projectType: "static app"});
      // return true means "follow href"
      return true;
    },

    hiddenUnlessCtaPopVisible() {
      if (!application.ctaPopVisible()) { return 'hidden'; }
    },

    stopPropagation(event) {
      return event.stopPropagation();
    }
  };

  return CtaPopTemplate(self);
};
