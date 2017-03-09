_ = require 'underscore'
express = require 'express'

curated = require "./curated"

module.exports = ->
  
  app = express.Router()
  
  # CORS - Allow pages from any domain to make requests to our API
  app.use (req, res, next) ->
    res.header("Access-Control-Allow-Origin", "*")
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
    next()
    
  app.use express.static('public')

  # Log all requests for diagnostics
  app.use (req, res, next) ->
    console.log(req.method, req.originalUrl, req.body)
    next()

  app.get '*', (req, res, next) ->
    res.render('index', route: req.path, baseUrl: req.baseUrl)

  # community api
  app.get '/curated/projects', (request, response) ->
    response.jsonp curated.projects()
