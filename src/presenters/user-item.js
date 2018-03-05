// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const UserTemplate = require("../templates/includes/user-item");

module.exports = function(application, user) {

  var self = {
    application,
    user,

    login() {
      return `@${user.login()}`;
    },

    name() {
      return user.name();
    },

    truncatedDescription() {
      return user.truncatedDescriptionMarkdown();
    },

    coverUrl() {
      return user.coverUrl('small');
    },

    coverColor() {
      return user.coverColor();
    },

    thanks() {
      return user.userThanks();
    },

    userLink() {
      return user.userLink();
    },

    avatarUrl() {
      return user.userAvatarUrl('large');
    },

    hiddenUnlessThanks() {
      if (!(user.thanksCount() > 0)) { return 'hidden'; }
    },
    
    hiddenUnlessDescription() {
      if (!user.description()) { return 'hidden'; }
    },
    
    hiddenUnlessName() {
      if (!user.name()) { return 'hidden'; }
    },

    style() {
      return {
        backgroundImage: `url('${self.coverUrl()}')`,
        backgroundColor: self.coverColor()
      };
    }
  };

  return UserTemplate(self);
};
