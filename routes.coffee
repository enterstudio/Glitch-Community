_ = require 'underscore'
express = require 'express'
stylish = require 'stylish'
autoprefixer = require 'autoprefixer-stylus'

curated = require "./curated"

module.exports = ->
  
  app = express.Router()
  
  jadeletTransform = require './lib/jadelify'

  # Configure browserify middleware to serve client.coffee as client.js
  # and to allow requiring .jadelet files as templates
  browserify = require('browserify-middleware')
  browserify.settings
    transform: ['coffeeify', jadeletTransform]
    extensions: ['.coffee', '.litcoffee', '.jadelet']
  app.use '/client.js', browserify(__dirname + '/client.coffee')

  # CORS - Allow pages from any domain to make requests to our API
  app.use (req, res, next) ->
    res.header("Access-Control-Allow-Origin", "*")
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
    next()

  # Log all requests for diagnostics
  app.use (req, res, next) ->
    console.log(req.method, req.originalUrl, req.body)
    next()

  # Configure stylus and autoprefixer support
  app.use stylish
    src: __dirname + '/public'
    setup: (renderer) ->
      renderer.use autoprefixer()
    watchCallback: (error, filename) ->
      if error
        console.error error
      else
        console.log "#{filename} compiled to css"

  app.get '*', (req, res, next) ->
    res.render('index', route: req.path, baseUrl: req.baseUrl)

  # community api
  app.get '/curated/projects', (request, response) ->
    response.jsonp curated.projects()

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
