module.exports = function(data) {
  "use strict";
  return (function() {
    var SignInPopPresenter, __root;
    __root = require('hamlet.coffee')(this);
    SignInPopPresenter = require("../../presenters/sign-in-pop");
    __root.buffer(__root.element("section", this, {
      "class": ["profile"]
    }, function(__root) {
      __root.buffer(__root.element("h2", this, {}, function(__root) {
        __root.buffer("Your Projects\n");
      }));
      __root.buffer(__root.element("div", this, {
        "class": ["recent-projects"]
      }, function(__root) {
        __root.buffer(__root.element("div", this, {
          "class": ["profile-info"]
        }, function(__root) {
          __root.buffer(__root.element("div", this, {
            "class": ["user-avatar-container"]
          }, function(__root) {
            __root.buffer(__root.element("div", this, {
              "class": ["user-avatar", this.userAvatarIsAnon],
              "style": "background-color: " + this.userAvatarColor
            }, function(__root) {
              if (this.userAvatarImage) {
                __root.buffer(__root.element("img", this, {
                  "src": this.userAvatarImage
                }, function(__root) {}));
              }
            }));
          }));
          __root.buffer(__root.element("a", this, {
            "href": "https://glitch.com/edit"
          }, function(__root) {
            __root.buffer(__root.element("button", this, {
              "class": ["cta-button"]
            }, function(__root) {
              __root.buffer("Start Coding\n");
            }));
          }));
        }));
        __root.buffer(__root.element("article", this, {
          "class": ["projects"]
        }, function(__root) {
          __root.buffer(__root.element("ul", this, {
            "class": ["projects-container"]
          }, function(__root) {
            this.projects().forEach(function(project) {
              return __root.buffer(project.template);
            });
            if (!this.userIsSignedIn) {
              __root.buffer(__root.element("li", this, {}, function(__root) {
                __root.buffer(__root.element("div", this, {
                  "class": ["project", "anon-user-sign-up", "opens-pop-over"],
                  "click": this.toggleSignInPopVisible
                }, function(__root) {
                  __root.buffer(__root.element("p", this, {}, function(__root) {
                    __root.buffer("Access all your projects anywhere\n");
                  }));
                  __root.buffer(__root.element("button", this, {}, function(__root) {
                    __root.buffer("Sign in\n");
                  }));
                  __root.buffer(__root.element("span", this, {
                    "class": [this.popHiddenUnlessSignInPopVisible]
                  }, function(__root) {
                    __root.buffer(SignInPopPresenter(this.application).template);
                  }));
                }));
              }));
            }
          }));
        }));
      }));
    }));
    return __root.root;
  }).call(data);
};
