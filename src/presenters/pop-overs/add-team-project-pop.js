const Observable = require('o_0');
const _ = require('lodash/function');

const AddTeamProjectTemplate = require("../../templates/pop-overs/add-team-project-pop");

module.exports = function(application) {

  var self = {
  
    application,
  
    query: Observable(""),

    hiddenUnlessAddTeamProjectPopVisible() {
      if (!application.addTeamProjectPopVisible()) { return 'hidden'; }
    },

    stopPropagation(event) {
      return event.stopPropagation();
    },

    hiddenUnlessSearching() {
      if (!application.searchingForProjects()) { return 'hidden'; }
    },

    spacekeyDoesntClosePop(event) {
      event.stopPropagation();
      return event.preventDefault();
    },      

    search(event) {
      const query = event.target.value.trim();
      self.query(query);
      application.searchingForProjects(true);
      return self.searchProjects(query);
    },

    searchProjects: _.debounce(function(query) {
      if (query.length) {
        return application.searchProjects(query);
      } 
      return application.searchingForProjects(false);
        
    }
      , 500),

    searchResults() {
      const MAX_RESULTS = 10;
      if (self.query().length) {
        return application.searchResultsProjects().slice(0, MAX_RESULTS);
      } 
      return [];
      
    },

    hiddenIfNoSearch() {
      if (!self.searchResults().length && !application.searchingForProjects()) {
        return 'hidden';
      }
    } 
  };


  return AddTeamProjectTemplate(self);
};
