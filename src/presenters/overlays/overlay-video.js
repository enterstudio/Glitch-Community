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
