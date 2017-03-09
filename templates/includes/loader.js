module.exports = function(data) {
  "use strict";
  return (function() {
    var __root;
    __root = require('hamlet.coffee')(this);
    __root.buffer(__root.element("div", this, {
      "class": ["loader"]
    }, function(__root) {
      __root.buffer(__root.element("div", this, {
        "class": ["moon"]
      }, function(__root) {}));
      __root.buffer(__root.element("div", this, {
        "class": ["earth"]
      }, function(__root) {}));
      __root.buffer(__root.element("div", this, {
        "class": ["asteroid"]
      }, function(__root) {}));
      __root.buffer(__root.element("div", this, {
        "class": ["asteroid-dust"]
      }, function(__root) {}));
    }));
    return __root.root;
  }).call(data);
};
