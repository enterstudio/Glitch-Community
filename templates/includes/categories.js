module.exports = function(data) {
  "use strict";
  return (function() {
    var __root;
    __root = require('hamlet.coffee')(this);
    __root.buffer(__root.element("section", this, {
      "class": ["categories"],
      "role": "navigation"
    }, function(__root) {
      __root.buffer(__root.element("h2", this, {}, function(__root) {
        __root.buffer("More Ideas\n");
      }));
      __root.buffer(__root.element("ul", this, {}, function(__root) {
        this.categories().forEach(function(category) {
          return __root.buffer(__root.element("a", this, {
            "class": ["category-box-link"],
            "href": category.url
          }, function(__root) {
            __root.buffer(__root.element("li", this, {}, function(__root) {
              __root.buffer(__root.element("div", this, {
                "class": ["category-box", "centered"],
                "style": "background-color: " + category.color
              }, function(__root) {
                __root.buffer(__root.element("img", this, {
                  "src": category.img
                }, function(__root) {}));
              }));
              __root.buffer(__root.element("div", this, {
                "class": ["category-box-label", "centered"],
                "style": "background-color: " + category.color
              }, function(__root) {
                __root.buffer(category.name);
              }));
            }));
          }));
        });
      }));
    }));
    return __root.root;
  }).call(data);
};
