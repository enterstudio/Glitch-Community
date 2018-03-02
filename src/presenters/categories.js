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
