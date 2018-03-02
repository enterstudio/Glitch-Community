// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS101: Remove unnecessary use of Array.from
 * DS102: Remove unnecessary code created because of implicit returns
 * DS207: Consider shorter variations of null checks
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
/*
We use a cache to keep an identity map of categories by id.

When constructing a user model Category(...) if it has an id
field it will be cached based on the id. If the id already
exists in the cache the same reference to that model will be
returned.

If the id property is not given the model is not cached.

*/

let Category;
const cache = {};

const Model = require('./model');

module.exports = (Category = function(I, self) {

  if (I == null) { I = {}; }
  if (self == null) { self = Model(I); }
  if (cache[I.id]) {
    return cache[I.id];
  }
  
  self.defaults(I, {
    avatarUrl: undefined,
    backgroundColor: undefined,
    color: undefined,
    description: undefined,
    name: undefined,
    url: undefined,
    projects: []
  });

  self.attrObservable(...Array.from(Object.keys(I) || []));
  
  self.attrModels('projects', Project);
  self.attrObservable("gettingCategory", "fetched");

  self.extend({
    hasProjects() {
      if (self.projects().length) { return true; }
    }
  });

  if (I.id) {
    cache[I.id] = self;
  }
  // console.log '☎️ category cache', cache

  return self;
});


Category.getRandomCategories = function(application, numberOfCategories, projectsPerCategory) {
  let categoriesPath;
  console.log('🎷🎷🎷 get random categories');
  if (numberOfCategories && numberOfProjects) {
    categoriesPath = "categories/random";
  } else if (numberOfCategories) {
    categoriesPath = "categories/random?numCategories=2";
  } else if (projectsPerCategory) {
    categoriesPath = "categories/random?projectsPerCategory=2";
  } else {
    categoriesPath = "categories/random";
  }
  return application.api().get(categoriesPath)
  .then(({data}) =>
    data.map(categoryDatum => Category(categoryDatum).update(categoryDatum))
  );
};

Category.getCategories = function(application) {
  console.log('🎷🎷🎷 get categories');
  const categoriesPath = "categories";
  return application.api().get(categoriesPath)
  .then(({data}) =>
    data.map(categoryDatum => Category(categoryDatum).update(categoryDatum))
  );
};

Category.updateCategory = function(application, id) {
  const categoriesPath = `categories/${id}`;
  return application.api().get(categoriesPath)
  .then(function({data}) {
    data.fetched = true;
    Category(data).update(data); // .pushSearchResult(application)
    application.getProjects(data.projects);
    return application.categoryProjectsLoaded(true);
  });
};


Category._cache = cache;

// Circular dependencies must go below module.exports
var Project = require('./project');
