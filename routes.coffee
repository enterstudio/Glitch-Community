# model = require './model'
# utils = require './utils'
# render = require './render'

_ = require 'underscore'

module.exports = (app) ->

  # console.log utils.categoryUrls()

  app.get '/', (request, response) -> 
    console.log 'hello route hit'
    # response.end 'hello'
    response.sendFile __dirname + '/public/index.html'

  # redirect /index.html to ./
  # app.get '/index.html', (request, response) -> 
  #   response.redirect('./')

#   app.get '/projects', (request, response) ->
#     params = request.query
#     response.send model.projects()

#   app.get '/search', (request, response) ->
#     query = decodeURIComponent request.query.q
#     render.search request, response, query

#   app.get '/categories', (request, response) ->
#     render.categories request, response

  # app.get '/:categoryUrl', (request, response) ->
  #   categoryUrl = request.params.categoryUrl
  #   category = utils.getCategoryFromUrl categoryUrl
  #   if category
  #     render.category request, response, category
  #   else
  #     render.pageNotFound response



  # app.get '/:username', (request, response) ->
    # if request.get('Content-Type') is 'application/json'
      # return user object from api

  # app.get '/', render.index

  # app.use (request, response) -> 
  #   render.pageNotFound response
