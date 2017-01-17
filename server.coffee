assert = require "assert"
fs = require "fs"
bodyParser = require "body-parser"
express = require "express"

app = express()

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

browserify = require('browserify-middleware')
browserify.settings
  transform: ['coffeeify']

app.use '/client.js', browserify(__dirname + '/client.coffee')

# CORS
app.use (req, res, next) ->
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
  next()

# Logging
app.use (req, res, next) ->
  console.log(req.method, req.path, req.body)
  next()

# Serve Static files from public/
app.use express.static('public')

# Listen on App port
listener = app.listen process.env.PORT, ->
  console.log('Your app is listening on port ' + listener.address().port)
