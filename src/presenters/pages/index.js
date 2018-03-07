const IndexTemplate = require("../../templates/pages/index");
const LayoutPresenter = require("../layout");
const WhatIsGlitchPresenter = require("../what-is-glitch");
const CtaButtonsPresenter = require("../cta-buttons");
const HeaderPresenter = require("../header");
const FeaturedCollectionPresenter = require("../featured-collection");

module.exports = function(application) {
  console.log("Presented index");
  
  const self = {
    application,
    projects: application.projects,
    
    user: application.user,

    whatIsGlitch() {
      return WhatIsGlitchPresenter(application);
    },

    ctaButtons() {
      return CtaButtonsPresenter(application);
    },

    header() {
      return HeaderPresenter(application);
    },

    currentUser: application.currentUser,
      
    featuredCollections() {
      return application.featuredCollections.map(collection => FeaturedCollectionPresenter(application, collection));
    },

    randomCategories() {
      return application.categories().filter(category => category.hasProjects());
    },

    categories() {
      return application.categories();
    }
  };

  const content = IndexTemplate(self);

  return LayoutPresenter(application, content);
};
