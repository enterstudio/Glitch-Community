// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS101: Remove unnecessary use of Array.from
 * DS102: Remove unnecessary code created because of implicit returns
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
/*
We use a cache to keep an identity map of users by id.

When constructing a user model User(...) if it has an id
field it will be cached based on the id. If the id already
exists in the cache the same reference to that model will be
returned.

If the id property is not given the model is not cached.
*/

let User;
const isuuid = require('isuuid');
const axios = require('axios');
const md = require('markdown-it')({
  breaks: true,
  linkify: true,
  typographer: true}).disable(['image']);

const Model = require('./model');
const cache = {};
const cacheBuster = Math.floor(Math.random() * 1000);

module.exports = (User = function(I, self) {

  if (I == null) { I = {}; }
  if (self == null) { self = Model(I); }
  if (cache[I.id]) {
    return cache[I.id];
  }
  
  self.defaults(I, {
    id: undefined,
    facebookId: undefined,
    avatarUrl: undefined,
    color: undefined,
    hasCoverImage: false,
    coverColor: "#1F33D9",
    login: null,
    name: null,
    description: "",
    initialDescription: "",
    projects: undefined,
    teams: undefined,
    thanksCount: 0,
    fetched: false,
    showAsGlitchTeam: false,
    persistentToken: null,
    pins: [],
    deletedProjects: []
  });

  self.attrObservable(...Array.from(Object.keys(I) || []));
  self.attrObservable("notFound");
  self.attrObservable("localCoverImage");
  self.attrModels('projects', Project);

  self.extend({

    isSignedIn() {
      if (self.login()) { return true; }
    },

    isAnon() {
      if (!self.login()) { return true; }
    },

    isAnExperiencedUser() {
      if (self.login() && (self.projects().length > 1)) {
        return true;
      }
    },

    coverUrl(size) {
      size = size || 'large';
      if (self.hasCoverImage()) {
        return `https://s3.amazonaws.com/production-assetsbucket-8ljvyr1xczmb/user-cover/${self.id()}/${size}?${cacheBuster}`;
      } else {
        return "https://cdn.glitch.com/55f8497b-3334-43ca-851e-6c9780082244%2Fdefault-cover-wide.svg?1503518400625";
      }
    },

    userAvatarUrl(size) {
      size = size || 'small';
      if (self.isAnon()) {
        return "https://cdn.glitch.com/f6949da2-781d-4fd5-81e6-1fdd56350165%2Fanon-user-on-project-avatar.svg";
      } else if (self.facebookId()) {
        return `https://graph.facebook.com/${self.facebookId()}/picture?type=${size}`;
      } else {
        return self.avatarUrl();
      }
    },
        // self.avatarUrl size

    isCurrentUser(application) {
      if (self.id() === application.currentUser().id()) { return true; }
    },

    isOnUserPageForCurrentUser(application) {
      if (application.pageIsUserPage() && self.isCurrentUser(application)) { return true; }
    },

    hiddenIfSignedIn() {
      if (self.isSignedIn()) { return 'hidden'; }
    },

    hiddenUnlessSignedIn() {
      if (!self.isSignedIn()) { return 'hidden'; }
    },

    //
    // hiddenIfAnon: ->
    //   'hidden' if self.isAnon()

    hiddenIfFetched() {
      if (self.fetched()) { return 'hidden'; }
    },

    hiddenUnlessFetched() {
      if (!self.fetched()) { return 'hidden'; }
    },

    tooltipName() {
      return self.login() || "anonymous user";
    },
    
    alt() {
      return `${I.login} avatar`;
    },
    
    style() {
      return {backgroundColor: I.color};
    },
    
    userLink() {
      if (self.isSignedIn()) {
        return `/@${I.login}`;
      } else {
        return `/user/${I.id}`;
      }
    },

    anonAvatar() {
      return "https://cdn.glitch.com/f6949da2-781d-4fd5-81e6-1fdd56350165%2Fanon-user-on-project-avatar.svg?1488556279399";
    },

    glitchTeamAvatar() {
      return "https://cdn.glitch.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fglitch-team-avatar.svg";
    },

    updateUser(application, updateData) {
      const userPath = `users/${self.id()}`;
      return application.api().patch(userPath, updateData)
      .then(() => console.log('updatedUser')).catch(error => console.error(`updateUser PATCH ${userPath}`, error));
    },

    updateCoverColor(application, color) {
      self.coverColor(color);
      return self.updateUser(application, 
        {coverColor: color});
    },

    truncatedDescription() {
      const MAX_CHARACTERS = 140;
      if (self.description().length > MAX_CHARACTERS) {
        return self.description().substring(0, MAX_CHARACTERS) + "…";
      } else {
        return self.description();
      }
    },

    descriptionMarkdown() {
      const text = self.description();
      const node = document.createElement('span');
      node.innerHTML = md.render(text);
      return node;
    },
    
    truncatedDescriptionMarkdown() {
      const text = self.truncatedDescription();
      const node = document.createElement('span');
      node.innerHTML = md.render(text);
      return node;
    },

    initialDescriptionMarkdown() {
      const text = self.initialDescription();
      const node = document.createElement('span');
      node.innerHTML = md.render(text);
      return node;
    },
    
    pushSearchResult(application) {
      application.searchResultsUsers.push(self);
      return application.searchResultsUsersLoaded(true);
    },

    userThanks() {
      const thanksCount = self.thanksCount();
      if (thanksCount === 1) {
        return "Thanked once";
      } else if (thanksCount === 2) {
        return "Thanked twice";
      } else {
        return `Thanked ${thanksCount} times`;
      }
    },

    addPin(application, projectId) {
      self.pins.push({
        projectId});
      const pinPath = `users/${self.id()}/pinned-projects/${projectId}`;
      return application.api().post(pinPath)
      .then(({data}) => console.log(data)).catch(error => console.error('addPin', error));
    },

    removePin(application, projectId) {
      const newPins = self.pins().filter(pin => pin.projectId !== projectId);
      self.pins(newPins);
      const pinPath = `users/${self.id()}/pinned-projects/${projectId}`;
      return application.api().delete(pinPath)
      .then(({data}) => console.log(data)).catch(error => console.error('removePin', error));
    }
  });


  if (I.id) {
    cache[I.id] = self;
  }
  // console.log '☎️ user cache', cache

  return self;
});

User.getUserByLogin = function(application, login) {
  const userIdPath = `/userid/byLogin/${login}`;
  return application.api().get(userIdPath)
  .then(function(response) {
    const userId = response.data;
    if (userId === "NOT FOUND") {
      application.user().notFound(true);
      return;
    }
    return User.getUserById(application, userId).then(user => {
      return application.saveUser(user);
    });}).catch(error => console.error(`getUserByLogin GET ${userIdPath}`, error));
};

User.getUserById = function(application, id) {
  const userPath = `users/${id}`;
  const promise = new Promise((resolve, reject) => {
    return application.api().get(userPath)
    .then(({data}) => resolve(data)).catch(function(error) {
      console.error(`getUserById GET ${userPath}`, error);
      return reject();
    });
  });
  return promise;
};

User.getUsersById = function(api, ids) {
  const team = application.team();
  const userIdsToFetch = ids.filter(function(id) {
    const user = cache[id];
    return !user || !user.fetched();
  });
  const usersPath = `users/byIds?ids=${userIdsToFetch.join(',')}`;
  return api.get(usersPath)
  .then(function({data}) {
    data.forEach(function(datum) {
      datum.fetched = true;
      return User(datum).update(datum);
    });
    return ids.map(id => User({id}));
  });
};

User.getSearchResults = function(application, query) {
  const MAX_RESULTS = 20;
  const { CancelToken } = axios;
  const source = CancelToken.source();
  application.searchResultsUsers([]);
  application.searchingForUsers(true);
  const searchPath = `users/search?q=${query}`;
  return application.api(source).get(searchPath)
  .then(function({data}) {
    application.searchingForUsers(false);
    data = data.slice(0 , MAX_RESULTS);
    if (data.length === 0) {
      application.searchResultsHaveNoUsers(true);
    }
    return data.forEach(function(datum) {
      datum.fetched = true;
      return User(datum).update(datum).pushSearchResult(application);
    });}).catch(error => console.error('getSearchResults', error));
};


User._cache = cache;

// Circular dependencies must go below module.exports
var Project = require('./project');
