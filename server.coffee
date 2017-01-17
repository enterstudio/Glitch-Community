assert = require "assert"
fs = require "fs"
bodyParser = require "body-parser"
express = require "express"
browserify = require('browserify-middleware')

app = express()

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

app.use express.static('public')
app.use '/js', browserify('./client')

# CORS
app.use (req, res, next) ->
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
  next()

# Logging
app.use (req, res, next) ->
  console.log(req.method, req.path, req.body)
  next()

app.get "/", (req, res) ->
  res.send("yo")

listener = app.listen process.env.PORT, ->
  console.log('Your app is listening on port ' + listener.address().port)
