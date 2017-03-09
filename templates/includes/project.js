module.exports = function(data) {
  "use strict";
  return (function() {
    var category, glitchTeamAvatar, project, __root;
    __root = require('hamlet.coffee')(this);
    glitchTeamAvatar = "https://cdn.gomix.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2FdefaultAvatar.svg";
    project = this.project;
    category = this.category;
    __root.buffer(__root.element("li", this, {}, function(__root) {
      var showProjectOverlay;
      if (project.users) {
        __root.buffer(__root.element("div", this, {
          "class": ["users"]
        }, function(__root) {
          project.users.forEach(function(user) {
            return __root.buffer(__root.element("div", this, {
              "class": ["user"],
              "title": user.login,
              "data-tooltip": user.login,
              "data-tooltip-left": true
            }, function(__root) {
              __root.buffer(__root.element("img", this, {
                "width": 30,
                "height": 30,
                "src": user.avatarUrl,
                "style": "background-color:" + user.color
              }, function(__root) {}));
            }));
          });
        }));
        __root.buffer(__root.element("div", this, {
          "class": ["user-names"]
        }, function(__root) {
          var currentUser;
          currentUser = 0;
          project.users.forEach(function(user) {
            var totalUsers;
            totalUsers = project.users.length - 1;
            if (currentUser !== 0 && currentUser < totalUsers) {
              __root.buffer(__root.element("span", this, {}, function(__root) {
                __root.buffer(" , ");
              }));
            } else if (currentUser !== 0 && totalUsers > 0) {
              __root.buffer(__root.element("span", this, {}, function(__root) {
                __root.buffer(" and ");
              }));
            }
            __root.buffer(__root.element("span", this, {
              "class": ["user-name"]
            }, function(__root) {
              __root.buffer(user.login);
            }));
            return currentUser += 1;
          });
        }));
      } else {
        __root.buffer(__root.element("div", this, {
          "class": ["users"]
        }, function(__root) {
          __root.buffer(__root.element("div", this, {
            "class": ["user"],
            "title": "Glitch team",
            "data-tooltip": "Glitch team",
            "data-tooltip-left": true
          }, function(__root) {
            __root.buffer(__root.element("img", this, {
              "width": 30,
              "height": 30,
              "src": glitchTeamAvatar
            }, function(__root) {}));
          }));
        }));
      }
      showProjectOverlay = function() {
        return this.showProjectOverlay(project);
      };
      __root.buffer(__root.element("div", this, {
        "class": ["project"],
        "click": showProjectOverlay,
        "style": "background-color: " + category.color + "; border-bottom-color: " + category.color,
        "data-track": "project",
        "data-track-label": project.domain
      }, function(__root) {
        __root.buffer(__root.element("div", this, {
          "class": ["project-container"]
        }, function(__root) {
          __root.buffer(__root.element("img", this, {
            "class": ["avatar"],
            "src": "https://cdn.gomix.com/project-avatar/" + project.id + ".png"
          }, function(__root) {}));
          __root.buffer(__root.element("button", this, {}, function(__root) {
            __root.buffer(__root.element("div", this, {
              "class": ["project-name"]
            }, function(__root) {
              __root.buffer(project.domain);
            }));
          }));
          __root.buffer(__root.element("div", this, {
            "class": ["description"]
          }, function(__root) {
            __root.buffer(project.description);
          }));
          __root.buffer(__root.element("div", this, {
            "class": ["overflow-mask"],
            "style": "background-color: " + category.color
          }, function(__root) {}));
        }));
      }));
    }));
    return __root.root;
  }).call(data);
};
