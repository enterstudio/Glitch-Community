module.exports = function(data) {
  "use strict";
  return (function() {
    var SignInPopPresenter, logo, play, __root;
    __root = require('hamlet.coffee')(this);
    logo = "https://cdn.gomix.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2Fcarp.svg";
    play = "https://cdn.hyperdev.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fplay.svg";
    SignInPopPresenter = require("../../presenters/sign-in-pop");
    __root.buffer(__root.element("header", this, {
      "role": "banner"
    }, function(__root) {
      __root.buffer(__root.element("div", this, {
        "class": ["header-info"]
      }, function(__root) {
        __root.buffer(__root.element("a", this, {
          "href": "/community"
        }, function(__root) {
          __root.buffer(__root.element("img", this, {
            "class": ["logo"],
            "src": logo
          }, function(__root) {}));
        }));
        __root.buffer(__root.element("h1", this, {
          "class": ["headline"]
        }, function(__root) {
          __root.buffer(__root.element("a", this, {
            "href": "/community"
          }, function(__root) {
            __root.buffer(__root.element("span", this, {}, function(__root) {
              __root.buffer("Glitch");
            }));
          }));
          __root.buffer(__root.element("span", this, {}, function(__root) {
            __root.buffer(" ");
          }));
          __root.buffer(__root.element("span", this, {}, function(__root) {
            __root.buffer("is the easiest way to build the app or bot of your dreams\n");
          }));
        }));
        __root.buffer(__root.element("span", this, {
          "class": [this.hiddenIfUserIsSignedIn]
        }, function(__root) {
          __root.buffer(__root.element("p", this, {
            "class": ["about"]
          }, function(__root) {
            __root.buffer("With working example apps to remix, a code editor to modify them, instant hosting and deployment - anybody can build a web app on Gomix, for free.\n");
            __root.buffer(__root.element("a", this, {
              "href": "https://glitch.com/about"
            }, function(__root) {
              __root.buffer("Learn more\n");
            }));
          }));
          __root.buffer(__root.element("p", this, {
            "class": ["video"],
            "click": this.showVideoOverlay
          }, function(__root) {
            __root.buffer(__root.element("img", this, {
              "class": ["play-button"],
              "src": play
            }, function(__root) {}));
            __root.buffer(__root.element("span", this, {}, function(__root) {
              __root.buffer("How it works in 2 minutes\n");
            }));
          }));
        }));
      }));
      __root.buffer(__root.element("nav", this, {
        "role": "navigation"
      }, function(__root) {
        __root.buffer(__root.element("form", this, {
          "action": "/community/search",
          "method": "get",
          "role": "search"
        }, function(__root) {
          __root.buffer(__root.element("input", this, {
            "class": ["search-input"],
            "name": "q",
            "placeholder": "bots, apps, tutorials",
            "value": this.application.searchQuery
          }, function(__root) {}));
        }));
        __root.buffer(__root.element("span", this, {
          "class": [this.hiddenIfUserIsSignedIn]
        }, function(__root) {
          __root.buffer(__root.element("button", this, {
            "class": ["button-small", "opens-pop-over"],
            "click": this.toggleSignInPopVisible
          }, function(__root) {
            __root.buffer("Sign in\n");
          }));
          __root.buffer(__root.element("span", this, {
            "class": [this.popHiddenUnlessSignInPopVisible]
          }, function(__root) {
            __root.buffer(SignInPopPresenter(this.application).template);
          }));
        }));
        __root.buffer(__root.element("span", this, {
          "class": [this.hiddenUnlessUserIsSignedIn]
        }, function(__root) {
          __root.buffer(__root.element("div", this, {
            "class": ["user"]
          }, function(__root) {
            __root.buffer(__root.element("img", this, {
              "src": this.userAvatar,
              "width": 30,
              "height": 30
            }, function(__root) {}));
          }));
        }));
      }));
    }));
    return __root.root;
  }).call(data);
};
