###
We use a cache to keep an identity map of questions by id.

When constructing a user model Question(...) if it has an id
field it will be cached based on the id. If the id already
exists in the cache the same reference to that model will be
returned.

If the id property is not given the model is not cached.
###

randomColor = require 'randomcolor'


Model = require './model'
cache = {}

module.exports = Question = (I={}, self=Model(I)) ->

  if cache[I.id]
    return cache[I.id]
  
  self.defaults I,
    character: undefined
    colorInner: undefined
    colorOuter: undefined
    created: undefined
    domain: undefined
    line: undefined
    path: undefined
    projectId: undefined
    question: ""
    questionId: undefined
    tags: []
    userAvatar: undefined
    userColor: undefined
    userId: undefined
    userLogin: undefined

  self.attrObservable Object.keys(I)...

  self.extend

    editUrl: ->
      if I.line
        "#{EDITOR_URL}#!/#{I.domain}?path=#{I.path}:#{I.line}:#{I.character}"
      else
        "#{EDITOR_URL}#!/#{I.domain}"


  if I.questionId
    cache[I.questionId] = self
  console.log '☎️ question cache', cache

  return self

Question.getQuestions = (application) ->
  application.gettingQuestions true
  application.api().get 'projects/questions'
  .then ({data}) ->
    application.gettingQuestions false
    data.map (datum) ->
      question = JSON.parse datum.details
      colors = randomColor
        luminosity: 'light'
        count: 2
      question.colorInner = colors[0]
      question.colorOuter = colors[1]
      Question(question).update(question)
  .catch (error) ->
    console.error "GET projects/questions", error


Question._cache = cache

