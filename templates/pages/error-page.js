module.exports = function(data) {
  "use strict";
  return (function() {
    var logo, __root;
    __root = require('hamlet.coffee')(this);
    logo = "https://cdn.gomix.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fcarp.svg";
    __root.buffer(__root.element("div", this, {
      "class": ["content", "error-page"]
    }, function(__root) {
      __root.buffer(__root.element("div", this, {
        "class": ["container"]
      }, function(__root) {
        __root.buffer(__root.element("h1", this, {}, function(__root) {
          __root.buffer("Page Not Found\n");
        }));
        __root.buffer(__root.element("h2", this, {}, function(__root) {
          __root.buffer("Maybe a typo? Or perhaps it's moved?\n");
        }));
        __root.buffer(__root.element("div", this, {
          "class": ["actions"]
        }, function(__root) {
          __root.buffer(__root.element("a", this, {
            "href": "https://glitch.com"
          }, function(__root) {
            __root.buffer(__root.element("img", this, {
              "src": logo
            }, function(__root) {}));
          }));
        }));
        __root.buffer(__root.element("div", this, {
          "class": ["beta"]
        }, function(__root) {
          __root.buffer("beta\n");
        }));
        __root.buffer(__root.element("canvas", this, {
          id: ["stars"]
        }, function(__root) {}));
        __root.buffer(__root.element("script", this, {
          "src": "https://gomix.com/error-page.js"
        }, function(__root) {}));
      }));
    }));
    return __root.root;
  }).call(data);
};
