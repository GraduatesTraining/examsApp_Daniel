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
    
  start: ->
    @reset()
    @submit = true
    @error = false
    @success = false
    @message = ''
    return
    
  stopOk: ->
    @submit = false
    @success = true
    @error = false
    return
    
  stopKo: (@message) ->
    @submit = false
    @success = false
    @error = true
    return

class Service
    
  constructor: ->
        
  newEv: ->
    @name = new MessageObject
    return @name

angular
  .module('cognizantExamTest')
  .service 'messageService', Service
