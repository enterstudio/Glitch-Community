// TODO: This file was created by bulk-decaffeinate.
// Sanity-check the conversion and remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS103: Rewrite code to no longer use __guard__
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
// 🤔 in layout, only render this guy if application.overlayProject
// then can drop the null(?) checks

const OverlayProjectTemplate = require("../../templates/overlays/overlay-project");

const UsersList = require("../users-list");

const markdown = require('markdown-it')({html: true})
  .use(require('markdown-it-sanitizer'))
  .use(require('markdown-it-emoji'));
  
// currentPagePath = "/"

module.exports = function(application) {
  console.log("overlay project presented");

  var self = { 
    
    application,
    project: application.overlayProject,
    
    projectUsers() {
      if (application.overlayProject()) {
        return UsersList(application.overlayProject());
      }
    },
  
    overlayReadme() {
      const readme = __guard__(self.project(), x => x.readme());
      if (readme) {
        return self.mdToNode(readme.toString());
      }
    },

    projectDomain() {
      return __guard__(self.project(), x => x.domain());
    },

    projectId() {
      return __guard__(self.project(), x => x.id());
    },

    currentUserIsInProject() {
      return __guard__(self.project(), x => x.userIsCurrentUser(application));
    },

    hiddenIfCurrentUserInProject() {
      if (self.currentUserIsInProject()) { return 'hidden'; }
    },

    hiddenUnlessCurrentUserInProject() {
      if (!self.currentUserIsInProject()) { return 'hidden'; }
    },
      
    projectAvatar() {
      if (self.project()) {
        return `${CDN_URL}/project-avatar/${self.project().id()}.png`;
      }
    },
      
    showLink() { 
      return `https://${self.projectDomain()}.glitch.me`;
    },

    editorLink() {
      return `${EDITOR_URL}#!/${self.projectDomain()}`;
    },

    remixLink() {
      return `${EDITOR_URL}#!/remix/${self.projectDomain()}/${self.projectId()}`;
    },
      
    trackRemix() {
      analytics.track("Click Remix", {
        origin: "project overlay",
        baseProjectId: self.projectId(),
        baseDomain: self.projectDomain()
      }
      );
      return true;
    },

    hiddenUnlessOverlayProjectVisible() {
      if (!application.overlayProjectVisible()) { return "hidden"; }
    },

    stopPropagation(event) {
      return event.stopPropagation();
    },
      
    warningIfProjectNotFound() {
      if (__guard__(self.project(), x => x.projectNotFound())) { return "warning"; }
    },

    hiddenUnlessProjectNotFound() {
      if (!__guard__(self.project(), x => x.projectNotFound())) { return 'hidden'; }
    }, 
        
    hiddenIfProjectNotFound() {
      if ((self.project() === undefined) || __guard__(self.project(), x => x.projectNotFound())) { return 'hidden'; }
    },
    
    hiddenUnlessReadmeNotFound() {
      if (!__guard__(self.project(), x => x.readmeNotFound())) { return 'hidden'; }
    },

    hiddenIfOverlayReadmeLoaded() {
      if (__guard__(self.project(), x => x.readme()) || __guard__(self.project(), x1 => x1.projectNotFound()) || __guard__(self.project(), x2 => x2.readmeNotFound())) {
        return 'hidden';
      }
    }, 
      
    hideOverlay() {
      return self.project().hideOverlay(application);
    },

    mdToNode(md) {
      const node = document.createElement('span');
      node.innerHTML = markdown.render(md);
      return node;
    },

    showReadmeError() {
      const node = document.createElement('span');
      node.innerHTML = 
      `\
<h1>Couldn't get project info</h1>
<p>Maybe try another project? Maybe we're too popular right now?</p>
<p>(シ_ _)シ</p>\
`;
      return self.overlayReadme(node);
    },
        
    projectThoughtsMailto() {
      const projectDomain = self.projectDomain();
      const projectId = self.projectId();
      const support = "customer-service@fogcreek.com";
      const subject = `[Glitch] I have feelings about ${projectDomain}`;
      const body = `\
What do you think of the ${projectDomain} project? 
Is it great? Should we feature it? Is it malicious?

Let us know:





--------------------

Thanks 💖

– Glitch Team

(project id: ${projectId})\
`;
      return encodeURI(`mailto:${support}?subject=${subject}&body=${body}`);
    }
  };


  return OverlayProjectTemplate(self);
};

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}