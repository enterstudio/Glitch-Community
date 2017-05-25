HelpingTemplate = require "../templates/includes/helping"
QuestionPresenter = require './question'

Observable = require 'o_0'
_ = require 'underscore'
randomColor = require 'randomcolor'

animationIteration = 'webkitAnimationiteration oanimationiteration msAnimationiteration animationiteration'
DEFAULT_MAX_QUESTIONS = 3

module.exports = (application) ->

  self =

    maxQuestions: Observable DEFAULT_MAX_QUESTIONS

    gotQuestions: Observable false
    lookingForQuestions: Observable false
    kaomoji: Observable '八(＾□＾*)'

    template: (number) ->
      self.getQuestions()
      self.maxQuestions number
      HelpingTemplate self
      
    hiddenIfGotQuestions: ->
      'hidden' if self.gotQuestions()
      
    hiddenIfQuestions: ->
      'hidden' if application.projectQuestions().length

    hiddenUnlessQuestions: ->
      'hidden' unless application.projectQuestions().length

    mapQuestions: (data) ->
      if data
        selected = data.slice 0, self.maxQuestions()
        questions = selected.map (question) ->
          colors = randomColor
            luminosity: 'light'
            count: 2
          details = JSON.parse question.details
          # if details
          details.colorOuter = colors[0]
          details.colorInner = colors[1]
          return details

        return questions

    getQuestions: ->
      self.lookingForQuestions true
      application.api().get 'projects/questions'
      .then (response) ->
        self.gotQuestions true
        self.lookingForQuestions false
        questions = self.mapQuestions response.data
        application.projectQuestions questions
        if questions.length is 0
          self.randomKaomoji()
      .catch (error) ->
        console.error "GET projects/questions", error

    questions: ->
      projectQuestions = application.projectQuestions()
      questionElements = projectQuestions.map (project) ->
        project.id = project.projectId
        QuestionPresenter(application, project)

    animatedUnlessLookingForQuestions: ->
      'animated' unless self.lookingForQuestions()

    randomKaomoji: ->
      kaomojis = [
        '八(＾□＾*)'
        '(ノ^_^)ノ'
        'ヽ(*ﾟｰﾟ*)ﾉ'
        '♪(┌・。・)┌'
        'ヽ(๏∀๏ )ﾉ'
        'ヽ(^。^)丿'
      ]
      self.kaomoji _.sample kaomojis
        
  setInterval ->
    self.getQuestions()
  , 10000

  return self
