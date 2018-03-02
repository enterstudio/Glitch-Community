// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
module.exports = function(project, application, projectItemPresenter, userPagePresenter) {

  let self;
  return self = {

    stopPropagation(event) {
      return event.stopPropagation();
    },
    
    style() { return undefined; },

    addPin(event) {
      const projectContainer = event.target.closest('li');
      application.closeAllPopOvers();
      $(projectContainer).one('animationend', () => projectItemPresenter.togglePinnedState());
      return $(projectContainer).addClass('slide-up');
    },

    removePin(event) {
      const projectContainer = event.target.closest('li');
      application.closeAllPopOvers();
      $(projectContainer).one('animationend', () => projectItemPresenter.togglePinnedState());
      return $(projectContainer).addClass('slide-down');
    },

    pinnedProjectIds() {
      return application.user().pins().map(pin => pin.projectId);
    },

    hiddenIfProjectIsPinned() {
      if (project.isPinnedByUser(application) || project.isPinnedByTeam(application)) {
        return 'hidden';
      }
    }, 

    hiddenUnlessProjectIsPinned() {
      if (!project.isPinnedByUser(application) && !project.isPinnedByTeam(application)) {
        return 'hidden';
      }
    },

    hiddenUnlessPageIsTeamPage() {
      if (!application.pageIsTeamPage()) { return 'hidden'; }
    },
        
    hiddenIfPageIsTeamPage() {
      if (application.pageIsTeamPage()) { return 'hidden'; }
    },
    
    removeProjectFromTeam() {
      return application.team().removeProject(application, project);
    },
                  
    deleteProject(event) {
      return userPagePresenter.deleteProject(project, event);
    },
      
    leaveProject(event) {
      const prompt = `Once you leave this project, you'll lose access to it unless someone else invites you back. \n\n Are sure you want to leave ${project.name()}?`;
      if (window.confirm(prompt)) {
        return userPagePresenter.leaveProject(project, event);
      }
    }
  };
};
