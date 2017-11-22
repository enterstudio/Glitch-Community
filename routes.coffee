https = require 'https'
fs = require "fs"
rp = require "request-promise"
util = require "util"
{ spawn } = require 'child_process'
_ = require 'underscore'
express = require 'express'
CACHE_INTERVAL = 1000 * 60 * 30 # 30 minutes

fs_writeFile = util.promisify fs.writeFile

if process.env.RUNNING_ON is 'staging'
  APP_URL = 'https://staging.glitch.com'
  API_URL = 'https://api.staging.glitch.com/'
  EDITOR_URL = 'https://staging.glitch.com/edit/'
  CDN_URL = 'https://cdn.staging.glitch.com'
  GITHUB_CLIENT_ID = "65efbd87382354ca25e7"
  FACEBOOK_CLIENT_ID = "1858825521057112"
else
  APP_URL = 'https://glitch.com'
  API_URL = 'https://api.glitch.com/'
  EDITOR_URL = 'https://glitch.com/edit/'
  CDN_URL = 'https://cdn.glitch.com'
  GITHUB_CLIENT_ID = "b4cb743ed07e20abf0b2"
  FACEBOOK_CLIENT_ID = "660180164153542"

updateCache = (type) ->
  rp "#{API_URL}#{type}"
  .then (response) ->
    fs_writeFile "./cache/#{type}.json", response
    .then ->
      console.log "☂️ #{type} re-cached"
  .catch (error) ->
    console.error "☔️", error

updateCaches = ->
  updateCache 'categories'
  .then ->
    updateCache 'teams'
  .then ->
    process = spawn 'sh/rebuild-client.sh'
    process.on 'close', -> console.log "☂️ cache updated"

clientJs = ->
  if process.env.ENVIRONMENT is 'production'
    'client.min.js'
  else
    'client.js'

updateCaches()
setInterval updateCaches, CACHE_INTERVAL

module.exports = ->
  
  app = express.Router()
  
  # CORS - Allow pages from any domain to make requests to our API
  app.use (request, response, next) ->
    response.header("Access-Control-Allow-Origin", "*")
    response.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
    next()
    
  app.use express.static('public')

  # Log all requests for diagnostics
  app.use (request, response, next) ->
    console.log(request.method, request.originalUrl, request.body)
    next()

  app.post '/update-caches', (request, response) ->
    updateCaches()
    .then ->
      response.sendStatus 200

  app.get '*', (request, response, next) ->
    response.render 'index',
      route: request.path
      baseUrl: request.baseUrl
      clientJs: clientJs()
      API_URL: API_URL
      APP_URL: APP_URL
      EDITOR_URL: EDITOR_URL
      CDN_URL: CDN_URL
      GITHUB_CLIENT_ID: GITHUB_CLIENT_ID
      FACEBOOK_CLIENT_ID: FACEBOOK_CLIENT_ID
