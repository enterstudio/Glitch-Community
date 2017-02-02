search = require "./utils/search"


self = 
  utils:
    search: search
  
  hello: 'sup'

  clickTest: ->
    alert 'yo'

module.exports = self
