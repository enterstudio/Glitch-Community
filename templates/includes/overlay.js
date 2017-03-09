module.exports = function(data) {
  "use strict";
  return (function() {
    var Loader, defaultAvatar, showIcon, __root;
    __root = require('hamlet.coffee')(this);
    Loader = require("./loader");
    showIcon = "https://cdn.gomix.com/6ce807b5-7214-49d7-aadd-f11803bc35fd%2Fshow-app.svg";
    defaultAvatar = "https://cdn.gomix.com/2bdfb3f8-05ef-4035-a06e-2043962a3a13%2FdefaultAvatar.svg";
    __root.buffer(__root.element("span", this, {}, function(__root) {
      __root.buffer(__root.element("div", this, {
        "class": ["overlay-background", this.isOverlayHidden],
        "click": this.hideOverlay
      }, function(__root) {
        __root.buffer(__root.element("dialog", this, {
          "class": ["overlay", this.hiddenUnlessProject],
          "click": this.stopPropagation
        }, function(__root) {
          __root.buffer(__root.element("section", this, {
            "class": ["pop-over-info"]
          }, function(__root) {
            __root.buffer(__root.element("img", this, {
              "class": ["avatar"],
              "src": this.projectAvatar
            }, function(__root) {}));
            __root.buffer(__root.element("div", this, {
              "class": ["overlay-title"]
            }, function(__root) {
              __root.buffer(this.projectDomain);
            }));
          }));
          __root.buffer(__root.element("section", this, {
            "class": ["pop-over-actions", "has-buttons"]
          }, function(__root) {
            __root.buffer(__root.element("a", this, {
              "class": ["button-link", "show-app-link"],
              "href": this.showLink,
              "onclick": this.overlayButtonClickHandler,
              "data-track": "overlay → show",
              "data-track-label": this.projectName
            }, function(__root) {
              __root.buffer(__root.element("div", this, {
                "class": ["button", "show-app"]
              }, function(__root) {
                __root.buffer(__root.element("img", this, {
                  "src": showIcon
                }, function(__root) {}));
                __root.buffer(__root.element("span", this, {}, function(__root) {
                  __root.buffer("Show App\n");
                }));
              }));
            }));
            __root.buffer(__root.element("a", this, {
              "class": ["button-link", "project-link"],
              "href": this.editorLink,
              "onclick": this.overlayButtonClickHandler,
              "data-track": "overlay → view code",
              "data-track-label": this.projectName
            }, function(__root) {
              __root.buffer(__root.element("div", this, {
                "class": ["button"]
              }, function(__root) {
                __root.buffer("View Code\n");
              }));
            }));
            __root.buffer(__root.element("a", this, {
              "class": ["button-link", "remix-link"],
              "href": this.remixLink,
              "onclick": this.overlayButtonClickHandler,
              "data-track": "overlay → remix",
              "data-track-label": this.projectName
            }, function(__root) {
              __root.buffer(__root.element("div", this, {
                "class": ["button", "cta-button"]
              }, function(__root) {
                __root.buffer("Remix your own\n");
              }));
            }));
          }));
          __root.buffer(__root.element("section", this, {
            "class": ["pop-over-actions", "markdown-container", this.warningIfReadmeError]
          }, function(__root) {
            __root.buffer(__root.element("div", this, {
              "class": ["project-users"]
            }, function(__root) {
              __root.buffer(__root.element("div", this, {
                "class": ["users"]
              }, function(__root) {
                if (this.projectUsers()) {
                  this.projectUsers().forEach(function(user) {
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
                } else {
                  __root.buffer(__root.element("div", this, {
                    "class": ["user"],
                    "title": "Glitch team",
                    "data-tooltip": "Glitch team",
                    "data-tooltip-left": true
                  }, function(__root) {
                    __root.buffer(__root.element("img", this, {
                      "width": 30,
                      "height": 30,
                      "src": defaultAvatar
                    }, function(__root) {}));
                  }));
                }
              }));
            }));
            __root.buffer(__root.element("div", this, {
              "class": ["markdown-content", this.hiddenUnlessOverlayReadmeLoaded]
            }, function(__root) {
              __root.buffer(this.overlayReadme);
            }));
            __root.buffer(__root.element("span", this, {
              "class": [this.hiddenIfOverlayReadmeLoaded]
            }, function(__root) {
              __root.buffer(Loader(this));
            }));
          }));
          __root.buffer(__root.element("section", this, {
            "class": ["pop-over-info", "last-section"]
          }, function(__root) {
            __root.buffer(__root.element("a", this, {
              "class": ["thoughts-link"],
              "href": this.projectThoughtsMailto
            }, function(__root) {
              __root.buffer(__root.element("button", this, {
                "class": ["button-small", "thoughts"]
              }, function(__root) {
                __root.buffer("What do you think?\n");
              }));
            }));
          }));
        }));
        __root.buffer(__root.element("dialog", this, {
          "class": ["overlay", this.hiddenUnlessVideo],
          "click": this.stopPropagation
        }, function(__root) {
          __root.buffer(__root.element("section", this, {
            "class": ["pop-over-actions"]
          }, function(__root) {
            __root.buffer(__root.element("div", this, {
              "class": ["wistia_responsive_padding"]
            }, function(__root) {
              __root.buffer(__root.element("div", this, {
                "class": ["wistia_responsive_wrapper"]
              }, function(__root) {
                __root.buffer(__root.element("div", this, {
                  "class": ["wistia_embed", "wistia_async_vskja9agqj"],
                  "videoFoam": true
                }, function(__root) {}));
              }));
            }));
          }));
        }));
      }));
    }));
    return __root.root;
  }).call(data);
};
