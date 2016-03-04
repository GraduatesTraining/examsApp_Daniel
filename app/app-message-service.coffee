'use strict'

class MessageObject
  constructor: ->
    @submit = false
    @error = false
    @success = false
    @message = ''
    
  reset: ->
    @submit = false
    @error = false
    @success = false
    @message = ''
    undefined
    
  start: ->
    @reset()
    @submit = true
    @error = false
    @success = false
    @message = ''
    undefined
    
  stopOk: ->
    @submit = false
    @success = true
    @error = false
    undefined
    
  stopKo: (@message) ->
    @submit = false
    @success = false
    @error = true
    undefined

class Service
    
  constructor: ->
        
  newEv: ->
    @name = new MessageObject

angular
  .module('cognizantExamTest')
  .service 'messageService', Service
