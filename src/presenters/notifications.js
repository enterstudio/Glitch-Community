/*
 * decaffeinate suggestions:
 * DS101: Remove unnecessary use of Array.from
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const NotificationsTemplate = require("../templates/includes/notifications");

const Observable = require("o_0");
const animationEnd = 'webkitAnimationEnd oanimationend msAnimationEnd animationend';

module.exports = function(application) {

  // defined as observables in application.coffee
  const notificationTypes = [
    "UserDescriptionUpdated",
    "Uploading",
    "UploadFailure"
  ];

  const notifications = notificationTypes.map(str => `.notify${str}`).join(',');

  const generateNotifier = (method, application) =>
    function() {
      $(notifications).one(animationEnd, event => application[method](false));
      if (!application[method]()) {
        return "hidden";
      }
    }
  ;


  const self = {
    application,
    
    uploadFilesRemaining() {
      return Math.round((application.uploadFilesRemaining() / 2));
    },

    uploadProgress() {
      return application.uploadProgress();
    }
  };


  for (let notificationType of Array.from(notificationTypes)) {
    const method = `notify${notificationType}`;
    self[method] = generateNotifier(method, application);
  }

  return NotificationsTemplate(self);
};
