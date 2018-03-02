FeaturedCollectionTemplate = require "../templates/includes/featured-collection"

module.exports = (application, collection) ->
  self =
    collection: collection

    title: ->
      collection.title
    
    src: ->
      collection.img
        
    link: ->
      collection.link
      
  return FeaturedCollectionTemplate self
