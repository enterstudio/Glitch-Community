/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const UsersListTemplate = require("../templates/includes/users-list");
const UserAvatarTemplate = require("../templates/includes/user-avatar"); //

module.exports = function(projectOrTeam, type) {
  
  var self = {
  
    users() {
      return projectOrTeam.users();
    },

    userAvatars() {
      return self.users().map(UserAvatarTemplate);
    },

    hiddenUnlessShowAsGlitchTeam() {
      if (type === 'team') {
        return 'hidden'; 
      }

      if (!(projectOrTeam != null ? projectOrTeam.showAsGlitchTeam() : undefined)) { return 'hidden'; }
    },

    hiddenIfShowAsGlitchTeam() {
      if (type !== 'team') {
        if (projectOrTeam != null ? projectOrTeam.showAsGlitchTeam() : undefined) { return 'hidden'; }
      }
    }
  };

  return UsersListTemplate(self);
};
