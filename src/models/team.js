// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS101: Remove unnecessary use of Array.from
 * DS102: Remove unnecessary code created because of implicit returns
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
/*
We use a cache to keep an identity map of teams by id.

When constructing a team model Team(...) if it has an id
field it will be cached based on the id. If the id already
exists in the cache the same reference to that model will be
returned.

If the id property is not given the model is not cached.

*/

let Team;
const _ = require('lodash');
const axios = require('axios');
const querystring = require('querystring');

const cache = {};
const cacheBuster = Math.floor(Math.random() * 1000);

const Model = require('./model');
let Project = require('./project');
const User = require('./user');

module.exports = (Team = function(I, self) {

  if (I == null) { I = {}; }
  if (self == null) { self = Model(I); }
  if (cache[I.id]) {
    return cache[I.id];
  }
  
  self.defaults(I, {
    id: undefined,
    name: undefined,
    description: "",
    url: undefined,
    backgroundColor: undefined,
    hasCoverImage: undefined,
    coverColor: undefined,
    isCategory: false,
    fetched: false,
    users: [],
    projects: [],
    isVerified: false,
    teamPins: [],
    hasAvatarImage: false
  }
  );
    
  self.attrObservable(...Array.from(Object.keys(I) || []));
  
  self.attrModels('projects', Project);
  self.attrModels('users', User);
  self.attrObservable("localCoverImage");
  self.attrObservable("localAvatarImage");

  self.extend({
  
    pins: self.teamPins,
  
    coverUrl(size) {
      size = size || 'large';
      if (self.hasCoverImage()) {
        return `https://s3.amazonaws.com/production-assetsbucket-8ljvyr1xczmb/team-cover/${self.id()}/${size}?${cacheBuster}`;           
      } 
        return "https://cdn.glitch.com/55f8497b-3334-43ca-851e-6c9780082244%2Fdefault-cover-wide.svg?1503518400625";
      
    },

    teamAvatarUrl(size) {
      size = size || 'small';
      if (self.hasAvatarImage()) {
        return `https://s3.amazonaws.com/production-assetsbucket-8ljvyr1xczmb/team-avatar/${self.id()}/${size}?${cacheBuster}`;
      } 
        return "https://cdn.glitch.com/55f8497b-3334-43ca-851e-6c9780082244%2Fdefault-team-avatar.svg?1503510366819";
      
    },

    hiddenIfFetched() {
      if (self.fetched()) { return 'hidden'; }
    },

    hiddenUnlessFetched() {
      if (!self.fetched()) { return 'hidden'; }
    },
    
    truncatedDescription() {
      const MAX_CHARACTERS = 140;
      if (self.description().length > MAX_CHARACTERS) {
        return self.description().substring(0, MAX_CHARACTERS) + "…";
      } 
        return self.description();
      
    },

    thanksCount() {
      if (self.users().length) {
        let thanks = 0;
        self.users().forEach(user => thanks = thanks + parseInt(user.thanksCount()));
        return thanks;
      }
    },

    teamThanks() {
      const thanksCount = self.thanksCount();
      if (thanksCount === 1) {
        return "Thanked once";
      } else if (thanksCount === 2) {
        return "Thanked twice";
      } 
        return `Thanked ${thanksCount} times`;
      
    },

    currentUserIsOnTeam(application) {
      const matchingUser = self.users().filter(user => user.id() === application.currentUser().id());
      if (matchingUser.length) { return true; }
    },

    updateCoverColor(application, color) {
      if (color) {
        self.coverColor(color);
        return self.updateTeam(application, 
          {coverColor: color});
      }
    },

    updateAvatarColor(application, color) {
      if (color) {
        self.backgroundColor(color);
        return self.updateTeam(application, 
          {backgroundColor: color});
      }
    },

    updateTeam(application, updateData) {
      const teamPath = `teams/${self.id()}`;
      return application.api().patch(teamPath, updateData)
      .then(({data}) => console.log('updatedTeam', data)).catch(error => console.error(`updateTeam PATCH ${teamPath}`, error));
    },

    verifiedTooltip() {
      return "Verified to be supportive, helpful people";
    },

    verifiedImage() {
      return "https://cdn.glitch.com/55f8497b-3334-43ca-851e-6c9780082244%2Fverified.svg?1501783108220";
    },

    addPin(application, projectId) {
      self.pins.push({
        projectId});
      const pinPath = `teams/${self.id()}/pinned-projects/${projectId}`;
      return application.api().post(pinPath)
      .then(({data}) => console.log(data)).catch(error => console.error('addPin', error));
    },

    removePin(application, projectId) {
      const newPins = self.pins().filter(pin => pin.projectId !== projectId);
      self.pins(newPins);
      const pinPath = `teams/${self.id()}/pinned-projects/${projectId}`;
      return application.api().delete(pinPath)
      .then(({data}) => console.log(data)).catch(error => console.error('removePin', error));
    },

    addUser(application, user) {
      const teamUserPath = `/teams/${self.id()}/users/${user.id()}`;
      return application.api().post(teamUserPath)
      .then(function(response) {
        self.users.push(user);
        return console.log('added user. team users are now', self.users());}).catch(error => console.error('addUser', error));
    },

    removeUser(application, user) {
      const teamUserPath = `/teams/${self.id()}/users/${user.id()}`;
      return application.api().delete(teamUserPath)
      .then(function(response) {
        const newUsers = _.reject(self.users(), removedUser => removedUser.id() === user.id());
        self.users(newUsers);
        return console.log('removed user. team users are now', self.users());}).catch(error => console.error('removeUser', error));
    },

    addProject(application, project) {
      const teamProjectPath = `/teams/${self.id()}/projects/${project.id()}`;
      return application.api().post(teamProjectPath)
      .then(function(response) {
        self.projects.push(project);
        return console.log('added project. team projects are now', self.projects());}).catch(error => console.error('addProject', error));
    },

    removeProject(application, project) {
      const teamProjectPath = `/teams/${self.id()}/projects/${project.id()}`;
      return application.api().delete(teamProjectPath)
      .then(function(response) {
        const newProjects = _.reject(self.projects(), removedProject => removedProject.id() === project.id());
        self.projects(newProjects);
        return console.log('removed project. team projects are now', self.projects());}).catch(error => console.error('addProject', error));
    },

    pushSearchResult(application) {
      application.searchResultsTeams.push(self);
      return application.searchResultsTeamsLoaded(true);
    }
  });

  if (I.id) {
    cache[I.id] = self;
  }
  // console.log '👯 team cache', cache

  return self;
});

Team.getTeamById = function(application, id) {
  const teamsPath = `teams/${id}`;
  return application.api().get(teamsPath)
  .then(({data}) => application.saveTeam(data)).catch(error => console.error('getTeamById', error));
};

Team.getSearchResults = function(application, query) {
  const MAX_RESULTS = 20;
  const { CancelToken } = axios;
  const source = CancelToken.source();
  application.searchResultsTeams([]);
  application.searchingForTeams(true);
  const searchPath = `teams/search?q=${query}`;
  return application.api(source).get(searchPath)
  .then(function({data}) {
    application.searchingForTeams(false);
    data = data.slice(0 , MAX_RESULTS);
    if (data.length === 0) {
      application.searchResultsHaveNoTeams(true);
    }
    return data.forEach(function(datum) {
      datum.fetched = true;
      return Team(datum).update(datum).pushSearchResult(application);
    });}).catch(error => console.log('getSearchResults', error));
};


Team._cache = cache;

// Circular dependencies must go below module.exports
Project = require('./project');
const Users = require('./user');
