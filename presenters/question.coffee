Observable = require 'o_0'
randomColor = require 'randomcolor'

QuestionTemplate = require "../templates/includes/question"

MAX_QUESTION_LENGTH = 140
MAX_TAG_LENGTH = 15

module.exports = (application, project) ->
  
  self = 
  
    colors: Observable []

    project: project
    
    template: ->
      palette = randomColor
        luminosity: 'light'
        count: 2
      self.colors palette
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
    
    colorOuter: ->
      self.colors()[0]
    
    colorInner: ->
      self.colors()[1]

    projectUrl: ->
      application.projectUrl project
