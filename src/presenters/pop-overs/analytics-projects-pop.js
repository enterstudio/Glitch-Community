// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const Observable = require('o_0');

const AnalyticsProjectsPopTemplate = require("../../templates/pop-overs/analytics-projects-pop");

module.exports = function(application, analytics) {

  var self = {
  
    application,  
    teamProjects: Observable(application.team().projects()),
    analytics,

    // hiddenUnlessAnalyticsProjectsPopVisible: ->
    //   'hidden' unless application.analyticsProjectsPopVisible()
    
    stopPropagation(event) {
      return event.stopPropagation();
    },

    filter(event) {
      const query = event.target.value.trim();
      const projects = application.team().projects();
      if (query.length) {
        const filtered = projects.filter(project => project.domain().match(query) || project.description().match(query));
        return self.teamProjects(filtered);
      } 
        return self.teamProjects(projects);
      
    },

    spacekeyDoesntClosePop(event) {
      event.stopPropagation();
      return event.preventDefault();
    },

    activeIfAllProjects() {
      if (analytics.analyticsProjectDomain() === 'All Projects') { return 'active'; }
    },

    selectAllProjects() {
      return analytics.analyticsProjectDomain('All Projects');
    }
  };
        
  return AnalyticsProjectsPopTemplate(self);
};
