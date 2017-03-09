module.exports = function(data) {
  "use strict";
  return (function() {
    var __root;
    __root = require('hamlet.coffee')(this);
    __root.buffer(__root.element("dialog", this, {
      "class": ["pop-over", "user-options-pop"],
      "click": this.stopPropagation
    }, function(__root) {
      __root.buffer(__root.element("section", this, {
        "class": ["pop-over-info", "last-section", "section-has-tertiary-buttons"]
      }, function(__root) {
        __root.buffer(__root.element("a", this, {
          "class": ["button-link"],
          "href": "#"
        }, function(__root) {
          __root.buffer(__root.element("button", this, {
            "class": ["button-small", "has-emoji", "button-tertiary", "button-on-secondary-background"]
          }, function(__root) {
            __root.buffer(__root.element("span", this, {}, function(__root) {
              __root.buffer("Sign Out\n");
            }));
            __root.buffer(__root.element("span", this, {
              "class": ["emoji", "balloon"]
            }, function(__root) {}));
          }));
        }));
      }));
    }));
    return __root.root;
  }).call(data);
};
