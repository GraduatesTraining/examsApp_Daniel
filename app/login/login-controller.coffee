'use strict'

class Controller
    
  constructor: (@authService, @messageService, @$state) ->
    @user = {
      email: ''
      password: ''
    }
    @registerCheck = false
    @loginStatus = @messageService.newEv()
    
  submit: ->
    @loginStatus.start()
    if @registerCheck
      @register()
    else
      @login()
    return
        
  register: ->
    @authService.register(@user)
      .then(=>
        @loginStatus.stopOk()
        @login()
        return
      )
      .catch((error) =>
        @loginStatus.stopKo(@authService.parseError(error.code))
        return
      )
    return
    
  login: ->
    @authService.login(@user)
      .then(=>
        @loginStatus.stopOk()
        @$state.go 'main'
        return
      )
      .catch((error) =>
        @loginStatus.stopKo(@authService.parseError(error.code))
        return
      )
    return

angular
  .module('login')
  .controller 'loginController',
    ['authService', 'messageService', '$state', Controller]
