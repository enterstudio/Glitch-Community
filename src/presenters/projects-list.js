/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const ProjectItemPresenter = require("./project-item");
const ProjectsListTemplate = require("../templates/projects-list");

module.exports = function(application, title, projects, userPagePresenter) {

  const self = {

    sectionTitle: title,

    projects() {
      return projects.map(project => ProjectItemPresenter(application, project, {}, userPagePresenter));
    },

    visibleIfNoPins() {
      if ((title === 'Pinned Projects') && (projects.length === 0)) {
        return 'visible';
      }
    },

    hiddenUnlessTitleIsPinned() {
      if (title !== 'Pinned Projects') { return 'hidden'; }
    }
  };


  return ProjectsListTemplate(self);
};
