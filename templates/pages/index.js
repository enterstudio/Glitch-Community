module.exports = function(data) {
  "use strict";
  return (function() {
    var ByFogcreek, Categories, CategoryPresenter, Featured, Footer, HeaderPresenter, OverlayPresenter, RecentProjectsPresenter, __root;
    __root = require('hamlet.coffee')(this);
    Featured = require("../includes/featured");
    Categories = require("../includes/categories");
    ByFogcreek = require("../includes/by-fogcreek");
    Footer = require("../includes/footer");
    HeaderPresenter = require("../../presenters/header");
    CategoryPresenter = require("../../presenters/category");
    OverlayPresenter = require("../../presenters/overlay");
    RecentProjectsPresenter = require("../../presenters/recent-projects");
    __root.buffer(__root.element("div", this, {
      "class": ["content"]
    }, function(__root) {
      __root.buffer(HeaderPresenter(this).template);
      __root.buffer(__root.element("main", this, {
        "role": "main"
      }, function(__root) {
        var application;
        if (this.user.cachedUser()) {
          __root.buffer(RecentProjectsPresenter(this).template);
        }
        __root.buffer(Featured(this));
        application = this;
        this.selectedCategories().forEach(function(category) {
          return __root.buffer(CategoryPresenter(application, category).template);
        });
        __root.buffer(Categories(this));
        __root.buffer(ByFogcreek(this));
      }));
      __root.buffer(Footer(this));
      __root.buffer(__root.element("article", this, {}, function(__root) {
        __root.buffer(OverlayPresenter(this).template);
      }));
      __root.buffer(__root.element("div", this, {
        "class": ["beta"]
      }, function(__root) {
        __root.buffer("beta\n");
      }));
    }));
    return __root.root;
  }).call(data);
};
