// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const Observable = require('o_0');
const _ = require('lodash/function');

const AddTeamUserTemplate = require("../../templates/pop-overs/add-team-user-pop");

module.exports = function(application) {

  var self = {
  
    application,
  
    query: Observable(""),
  
    // team: application.team
  
    // user: application.currentUser() # temp
    // userResults: Observable []

    hiddenUnlessAddTeamUserPopVisible() {
      if (!application.addTeamUserPopVisible()) { return 'hidden'; }
    },

    stopPropagation(event) {
      return event.stopPropagation();
    },
    
    hiddenUnlessSearching() {
      if (!application.searchingForUsers()) { return 'hidden'; }
    },

    // visibleIfNoMatches: ->
    //   if application.searchResultsUsersLoaded() and application.searchResultsUsers().length is 0 and !application.searchingForUsers() and self.query()       
    //     'visible'

    spacekeyDoesntClosePop(event) {
      event.stopPropagation();
      return event.preventDefault();
    },      

    search(event) {
      const query = event.target.value.trim();
      self.query(query);
      application.searchingForUsers(true);
      return self.searchUsers(query);
    },

    searchUsers: _.debounce(function(query) {
        if (query.length) {
          return application.searchUsers(self.query());
        } else {
          return application.searchingForUsers(false);
        }
      }
      , 500),

    searchResults() {
      const MAX_RESULTS = 5;
      if (self.query().length) {
        return application.searchResultsUsers().slice(0, MAX_RESULTS);
      } else {
        return [];
      }
    },

    hiddenIfNoSearch() {
      if (!self.searchResults().length && !application.searchingForUsers()) {
        return 'hidden';
      }
    } 
  };
      
      // console.log application.searchResultsUsers()
      // console.log application.searchResultsUsersLoaded()      
      // self.userResults []
      
  return AddTeamUserTemplate(self);
};
