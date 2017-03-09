module.exports = function(data) {
  "use strict";
  return (function() {
    var fogcreek, __root;
    __root = require('hamlet.coffee')(this);
    fogcreek = "https://cdn.hyperdev.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fus-east-1-044a595b-d397-4910-9ab0-e01def5c7dd4-logogroup.svg";
    __root.buffer(__root.element("section", this, {
      "class": ["by-fogcreek"],
      "role": "complementary"
    }, function(__root) {
      __root.buffer(__root.element("h2", this, {}, function(__root) {
        __root.buffer("Made By Fog Creek\n");
      }));
      __root.buffer(__root.element("img", this, {
        "src": fogcreek
      }, function(__root) {}));
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer("You might know us for making Trello, FogBugz, and co-creating Stack Overflow. We're\n");
        __root.buffer(__root.element("a", this, {
          "href": "https://www.fogcreek.com"
        }, function(__root) {
          __root.buffer("a friendly, self-funded company\n");
        }));
        __root.buffer(__root.element("span", this, {}, function(__root) {
          __root.buffer("that's been helping people make stuff for over 16 years.\n");
        }));
      }));
    }));
    return __root.root;
  }).call(data);
};
