/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const TeamItemTemplate = require("../templates/includes/team-item");
const UsersListPresenter = require("./users-list");

module.exports = function(application, team) {

  var self = {
    application,
    team,

    name() {
      return team.name();
    },

    truncatedDescription() {
      return team.truncatedDescription();
    },

    usersListPresenter: UsersListPresenter(team, 'team'),

    url() {
      return team.url();
    },
    
    coverUrl() {
      return team.coverUrl('small');
    },

    coverColor() {
      return team.coverColor();
    },

    thanks() {
      return team.teamThanks();
    },
    
    users() {
      return team.users();
    },
    
    avatarUrl() {
      return team.teamAvatarUrl();
    },

    hiddenUnlessThanks() {
      if (!(team.thanksCount() > 0)) { return 'hidden'; }
    },
    
    hiddenUnlessDescription() {
      if (!team.description()) { return 'hidden'; }
    },
  
    verifiedImage() {
      return team.verifiedImage();
    },
  
    verifiedTeamTooltip() {
      return team.verifiedTooltip();
    },
    
    hiddenUnlessVerified() {
      if (!team.isVerified()) { return 'hidden'; }
    },

    style() {
      return {
        backgroundImage: `url('${self.coverUrl()}')`,
        backgroundColor: self.coverColor()
      };
    }
  };

  return TeamItemTemplate(self);
};
