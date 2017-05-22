HelpingTemplate = require "../templates/includes/helping"
QuestionPresenter = require './question'

Observable = require 'o_0'
_ = require 'underscore'

DEFAULT_MAX_QUESTIONS = 3

module.exports = (application) ->

  self =

    hasQuestions: Observable false
    questionCount: Observable 1

    maxQuestions: Observable DEFAULT_MAX_QUESTIONS

    template: (number) ->
      self.getQuestions()
      self.maxQuestions number
      HelpingTemplate self

    hiddenIfHasQuestions: ->
      'hidden' if self.hasQuestions()

    hiddenIfNoQuestions: ->
      'hidden' if self.questionCount() is 0

    mapQuestions: (data) ->
      if data
        selected = _.sample data,  self.maxQuestions()
        questions = selected.map (question) ->
          console.log question.details
          JSON.parse question.details
        return questions

    getQuestions: ->
      application.api().get 'projects/questions'
      .then (response) ->
        console.log '💁 got questions', response.data
        self.hasQuestions true
        self.questionCount response.data.length
        questions = self.mapQuestions response.data
        application.projectQuestions questions
      .catch (error) ->
        console.error "GET projects/questions", error

    questions: ->
      projectQuestions = application.projectQuestions()
      questionElements = projectQuestions.map (project) ->
        project.id = project.projectId
        QuestionPresenter(application, project)
