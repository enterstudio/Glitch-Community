module.exports = function(data) {
  "use strict";
  return (function() {
    var Categories, Footer, HeaderPresenter, Loader, OverlayPresenter, ProjectPresenter, cat, __root;
    __root = require('hamlet.coffee')(this);
    cat = "https://cdn.gomix.com/us-east-1%3Acba180f4-ee65-4dfc-8dd5-f143280d3c10%2Fcat.svg";
    Categories = require("../includes/categories");
    HeaderPresenter = require("../../presenters/header");
    ProjectPresenter = require("../../presenters/project");
    OverlayPresenter = require("../../presenters/overlay");
    Footer = require("../includes/footer");
    Loader = require("../includes/loader");
    __root.buffer(__root.element("div", this, {
      "class": ["content", "search-results"]
    }, function(__root) {
      __root.buffer(HeaderPresenter(this).template);
      __root.buffer(__root.element("main", this, {
        "class": ["search-results"],
        "role": "main"
      }, function(__root) {
        __root.buffer(__root.element("article", this, {
          "class": ["projects"]
        }, function(__root) {
          __root.buffer(__root.element("ul", this, {
            "class": ["projects-container"]
          }, function(__root) {
            var context;
            context = this;
            this.searchResultsProjects().forEach(function(project) {
              return __root.buffer(ProjectPresenter(context, project, {}).template);
            });
          }));
        }));
        __root.buffer(__root.element("span", this, {
          "class": [this.self.hiddenIfSearchResultsLoaded]
        }, function(__root) {
          __root.buffer(Loader(this));
        }));
        __root.buffer(__root.element("span", this, {
          "class": [this.self.hiddenIfNoResults]
        }, function(__root) {
          __root.buffer(__root.element("p", this, {}, function(__root) {
            __root.buffer("no results\n");
          }));
          __root.buffer(__root.element("img", this, {
            "src": cat
          }, function(__root) {}));
        }));
        __root.buffer(Categories(this));
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
