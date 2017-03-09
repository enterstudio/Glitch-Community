fs = require "fs"
express = require "express"

app = express()

# Accept JSON as req.body
bodyParser = require "body-parser"
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.set('view engine', 'ejs')
      
router = require('./routes')();

app.use '/community-test', router
app.use '/', router

# Listen on App port
listener = app.listen process.env.PORT, ->
  console.log('Your app is listening on port ' + listener.address().port)
