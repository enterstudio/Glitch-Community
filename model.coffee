utils = require "./utils/utils"

self = 
  utils: utils
  
  hello: 'sup'
  
  clickTest: ->
    alert 'yo'

module.exports = self
