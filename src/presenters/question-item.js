/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const Observable = require('o_0');

const QuestionItemTemplate = require("../templates/includes/question-item");

const MAX_QUESTION_LENGTH = 140;
const MAX_TAG_LENGTH = 15;

module.exports = function(application, question) {
  
  const self = { 
  
    question,
  
    fullQuestion() {
      return question.question();
    },

    filteredQuestion() {
      question = question.question();
      if (question.length <= MAX_QUESTION_LENGTH) {
        return question;
      } else {
        const truncated = question.substring(0, (MAX_QUESTION_LENGTH - 5));
        return truncated + '...';
      }
    },

    filteredTag(tag) {
      return tag.substring(0, MAX_TAG_LENGTH);
    },

    projectUrl() {
      return question.editUrl();
    },

    domain() {
      return question.domain();
    },
    
    outerColor() {
      return {backgroundColor: question.colorOuter()};
    },
    
    innerColor() {
      return {backgroundColor: question.colorInner()};
    },

    userAvatar() {
      return question.userAvatar();
    },

    userColor() {
      return question.userColor();
    },

    userLogin() {
      return question.userLogin();
    }
  };

    // tags: ->
    //   console.log "🌙", question.tags()
    //   question.tags()

  return QuestionItemTemplate(self);
};