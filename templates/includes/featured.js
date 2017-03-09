module.exports = function(data) {
  "use strict";
  return (function() {
    var defaultAvatar, __root;
    __root = require('hamlet.coffee')(this);
    defaultAvatar = "https://cdn.gomix.com/0a15009e-17ee-4915-bc29-5ba03bb09517%2Favatar.svg";
    __root.buffer(__root.element("section", this, {
      "class": ["features"]
    }, function(__root) {
      __root.buffer(__root.element("h2", this, {}, function(__root) {
        __root.buffer("Featured Apps\n");
      }));
      __root.buffer(__root.element("ul", this, {}, function(__root) {
        var application;
        application = this;
        this.featuredProjects().forEach(function(project) {
          return __root.buffer(__root.element("li", this, {}, function(__root) {
            var showProjectOverlay;
            showProjectOverlay = function() {
              return application.showProjectOverlay(project);
            };
            __root.buffer(__root.element("div", this, {
              "class": ["featured-container"],
              "click": showProjectOverlay,
              "data-track": "featured project",
              "data-track-label": project.name
            }, function(__root) {
              __root.buffer(__root.element("img", this, {
                "class": ["featured"],
                "width": 30,
                "height": 30,
                "src": project.img
              }, function(__root) {}));
              __root.buffer(__root.element("p", this, {
                "class": ["project-name"]
              }, function(__root) {
                __root.buffer(project.name);
              }));
            }));
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
                      "src": user.avatarUrl
                    }, function(__root) {}));
                  }));
                });
              }));
            } else {
              __root.buffer(__root.element("div", this, {
                "class": ["users"]
              }, function(__root) {
                __root.buffer(__root.element("div", this, {
                  "class": ["user"],
                  "title": "Gomix team",
                  "data-tooltip": "Gomix team",
                  "data-tooltip-left": true
                }, function(__root) {
                  __root.buffer(__root.element("img", this, {
                    "width": 30,
                    "height": 30,
                    "src": defaultAvatar
                  }, function(__root) {}));
                }));
              }));
            }
          }));
        });
      }));
    }));
    return __root.root;
  }).call(data);
};
