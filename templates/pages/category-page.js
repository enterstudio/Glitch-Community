module.exports = function(data) {
  "use strict";
  return (function() {
    var Categories, Footer, HeaderPresenter, OverlayPresenter, __root;
    __root = require('hamlet.coffee')(this);
    Categories = require("../includes/categories");
    HeaderPresenter = require("../../presenters/header");
    OverlayPresenter = require("../../presenters/overlay");
    Footer = require("../includes/footer");
    __root.buffer(__root.element("div", this, {
      "class": ["content", "category-page"]
    }, function(__root) {
      var category, projects;
      __root.buffer(HeaderPresenter(this).template);
      category = this.category;
      projects = this.projects;
      __root.buffer(__root.element("main", this, {
        "role": "main"
      }, function(__root) {
        __root.buffer(__root.element("section", this, {}, function(__root) {
          __root.buffer(__root.element("article", this, {
            "class": ["projects"],
            "style": "background-color: " + category.background
          }, function(__root) {
            __root.buffer(__root.element("header", this, {
              "class": ["category"]
            }, function(__root) {
              __root.buffer(__root.element("a", this, {
                "class": ["category-name"]
              }, function(__root) {
                __root.buffer(__root.element("h2", this, {
                  "class": ["category-name"]
                }, function(__root) {
                  __root.buffer(category.name);
                }));
              }));
              __root.buffer(__root.element("span", this, {
                "class": ["category-image-container"]
              }, function(__root) {
                __root.buffer(__root.element("a", this, {
                  "class": ["category-image"]
                }, function(__root) {
                  __root.buffer(__root.element("img", this, {
                    "src": category.img
                  }, function(__root) {}));
                }));
              }));
              __root.buffer(__root.element("p", this, {
                "class": ["description"]
              }, function(__root) {
                __root.buffer(category.description);
              }));
            }));
            __root.buffer(__root.element("ul", this, {
              "class": ["projects-container"]
            }, function(__root) {
              this.projects.forEach(function(project) {
                return __root.buffer(project.template);
              });
            }));
          }));
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
