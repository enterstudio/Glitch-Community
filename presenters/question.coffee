Observable = require 'o_0'

QuestionTemplate = require "../templates/includes/question"

MAX_QUESTION_LENGTH = 140
MAX_TAG_LENGTH = 15

module.exports = (application, project) ->
  
  self = 
  
    project: project
    
    template: ->
      QuestionTemplate self

    filteredQuestion: ->
      question = project.question
      if question.length <= MAX_QUESTION_LENGTH
        question
      else
        truncated = question.substring 0, (MAX_QUESTION_LENGTH - 5)
        truncated + '...'
    
    filteredTag: (tag) ->
      tag.substring 0, MAX_TAG_LENGTH

    projectUrl: ->
      application.projectUrl project
