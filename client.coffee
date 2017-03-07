# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

application = require './application.coffee'
qs = require 'querystringify'
queryString = qs.parse window.location.search
normalizeSlashes = require 'normalize-slashes'

IndexTemplate = require "./templates/pages/index"
index = IndexTemplate application
CategoryPage = require "./presenters/category-page"
Search = require "./presenters/search"
error404Template = require "./templates/pages/404"
error404 = error404Template application


normalizedRoute = normalizeSlashes route
console.log "route is #{normalizedRoute}"
console.log "query strings are", queryString
console.log "application is", application
console.log "🌈 isSignedIn", application.user.isSignedIn()

# client-side routing:

if normalizedRoute is ""
  document.body.appendChild index

else if application.isCategoryUrl(normalizedRoute)
  category = application.getCategoryFromUrl normalizedRoute
  categoryPage = CategoryPage(application, category).template()
  document.body.appendChild categoryPage
  
else if application.isProjectUrl(normalizedRoute)
  projectDomain = application.removeFirstCharacter normalizedRoute
  document.body.appendChild index
  application.overlay.showProjectOverlayForProject projectDomain

# else if application.isUserProfileUrl(normalizedRoute)
#   document.body.append '🙋 hello im a @profile page'

else if application.isSearchUrl(normalizedRoute, queryString)
  # searchResults = application.search.getSearchResults normalizedRoute
  application.searchQuery queryString.q
  searchPage = Search(application).template()
  console.log searchPage
  document.body.appendChild searchPage

else
  document.body.appendChild error404
  # document.innerHTML = data.toString()
  # document.body.append '404 page goes here'

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
