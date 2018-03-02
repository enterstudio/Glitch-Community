// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
require("./extensions");

const application = require('./application');
const qs = require('querystringify');
const queryString = qs.parse(window.location.search);

const IndexPage = require("./presenters/pages/index");
const CategoryPage = require("./presenters/pages/category");
const UserPage = require("./presenters/pages/user");
const TeamPage = require("./presenters/pages/team");
const QuestionsPage = require("./presenters/pages/questions");
const SearchPage = require("./presenters/pages/search");
const errorPageTemplate = require("./templates/pages/error");

let normalizedRoute = route.replace(/^\/|\/$/g, "").toLowerCase();
console.log("#########");
console.log(`normalizedRoute is ${normalizedRoute}`);
console.log("❓ query strings are", queryString);
console.log("🎏 application is", application);
console.log("👻 current user is", application.currentUser());
console.log("🌈 isSignedIn", application.currentUser().isSignedIn());
console.log("#########");



// client-side routing:

Promise.resolve()
.then(function() {
  if (document.location.hash.startsWith("#!/")) {
    document.location = EDITOR_URL + document.location.hash;
    return;
  }}).then(function() {
  if (normalizedRoute.startsWith("login/")) {
    return application.login(normalizedRoute.substring("login/".length), queryString.code)
    .then(function() {
      history.replaceState(null, null, `${baseUrl}/`);
      return normalizedRoute = "";
    });
  }}).then(function() {
  let indexPage, userPage;
  const currentUserId = application.currentUser().id();
  if (currentUserId) {
    application.getUserById(currentUserId);
  }
  const user = application.currentUser();
  if (application.currentUser().isSignedIn()) {
    analytics.identify(user.id(), {
      name: user.name(),
      login: user.login(),
      email: user.email(),
      created_at: user.createdAt()
    }
    );
  }

  // index page ✅
  if ((normalizedRoute === "index.html") || (normalizedRoute === "")) {
    application.getRandomCategories();
    application.getQuestions();
    indexPage = IndexPage(application);
    return document.body.appendChild(indexPage);


  // questions page ✅
  } else if (application.isQuestionsUrl(normalizedRoute)) {
    application.getCategories();
    const questionsPage = QuestionsPage(application);
    document.body.appendChild(questionsPage);
    // TODO append active projects count to document.title . i.e. Questions (12)
    return document.title = "Questions";


  // ~project overlay page ✅
  } else if (application.isProjectUrl(normalizedRoute)) {
    const projectDomain = application.removeFirstCharacter(normalizedRoute);
    application.showProjectOverlayPage(projectDomain);
    application.getRandomCategories();
    indexPage = IndexPage(application);
    return document.body.appendChild(indexPage);

  
  // user page ✅
  } else if (application.isUserProfileUrl(normalizedRoute)) {
    application.pageIsUserPage(true);
    const userLogin = normalizedRoute.substring(1, normalizedRoute.length);
    userPage = UserPage(application, userLogin);
    application.getUserByLogin(userLogin);
    document.body.appendChild(userPage);
    return document.title = decodeURI(normalizedRoute);


  // anon user page ✅
  } else if (application.isAnonUserProfileUrl(normalizedRoute)) {
    application.pageIsUserPage(true);
    const userId = application.anonProfileIdFromUrl(normalizedRoute);
    userPage = UserPage(application, userId);
    application.getUserById(userId);
    document.body.appendChild(userPage);
    return document.title = normalizedRoute;

    
  // team page ✅
  } else if (application.isTeamUrl(normalizedRoute)) {
    application.pageIsTeamPage(true);
    const team = application.getCachedTeamByUrl(normalizedRoute);
    const teamPage = TeamPage(application);
    application.getTeamById(team.id);
    document.body.appendChild(teamPage);
    return document.title = team.name;

    
  // search page ✅
  } else if (application.isSearchUrl(normalizedRoute, queryString)) {
    application.getRandomCategories();
    const query = queryString.q;
    application.searchQuery(query);
    application.searchTeams(query);
    application.searchUsers(query);
    application.searchProjects(query);
    const searchPage = SearchPage(application);
    document.body.appendChild(searchPage);
    return document.title = `Search for ${query}`;


  // category page ✅
  } else if (application.isCategoryUrl(normalizedRoute)) {
    application.getCategories();
    application.getCategory(normalizedRoute);
    const categoryPage = CategoryPage(application);
    document.body.appendChild(categoryPage);
    return document.title = application.category().name();    

    
  // lol wut
  } else if (normalizedRoute === 'wp-login.php') {
    return location.assign('https://www.youtube.com/embed/DLzxrzFCyOs?autoplay=1');

  // error page ✅
  } else {
    const errorPage = errorPageTemplate(application);
    document.body.appendChild(errorPage);
    return document.title = "👻 Page not found";
  }}).catch(function(error) {
  console.error(error);
  throw error;
});

document.addEventListener("click", event => globalclick(event));
document.addEventListener("keyup", function(event) {
  const escapeKey = 27;
  const tabKey = 9;
  if (event.keyCode === escapeKey) {
    return application.closeAllPopOvers();
  } else if (event.keyCode === tabKey) {
    return globalclick(event);
  }
});

var globalclick = function(event) {
  if (!$(event.target).closest('.pop-over, .opens-pop-over, .overlay').length) {
    return application.closeAllPopOvers();
  }
};
