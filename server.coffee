fs = require "fs"
express = require "express"
router = express.Router()
stylish = require 'stylish'
autoprefixer = require 'autoprefixer-stylus'

app = express()

# Accept JSON as req.body
bodyParser = require "body-parser"
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

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
  console.log(req.method, req.path, req.body)
  next()

# Serve Static files from public/
app.use express.static('public')

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

      
# Listen on App port
listener = app.listen process.env.PORT, ->
  console.log('Your app is listening on port ' + listener.address().port)

routes = require('./routes')(router);

app.use '/community', router
app.use '/', router

