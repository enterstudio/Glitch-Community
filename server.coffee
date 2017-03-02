fs = require "fs"
express = require "express"

app = express()

# Accept JSON as req.body
bodyParser = require "body-parser"
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.set('view engine', 'ejs')
      
router = require('./routes')();

# router('/community')

app.use '/community-test', router
app.use '/community', router
app.use '/', router

# Serve Static files from public/
app.use express.static('public')

# Listen on App port
listener = app.listen process.env.PORT, ->
  console.log('Your app is listening on port ' + listener.address().port)
