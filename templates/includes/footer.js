module.exports = function(data) {
  "use strict";
  return (function() {
    var about, blog, editor, help, legal, remix, remixButton, status, support, __root;
    __root = require('hamlet.coffee')(this);
    remixButton = "https://cdn.gomix.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fremix-button.svg";
    about = "https://gomix.com/about/";
    blog = "https://medium.com/gomix";
    help = "https://gomix.com/help/faqs/";
    status = "http://status.gomix.com/";
    support = "https://support.gomix.com/latest";
    legal = "https://gomix.com/legal/";
    editor = "https://gomix.com/#!/project/community";
    remix = "https://gomix.com/#!/remix/community/6ce807b5-7214-49d7-aadd-f11803bc35fd";
    __root.buffer(__root.element("footer", this, {
      "role": "contentinfo"
    }, function(__root) {
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": remix
        }, function(__root) {
          __root.buffer(__root.element("img", this, {
            "src": remixButton
          }, function(__root) {}));
        }));
      }));
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": editor
        }, function(__root) {
          __root.buffer("View Code\n");
        }));
      }));
      __root.buffer(__root.element("hr", this, {}, function(__root) {}));
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": about,
          "data-track": "footer → about"
        }, function(__root) {
          __root.buffer("About\n");
        }));
      }));
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": blog,
          "data-track": "footer → blog"
        }, function(__root) {
          __root.buffer("Blog\n");
        }));
      }));
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": help,
          "data-track": "footer → faq"
        }, function(__root) {
          __root.buffer("FAQ\n");
        }));
      }));
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": status,
          "data-track": "footer → system status"
        }, function(__root) {
          __root.buffer("System Status\n");
        }));
      }));
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": support,
          "data-track": "footer → support forum"
        }, function(__root) {
          __root.buffer("Support Forum\n");
        }));
      }));
      __root.buffer(__root.element("p", this, {}, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": legal,
          "data-track": "footer → legal stuff"
        }, function(__root) {
          __root.buffer("Legal Stuff\n");
        }));
      }));
    }));
    return __root.root;
  }).call(data);
};
