/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const ProjectItemTemplate = require("../templates/includes/project-item");
const UsersListPresenter = require("./users-list");

const ProjectOptionsPop = require("../templates/pop-overs/project-options-pop");
const ProjectOptionsPopPresenter = require('./pop-overs/project-options-pop');

module.exports = function(application, project, category, userPagePresenter) {

  var self = { 

    category,
    project,
    
    usersListPresenter: UsersListPresenter(project),

    projectLink() {
      if (project.isRecentProject) {
        return self.editorLink();
      } else {
        return `/~${project.domain()}`;
      }
    },

    editorLink() {
      return project.editUrl();
    },

    showProject(event) {
      event.preventDefault();
      event.stopPropagation();
      return project.showOverlay(application);
    },

    buttonCtaIfCurrentUser() {
      if (project.isRecentProject) {
        return "button-cta";
      }
    },

    projectIsPrivate() {
      if (project.private()) { return 'private-project'; }
    },

    showProjectOptionsPop(event) {
      application.closeAllPopOvers();
      event.stopPropagation();
      const button = $(event.target).closest('.opens-pop-over');
      return button[0].appendChild(ProjectOptionsPop(ProjectOptionsPopPresenter(project, application, self, userPagePresenter)));
    },

    visibleIfUserHasProjectOptions() {
      if (application.user().isOnUserPageForCurrentUser(application) || application.team().currentUserIsOnTeam(application)) {                    
        return 'visible';
      }
    },

    stopPropagation(event) {
      return event.stopPropagation();
    },

    togglePinnedState() {
      if (application.pageIsTeamPage()) {
        return self.toggleTeamPin();
      } else {
        return self.toggleUserPin();
      }
    },

    toggleUserPin() {
      if (project.isPinnedByUser(application)) {
        return application.user().removePin(application, project.id());
      } else {
        return application.user().addPin(application, project.id());
      }
    },

    toggleTeamPin() {
      if (project.isPinnedByTeam(application)) {
        return application.team().removePin(application, project.id());
      } else {
        console.log('toggleTeamPin addpin');
        return application.team().addPin(application, project.id());
      }
    },

    style() {
      return {
        backgroundColor: (typeof category.color === 'function' ? category.color() : undefined),
        borderBottomColor: (typeof category.color === 'function' ? category.color() : undefined)
      };
    },

    maskStyle() {
      return {backgroundColor: (typeof category.color === 'function' ? category.color() : undefined)};
    },

    avatar() {
      return project.avatar();
    }
  };

  return ProjectItemTemplate(self);
};
