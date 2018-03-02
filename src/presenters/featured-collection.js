/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const FeaturedCollectionTemplate = require("../templates/includes/featured-collection");

module.exports = function(application, collection) {
  const self = {
    collection,

    title() {
      return collection.title;
    },
    
    src() {
      return collection.img;
    },
        
    link() {
      return collection.link;
    }
  };
      
  return FeaturedCollectionTemplate(self);
};
