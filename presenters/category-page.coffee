CategoryPageTemplate = require "../templates/pages/category-page"

self = (application, category) ->

  template: ->
    templateModel = Object.assign {}, application
    templateModel.category = category
    CategoryPageTemplate templateModel

module.exports = self
