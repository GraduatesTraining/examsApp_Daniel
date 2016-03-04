'use strict'

class Controller
    
  constructor: (@authService, @profileService, @messageService, @state) ->
    @user =
      email: ''
      password: ''
    @registerCheck = false
    @loginStatus = @messageService.newEv()
    
  submit: ->
    @loginStatus.start()
    if @registerCheck
      @register()
    else
      @login()
    undefined
        
  register: ->
    @authService.register(@user)
      .then((authData)=>
        @loginStatus.stopOk()
        @profileService.createUser(authData.uid)
        @login()
        undefined
      )
      .catch((error) =>
        @loginStatus.stopKo(@authService.parseError(error.code))
        undefined
      )
    undefined
    
  login: ->
    @authService.login(@user)
      .then(=>
        @loginStatus.stopOk()
        @state.go 'main'
        undefined
      )
      .catch((error) =>
        @loginStatus.stopKo(@authService.parseError(error.code))
        undefined
      )
    undefined

angular
  .module('login')
  .controller 'loginController',
    ['authService', 'profileService', 'messageService', '$state', Controller]
