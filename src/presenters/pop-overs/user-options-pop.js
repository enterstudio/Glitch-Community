// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const UserOptionsPopTemplate = require("../../templates/pop-overs/user-options-pop");

module.exports = function(application) {

  let self;
  return self = {
  
    template() {
      return UserOptionsPopTemplate(self);
    },

    stopPropagation(event) {
      return event.stopPropagation();
    },

    hiddenUnlessUserOptionsPopVisible() {
      if (!application.userOptionsPopVisible()) { return 'hidden'; }
    },

    signOut() {
      analytics.track("Logout");
      analytics.reset();
      localStorage.removeItem('cachedUser');
      return location.reload();
    },

    yourProfileLink() {
      const login = application.currentUser().login();
      return `/@${login}`;
    },

    yourProfileAvatar() {
      return application.currentUser().avatarUrl();
    },
      
    teams() {
      return application.currentUser().teams() || [];
    },

    hiddenUnlesssUserHasTeams() {
      const teams = self.teams().length;
      if (!teams) { return 'hidden'; }
    },
        
    showNewStuffOverlay() {
      application.userOptionsPopVisible(false);
      return application.overlayNewStuffVisible(true);
    }
  };
};
 