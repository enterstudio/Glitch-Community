/*
 * decaffeinate suggestions:
 * DS101: Remove unnecessary use of Array.from
 * DS102: Remove unnecessary code created because of implicit returns
 * DS103: Rewrite code to no longer use __guard__
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
let Project;
const cache = {};

const Model = require('./model');
const _ = require('lodash/collection');
const axios = require('axios');

let source = undefined; // reference to cancel token
let originalUrlPath = "/";
let originalQueryString = "";

module.exports = (Project = function(I, self) {
  
  if (I == null) { I = {}; }
  if (self == null) { self = Model(I); }
  if (cache[I.id]) {
    return cache[I.id];
  }

  self.defaults(I, {
    domain: undefined,
    id: undefined,
    description: undefined,
    users: undefined,
    showAsGlitchTeam: false
  }
  );

  self.attrObservable(...Array.from(Object.keys(I) || []));
  self.attrObservable("readme", "readmeNotFound", "projectNotFound", "fetched", "displayName");
  self.attrModels('users', User);
  self.attrReader("private");

  self.extend({

    name() {
      return self.domain();
    },
  
    editUrl() {
      if (I.line) {
        return `${EDITOR_URL}#!/${I.domain}?path=${I.path}:${I.line}:${I.character}`;
      } else {
        return `${EDITOR_URL}#!/${I.domain}`;
      }
    },

    userIsCurrentUser(application) {
      const userIsCurrentUser = _.find(self.users(), user => user.id() === application.currentUser().id());
      if (userIsCurrentUser) { return true; }
    },

    avatar() {
      return `${CDN_URL}/project-avatar/${self.id()}.png`;
    },
        
    getReadme(application) {
      if (self.id() === undefined) {
        self.readmeNotFound(true);
        self.projectNotFound(true);
        return;
      }
      
      const { CancelToken } = axios;
      source = CancelToken.source();
      self.readme(undefined);
      self.readmeNotFound(undefined);
      self.projectNotFound(undefined);
      let path = `projects/${self.id()}/readme`;
      if (__guard__(application.currentUser(), x => x.persistentToken())) {
        path += `?token=${__guard__(application.currentUser(), x1 => x1.persistentToken())}`;
      }
      return application.api(source).get(path)
      .then(function(response) {
        self.readme(response.data);
        return application.overlayProject(self);}).catch(function(error) {
        console.error("getReadme", error);
        if (error.response.status === 404) {
          return self.readmeNotFound(true);
        } else {
          return self.projectNotFound(true);
        }
      });
    },

    showOverlay(application) {
      console.log('showOverlay');
      application.overlayProject(self);
      self.getReadme(application);
      originalUrlPath = window.location.pathname;
      originalQueryString = window.location.search;
      history.replaceState(null, `${self.domain()} – Glitch`, `~${self.domain()}`);
      application.overlayProjectVisible(true);
      return document.getElementsByClassName('project-overlay')[0].focus();
    },

    hideOverlay(application) {
      source.cancel('Operation canceled by the user.');
      return history.replaceState(null, null, originalUrlPath + originalQueryString);
    },

    pushSearchResult(application) {
      application.searchResultsProjects.push(self);
      return application.searchResultsProjectsLoaded(true);
    },

    isPinnedByUser(application) {
      const pins = application.user().pins().map(pin => pin.projectId);
      return _.includes(pins, self.id());
    },

    isPinnedByTeam(application) {
      const pins = application.team().pins().map(pin => pin.projectId);
      return _.includes(pins, self.id());
    },
           
    delete() {
      const projectPath = `/projects/${self.id()}`;
      return new Promise(function(resolve, reject) {
        return application.api().delete(projectPath)
        .then(response => resolve(response)).catch(function(error) {
          reject(error);
          return console.error('deleteProject', error);
        });
      });
    },
      
    undelete() {
      const projectPath = `/projects/${self.id()}/undelete`;
      return new Promise(function(resolve, reject) { 
        return application.api().post(projectPath)
        .then(response => resolve(response)).catch(function(error) {
          console.error('undeleteProject', error);
          return reject(error);
        });
      });
    },
    
    leave() {
      const projectAuthPath = `/projects/${self.id()}/authorization`;
      const config = {
        data: { 
          targetUserId: application.currentUser().id()
        }
      };
      return new Promise(function(resolve, reject) {
        return application.api().delete(projectAuthPath, config)
          .then(response => resolve(response)).catch(function(error) {
            console.error('leaveProject', error);
            return reject(error);
        });
      });
    }
  });
      
  cache[I.id] = self;
  // console.log '💎 project cache', cache

  return self;
});

// Fetch projects and populate them into the local cache
Project.getProjectsByIds = function(api, ids) {
  const NUMBER_OF_PROJECTS_PER_REQUEST = 40;
  const newProjectIds = ids.filter(function(id) {
    const project = cache[id];
    return !project || !project.fetched();
  });
  // fetch the ids in groups so they fit into max allowable url length
  const projectIdGroups = newProjectIds.map(function(id, index) {
    if ((index % NUMBER_OF_PROJECTS_PER_REQUEST) === 0) { 
      return newProjectIds.slice(index, index + NUMBER_OF_PROJECTS_PER_REQUEST);       
    } else { return null; }}).filter(id => id);
  return projectIdGroups.forEach(function(group) {
    const projectsPath = `projects/byIds?ids=${group.join(',')}`;
    return api.get(projectsPath)
    .then(function({data}) {
      data.forEach(function(datum) {
        datum.fetched = true;
        return Project(datum).update(datum);
      });
      return ids.map(id => Project({id}));}).catch(error => console.error("getProjectsByIds", error));
  });
};

Project.getProjectOverlay = function(application, domain) {
  const projectPath = `projects/${domain}`;
  application.overlayProjectVisible(true);
  return application.api().get(projectPath)
  .then(function({data}) {
    if (!data) {
      const project = Project({domain});
      project.projectNotFound(true);
      project.showOverlay(application);
      return;
    }
    
    return Project(data).showOverlay(application);}).catch(error => console.error("getProjectOverlay", error));
};

Project.getSearchResults = function(application, query) {
  const MAX_RESULTS = 20;
  const { CancelToken } = axios;
  source = CancelToken.source();
  application.searchResultsUsers([]);
  application.searchingForProjects(true);
  const searchPath = `projects/search?q=${query}`;
  return application.api(source).get(searchPath)
  .then(function({data}) {
    application.searchingForProjects(false);
    
    let projects = data;

    // Remove not-safe-for-kids results
    projects = projects.filter(project => project.notSafeForKids === false);
    
    projects = projects.slice(0 , MAX_RESULTS);
    if (projects.length === 0) {
      application.searchResultsHaveNoProjects(true);
    }
    return projects.forEach(function(project) {
      project.fetched = true;
      return Project(project).update(project).pushSearchResult(application);
    });}).catch(error => console.error('getSearchResults', error));
};


Project._cache = cache;

// Circular dependencies must go below module.exports
var User = require("./user");

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}