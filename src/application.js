/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS103: Rewrite code to no longer use __guard__
 * DS205: Consider reworking code to avoid use of IIFEs
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const Observable = require('o_0');
const _ = require('lodash');
const axios = require('axios');

const cachedCategories = require('./cache/categories.js');
const cachedTeams = require('./cache/teams.js');  
const featuredCollections = require("./curated/featured");

const Model = require("./models/model");

const User = require('./models/user');
const Project = require('./models/project');
const Category = require('./models/category');
const Team = require('./models/team');
const Question = require('./models/question');

const cachedUser = 
  localStorage.cachedUser ?
    (() => { try {
      return JSON.parse(localStorage.cachedUser);
    } catch (error) {} })() : undefined;

var self = Model({
    // featuredProjects: featuredProjects
    currentUser: cachedUser
  }).extend({

  featuredCollections,

  // overlays
  overlayProjectVisible: Observable(false),
  overlayProject: Observable(undefined),
  overlayVideoVisible: Observable(false),
  overlayNewStuffVisible: Observable(false),

  // pop overs
  signInPopVisibleOnHeader: Observable(false),
  signInPopVisibleOnRecentProjects: Observable(false),
  userOptionsPopVisible: Observable(false),
  ctaPopVisible: Observable(false),
  addTeamUserPopVisible: Observable(false),
  addTeamProjectPopVisible: Observable(false),

  // search - users
  searchQuery: Observable(""),
  searchingForUsers: Observable(false),
  searchResultsUsers: Observable([]),
  searchResultsUsersLoaded: Observable(false),
  searchResultsHaveNoUsers: Observable(false),

  // search - projects
  searchingForProjects: Observable(false),
  searchResultsProjects: Observable([]),
  searchResultsProjectsLoaded: Observable(false),
  searchResultsHaveNoProjects: Observable(false),

  // search - teams
  searchingForTeams: Observable(false),
  searchResultsTeams: Observable([]),
  searchResultsTeamsLoaded: Observable(false),
  searchResultsHaveNoTeams: Observable(false),

  // questions
  questions: Observable([]),
  gettingQuestions: Observable(false),

  // pages
  pageIsTeamPage: Observable(false),
  pageIsUserPage: Observable(false),

  // category page
  category: Observable({}),
  categoryProjectsLoaded: Observable(false),

  // notifications
  notifyUserDescriptionUpdated: Observable(false), // unused, to remove
  notifyUploading() {
    return self.uploadFilesRemaining() > 0;
  },
  notifyUploadFailure: Observable(false),

  // upload status
  pendingUploads: Observable([]),
  uploadFilesRemaining() {
    return self.pendingUploads().length;
  },
  uploadProgress() { // Integer between 0..100
    const pendingUploads = self.pendingUploads();
    const numberOfPendingUploads = pendingUploads.length;

    const progress = pendingUploads.reduce((accumulator, currentValue) => accumulator + currentValue
    , 0);

    return ((progress / numberOfPendingUploads) * 100) | 0;
  },
  
  normalizedBaseUrl() {
    const urlLength = baseUrl.length;
    const lastCharacter = baseUrl.charAt(urlLength-1);
    if (baseUrl === "") {
      return "/";
    } else if (lastCharacter === !"/") {
      return baseUrl + "/";
    } else {
      return baseUrl;
    }
  },

  closeAllPopOvers() {
    console.log('closeAllPopOvers');
    $(".pop-over.disposable, .overlay-background.disposable").remove();
    self.signInPopVisibleOnHeader(false);
    self.signInPopVisibleOnRecentProjects(false);
    self.userOptionsPopVisible(false);
    self.ctaPopVisible(false);
    self.addTeamUserPopVisible(false);
    self.addTeamProjectPopVisible(false);
    self.overlayProjectVisible(false);
    self.overlayVideoVisible(false);
    return self.overlayNewStuffVisible(false);
  },

  searchProjects(query) {
    self.searchResultsProjects([]);
    return Project.getSearchResults(application, query);
  },

  searchUsers(query) {
    self.searchResultsUsers([]);
    return User.getSearchResults(application, query);
  },

  searchTeams(query) {
    self.searchResultsTeams([]);
    return Team.getSearchResults(application, query);
  },
    
    
  api(source, queries) {
    const persistentToken = __guard__(self.currentUser(), x => x.persistentToken());
    if (persistentToken) {
      return axios.create({  
        baseURL: API_URL,
        cancelToken: (source != null ? source.token : undefined),
        headers: {
          Authorization: persistentToken
        }
      });
    } else {
      return axios.create({
        baseURL: API_URL,
        cancelToken: (source != null ? source.token : undefined)
      });
    }
  },

  storeLocal(key, value) {
    try {
      return window.localStorage[key] = JSON.stringify(value);
    } catch (error1) {
      return console.warn("Could not save to localStorage. (localStorage is disabled in private Safari windows)");
    }
  },

  getLocal(key) {
    try {
      return JSON.parse(window.localStorage[key]);
    } catch (error1) {}
  },

  getUserPrefs() {
    return self.getLocal('community-userPrefs') || {};
  },

  getUserPref(key) {
    return self.getUserPrefs()[key];
  },

  updateUserPrefs(key, value) {
    const prefs = self.getUserPrefs();
    prefs[key] = value;
    return self.storeLocal('community-userPrefs', prefs);
  },
    
  login(provider, code) {
    let authURL;
    console.log(provider, code);
    if (provider === "facebook") {
      // capitalize for analytics
      provider = "Facebook";
      const callbackURL = `${APP_URL}/login/facebook`;
      authURL = `/auth/facebook/${code}?callbackURL=${encodeURIComponent(callbackURL)}`;
    } else {
      provider = "GitHub";
      authURL = `/auth/github/${code}`;
    }
    return self.api().post(`${authURL}`)
    .then(function(response) {
      analytics.track("Signed In",
        {provider});
      console.log("LOGGED IN", response.data);
      self.currentUser(User(response.data));
      return self.storeLocal('cachedUser', response.data);
    });
  },

  getUserByLogin(login) {
    return User.getUserByLogin(application, login);
  },

  getUserById(id) {
    return User.getUserById(application, id).then(user => {
      if (application.currentUser().id() === user.id) {
        return application.saveCurrentUser(user);
      } else {
        return application.saveUser(user);
      }
    });
  },

  getTeamById(id) {
    return Team.getTeamById(application, id);
  },

  saveCurrentUser(userData) {
    userData.fetched = true;
    console.log('👀 current user data is ', userData);
    self.currentUser().update(userData);
    const teams = self.currentUser().teams().map(datum => Team(datum));
    return self.currentUser().teams(teams);
  },

  saveUser(userData) {
    userData.fetched = true;
    userData.initialDescription = userData.description;
    console.log('👀 user data is ', userData);
    self.user(User(userData).update(userData));
    return self.getProjects(userData.projects);
  },

  saveTeam(teamData) {
    teamData.fetched = true;
    console.log('👀 team data is ', teamData);
    self.team(Team(teamData).update(teamData));
    return self.getProjects(teamData.projects);
  },

  getProjects(projectsData) {
    const projectIds = projectsData.map(project => project.id);
    return Project.getProjectsByIds(self.api(), projectIds);
  },

  getUsers(usersData) {
    const userIds = usersData.map(user => user.id);
    return User.getUsersById(self.api(), userIds);
  },

  getCategory(url) {
    const categoryData = _.find(cachedCategories, category => category.url === url);
    self.category(Category(categoryData));
    return Category.updateCategory(application, categoryData.id);
  },

  getRandomCategories(numberOfCategories, projectsPerCategory) {
    return Category.getRandomCategories(self, numberOfCategories, projectsPerCategory)
    .then(categories => self.categories(categories));
  },

  getCategories() {
    return Category.getCategories(self)
    .then(categories => self.categories(categories));
  },

  getQuestions() {
    let questions;
    return questions = Question.getQuestions(self).then(questions => self.questions(questions));
  },
    
  fogcreekAge() {
    const FOUNDED = 2001;
    const current = new Date().getFullYear();
    return current - FOUNDED;
  },

  showProjectOverlayPage(domain) {
    return Project.getProjectOverlay(application, domain);
  },

  // client.coffee routing helpers
  // TODO?: move to utils.coffee
  
  removeFirstCharacter(string) {
    // ex: ~cool to cool
    const firstCharacterPosition = 1;
    const end = string.length;
    return string.substring(firstCharacterPosition, end);
  },

  isProjectUrl(url) {
    if (url.charAt(0) === "~") {
      return true;
    }
  },

  isUserProfileUrl(url) {
    if (url.charAt(0) === "@") {
      return true;
    }
  },

  isAnonUserProfileUrl(url) {
    if (url.match(/^(user\/)/g)) { // matches "user/" at beginning of url
      return true;
    }
  },
  
  anonProfileIdFromUrl(url) {
    return url.replace(/^(user\/)/g, '');
  },
  
  isSearchUrl(url, queryString) {
    const queryStringKeys = _.keys(queryString); // ['q', 'blah']
    if ((url === 'search') && (_.includes(queryStringKeys, 'q'))) {
      return true;
    }
  },

  isCategoryUrl(url) {
    if (_.find(cachedCategories, category => category.url === url)) { return true; }
  },

  isTeamUrl(url) {
    if (_.find(cachedTeams, team => team.url === url)) { return true; }
  },

  getCachedTeamByUrl(url) {
    return _.find(cachedTeams, team => team.url === url);
  },

  isQuestionsUrl(url) {
    if (url === 'questions') {
      return true;
    }
  }
});

      
self.attrModel("user", User);
self.attrModel("currentUser", User);
// self.attrModels "featuredProjects", Project
self.attrModels("categories", Category);
self.attrModel("category", Category);
self.attrModel("team", Team);
self.attrModel("question", Question);

global.application = self;
global.API_URL = API_URL;
global.EDITOR_URL = EDITOR_URL;
global.User = User;
global.Project = Project;
global.Category = Category;
global.Team = Team;
global.Question = Question;

module.exports = self;

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}