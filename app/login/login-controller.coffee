'use strict'

class Controller
    
  constructor: (@authService, @profileService, @messageService, @state) ->
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
      .then((authData)=>
        @loginStatus.stopOk()
        @profileService.createUser(authData.uid)
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
        @state.go 'main'
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
    ['authService', 'profileService', 'messageService', '$state', Controller]
