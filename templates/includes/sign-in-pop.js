module.exports = function(data) {
  "use strict";
  return (function() {
    var __root;
    __root = require('hamlet.coffee')(this);
    __root.buffer(__root.element("dialog", this, {
      "class": ["pop-over", "sign-in-pop"],
      "click": this.stopPropagation
    }, function(__root) {
      __root.buffer(__root.element("section", this, {
        "class": ["pop-over-actions", "last-section"]
      }, function(__root) {
        __root.buffer(__root.element("a", this, {
          "class": ["button-link"],
          "href": this.FACEBOOK_AUTH_LINK
        }, function(__root) {
          __root.buffer(__root.element("button", this, {
            "class": ["button-small"]
          }, function(__root) {
            __root.buffer("Sign in with Facebook\n");
            __root.buffer(__root.element("span", this, {
              "class": ["emoji", "facebook"]
            }, function(__root) {}));
          }));
        }));
        __root.buffer(__root.element("a", this, {
          "class": ["button-link"],
          "href": this.GITHUB_AUTH_LINK
        }, function(__root) {
          __root.buffer(__root.element("button", this, {
            "class": ["button-small"]
          }, function(__root) {
            __root.buffer("Sign in with Github\n");
            __root.buffer(__root.element("span", this, {
              "class": ["emoji", "octocat"]
            }, function(__root) {}));
          }));
        }));
      }));
    }));
    return __root.root;
  }).call(data);
};
