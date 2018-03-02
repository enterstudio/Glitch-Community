// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const CategoriesTemplate = require("../templates/includes/categories");

module.exports = function(application) {
  const self = {

    categories() {
      // console.log "application.cate", application.categories
      return application.categories();
    }
  };
  
  return CategoriesTemplate(self);
};
