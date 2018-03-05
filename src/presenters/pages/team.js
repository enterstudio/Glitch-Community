const Observable = require('o_0');
const _ = require('lodash');
const md = require('markdown-it')({
  breaks: true,
  linkify: true,
  typographer: true
});

const TeamTemplate = require("../../templates/pages/team");
const LayoutPresenter = require("../layout");
const CtaButtonsPresenter = require("../cta-buttons");
const AddTeamUserPopPresenter = require("../pop-overs/add-team-user-pop");
const AddTeamProjectPopPresenter = require("../pop-overs/add-team-project-pop");
const ProjectsListPresenter = require("../projects-list");
const TeamUserPresenter = require("../team-user-avatar");
const AnalyticsPresenter = require("../analytics");
const UserAvatarTemplate = require("../../templates/includes/user-avatar"); //

module.exports = function(application) {
  const assetUtils = require('../../utils/assets')(application);

  var self = {

    application,
    team: application.team,
    hiddenIfTeamFetched() { return application.team().hiddenIfFetched(); },
    hiddenUnlessTeamFetched() { return application.team().hiddenUnlessFetched(); },
    initialTeamDescription: Observable(undefined),

    verifiedTeamTooltip() {
      return application.team().verifiedTooltip();
    },

    teamUsers() {
      const users = application.team().users();
      if (self.currentUserIsOnTeam()) {
        return users.map(user => TeamUserPresenter(application, user));
      } else {
        return users.map(UserAvatarTemplate);
      }
    },

    teamAnalytics() {
      if (self.team().fetched()) {
        return AnalyticsPresenter(application, self.team());
      }
    },

    ctaButtons() {
      return CtaButtonsPresenter(application);
    },

    addTeamUserPop() {
      return AddTeamUserPopPresenter(application);
    },

    addTeamProjectPop() {
      return AddTeamProjectPopPresenter(application);
    },

    coverUrl() {
      if (application.team().localCoverImage()) {
        return application.team().localCoverImage();
      } else {
        return application.team().coverUrl();
      }
    },

    teamProfileStyle() {
      return {
        backgroundColor: application.team().coverColor(),
        backgroundImage: `url('${self.coverUrl()}')`
      };
    },

    teamAvatarStyle() {
      if (application.team().hasAvatarImage()) {
        return {backgroundImage: `url('${self.teamAvatarUrl()}')`};
      } else {
        return {backgroundColor: application.team().backgroundColor()};
      }
    },
      
    teamName() {
      return application.team().name();
    },

    teamThanks() {
      return application.team().teamThanks();
    },

    isVerified() {
      return application.team().isVerified();
    },

    verifiedImage() {
      return application.team().verifiedImage();
    },
      
    hiddenUnlessVerified() {
      if (!self.isVerified()) { return 'hidden'; }
    },

    hiddenUnlessTeamHasThanks() {
      if (!(application.team().thanksCount() > 0)) { return 'hidden'; }
    }, 

    currentUserIsOnTeam() {
      return application.team().currentUserIsOnTeam(application);
    },

    hiddenUnlessCurrentUserIsOnTeam() {
      if (!self.currentUserIsOnTeam(application)) { return 'hidden'; }
    },

    hiddenIfCurrentUserIsOnTeam() {
      if (self.currentUserIsOnTeam(application)) { return 'hidden'; }
    },
        
    description() {
      const text = application.team().description();
      const node = document.createElement('span');
      node.innerHTML = md.render(text);
      return node;
    },

    setInitialTeamDescription() {
      const description = application.team().description();
      const node = document.createElement('span');
      node.innerHTML = md.render(description);
      if (description) {
        return self.initialTeamDescription(node);
      }
    },

    updateDescription(event) {
      const text = event.target.textContent;
      application.team().description(text);
      return self.updateTeam({
        description: text});
    },

    updateTeam: _.debounce(data => application.team().updateTeam(application, data)
    , 250),

    applyDescription(event) {
      return event.target.innerHTML = md.render(application.team().description());
    },
      // application.notifyUserDescriptionUpdated true

    teamAvatarUrl() {
      if (application.team().localAvatarImage()) {
        return application.team().localAvatarImage();
      } else {
        return application.team().teamAvatarUrl('large');
      }
    },


    hiddenIfNoDescription() {
      if (application.team().description().length === 0) { return 'hidden'; }
    },

    uploadCover() {
      const input = document.createElement("input");
      input.type = 'file';
      input.accept = "image/*";
      input.onchange = function(event) {
        const file = event.target.files[0];
        console.log('☔️☔️☔️ input onchange', file);
        return assetUtils.addCoverFile(file);
      };
      input.click();
      console.log('input created: ', input);
      return false;
    },

    uploadAvatar() {
      const input = document.createElement("input");
      input.type = 'file';
      input.accept = "image/*";
      input.onchange = function(event) {
        const file = event.target.files[0];
        console.log('☔️☔️☔️ input onchange', file);
        return assetUtils.addAvatarFile(file);
      };
      input.click();
      console.log('input created: ', input);
      return false;
    },

    projects() {
      return self.team().projects();
    },
      
    pinnedProjectIds() {
      return self.team().pins().map(pin => pin.projectId);
    },

    recentProjects() {
      const recentProjects = self.projects().filter(project => !_.includes(self.pinnedProjectIds(), project.id()));
      return ProjectsListPresenter(application, "Recent Projects", recentProjects);
    },
    
    pinnedProjectsList() {
      const pinnedProjects = self.projects().filter(project => _.includes(self.pinnedProjectIds(), project.id()));
      return ProjectsListPresenter(application, "Pinned Projects", pinnedProjects);
    },
    
    hiddenIfNotOnTeamAndNoPins() {
      if (!self.currentUserIsOnTeam() && (self.team().pins().length === 0)) {
        return 'hidden';
      }
    },

    hiddenIfOnTeam() {
      if (self.currentUserIsOnTeam()) { return 'hidden'; }
    },

    toggleAddTeamUserPop() {
      application.addTeamUserPopVisible.toggle();
      if (application.addTeamUserPopVisible()) {
        return $('#team-user-search').focus();
      }
    },
    
    toggleAddTeamProjectPop() {
      application.addTeamProjectPopVisible.toggle();
      if (application.addTeamProjectPopVisible()) {
        return $('#team-project-search').focus();
      }
    }
  };

  application.team.observe(function(newVal) {
    if (newVal) {
      return self.setInitialTeamDescription();
    }
  });
        
  const content = TeamTemplate(self);

  return LayoutPresenter(application, content);
};
