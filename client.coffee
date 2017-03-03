# This client-side CoffeeScript is compiled 
# by express browserify middleware using the
# coffeeify transform

console.log '🚒🚒🚒🚒'


application = require './application'
qs = require 'querystringify'
queryString = qs.parse window.location.search
normalizeSlashes = require 'normalize-slashes'

IndexTemplate = require "./templates/pages/index"

CategoryPage = require "./presenters/category-page"

normalizedRoute = normalizeSlashes route
console.log "route is #{normalizedRoute}"
console.log "query strings are", queryString
console.log "application is", application

# temp:
console.log "🌈 isSignedIn", application.user.isSignedIn()

# client-side routing

Promise.resolve()
.then ->
  if normalizedRoute is "login/github"
    normalizedRoute = ""
    application.loginWithOAuthCode queryString.code, "github"
.then ->
  index = IndexTemplate application
  
  if normalizedRoute is ""
    document.body.appendChild index
    application.overlay.showProjectOverlayIfPermalink queryString

  else if application.isCategoryUrl(normalizedRoute)
    category = application.getCategoryFromUrl normalizedRoute
    categoryPage = CategoryPage(application, category).template()
    document.body.appendChild categoryPage

# else if first char is @
  # profile pages

# document.addEventListener "keydown", (event) ->
#   application.closeAllPopOvers event

document.addEventListener "click", (event) ->
  # application.tracking.init event
  application.closeAllPopOvers()
