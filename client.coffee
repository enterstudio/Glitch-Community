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

normalizedRoute = normalizeSlashes route
console.log "route is #{normalizedRoute}"
console.log "query strings are", queryString
console.log "application is", application

# client-side routing

if normalizedRoute is ""
  document.body.appendChild index
  application.overlay.showProjectOverlayIfPermalink queryString

else if application.isCategoryUrl(normalizedRoute)
  category = application.getCategoryFromUrl normalizedRoute
  console.log category # 
  categoryPage = CategoryPage(application, category).template()
  document.body.appendChild categoryPage


  
  
  
# document.addEventListener "keydown", (event) ->
#   application.closeAllPopOvers event

# document.addEventListener "click", (event) ->
#   application.tracking.init event