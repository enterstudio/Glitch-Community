/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const axios = require('axios');

const LayoutPresenter = require("../layout");
const SearchPageTemplate = require("../../templates/pages/search");

module.exports = function(application) {

  const self = { 

    application,
    searchResultsProjects: application.searchResultsProjects,
    searchResultsUsers: application.searchResultsUsers,
    searchResultsTeams: application.searchResultsTeams,
    
    hiddenIfSearchResultsTeamsLoaded() {
      if (application.searchResultsTeamsLoaded()) { return 'hidden'; }
    },      
    
    hiddenIfSearchResultsProjectsLoaded() {
      if (application.searchResultsProjectsLoaded()) { return 'hidden'; }
    },
  
    hiddenIfSearchResultsUsersLoaded() {
      if (application.searchResultsUsersLoaded()) { return 'hidden'; }
    },
  
    hiddenIfSearchResultsHaveNoUsers() {
      if (application.searchResultsHaveNoUsers()) { return 'hidden'; }
    },

    hiddenIfSearchResultsHaveNoProjects() {
      if (application.searchResultsHaveNoProjects()) { return 'hidden'; }
    },
    
    hiddenIfSearchResultsHaveNoTeams() {
      if (application.searchResultsHaveNoTeams()) { return 'hidden'; }
    },      

    hiddenUnlessSearchHasNoResults() {
      if (!application.searchResultsHaveNoUsers() || !application.searchResultsHaveNoProjects() || !application.searchResultsHaveNoTeams()) { return 'hidden'; }
    }
  };
    

  const content = SearchPageTemplate(self);
        
  return LayoutPresenter(application, content);
};
