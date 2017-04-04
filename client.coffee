# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

application = require './application.coffee'
qs = require 'querystringify'
queryString = qs.parse window.location.search

IndexTemplate = require "./templates/pages/index"
CategoryPage = require "./presenters/category-page"
Search = require "./presenters/search"
errorPageTemplate = require "./templates/pages/error-page"

normalizedRoute = route.replace(/^\/|\/$/g, "")
console.log "normalizedRoute is #{normalizedRoute}"
console.log "query strings are", queryString
console.log "application is", application
console.log "🌈 isSignedIn", application.user.isSignedIn()

# client-side routing:
Promise.resolve()
.then ->
  if document.location.hash.startsWith "#!/"
    document.location = "https://glitch.com/edit/" + document.location.hash
    return
.then ->
  if normalizedRoute.startsWith "login/"
    application.login normalizedRoute.substring("login/".length), queryString.code
    .then ->
      history.replaceState null, null, "#{baseUrl}/"
      normalizedRoute = ""
.then ->
  index = IndexTemplate application
  errorPage = errorPageTemplate application
  application.user.getUserRecentProjects()
  
  if normalizedRoute is "index.html"
    normalizedRoute = ""
  
  if normalizedRoute is ""
    document.body.appendChild index

  else if application.isCategoryUrl(normalizedRoute)
    console.log 'hi'
    category = application.getCategoryFromUrl normalizedRoute
    categoryPage = CategoryPage(application, category).template()
    document.body.appendChild categoryPage
    document.title = category.name

  else if application.isProjectUrl(normalizedRoute)
    projectDomain = application.removeFirstCharacter normalizedRoute
    document.body.appendChild index
    application.overlay.showProjectOverlayForProject projectDomain

  # else if application.isUserProfileUrl(normalizedRoute)
  #   document.body.append '🙋 hello im a @profile page'

  else if application.isSearchUrl(normalizedRoute, queryString)
    application.searchQuery queryString.q
    searchPage = Search(application).template()
    document.body.appendChild searchPage
    document.title = queryString.q

  else
    document.body.appendChild errorPage
    document.title = "👻 Page not found"

# document.addEventListener "keydown", (event) ->
#   application.closeAllPopOvers event

# application.tracking.init event

document.addEventListener "click", (event) ->
  globalclick event
document.addEventListener "touchstart", (event) ->
  globalclick event  
globalclick = (event) ->
  unless $(event.target).closest('.pop-over, .opens-pop-over, .overlay').length
    application.closeAllPopOvers()
