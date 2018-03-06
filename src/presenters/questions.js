// TODO: This file was created by bulk-decaffeinate.
// Check that you're happy with the conversion, then remove this comment.
/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const QuestionsTemplate = require("../templates/includes/questions");
const QuestionItemPresenter = require('./question-item');

const Observable = require('o_0');
const _ = require('lodash/collection');

const animationIteration = 'webkitAnimationiteration oanimationiteration msAnimationiteration animationiteration';
const DEFAULT_MAX_QUESTIONS = 3;

module.exports = function(application, maxQuestions) {
  console.log("Presented questions");

  var self = {

    maxQuestions() {
      return maxQuestions || DEFAULT_MAX_QUESTIONS;
    },

    kaomoji: Observable('八(＾□＾*)'),

    randomKaomoji() {
      const kaomojis = [
        '八(＾□＾*)',
        '(ノ^_^)ノ',
        'ヽ(*ﾟｰﾟ*)ﾉ',
        '♪(┌・。・)┌',
        'ヽ(๏∀๏ )ﾉ',
        'ヽ(^。^)丿'
      ];
      return self.kaomoji(_.sample(kaomojis));
    },

    // hiddenIfGotQuestions: ->
    //   'hidden' if application.questions().length
      
    hiddenIfQuestions() {
      if (application.questions().length) { return 'hidden'; }
    },

    hiddenUnlessQuestions() {
      if (!application.questions().length) { return 'hidden'; }
    },

    questions() {
      return application.questions().map(question => QuestionItemPresenter(application, question));
    },

    animatedUnlessLookingForQuestions() {
      if (!application.gettingQuestions()) { return 'animated'; }
    }
  };


  setInterval(function() {
    application.getQuestions();
    return self.randomKaomoji();
  }
    , 10000);

  return QuestionsTemplate(self);
};
