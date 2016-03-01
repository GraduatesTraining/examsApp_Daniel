'use strict'

class Controller
    
  constructor: (@authService, @$state) ->
    @user = {
      email: ''
      password: ''
    }
    @registerCheck = false
    @submitted = false
    @error = ''
    @success = ''
    @messageError = false
    @messageSuccess = false
    
  submit: ->
    @submitted = true
    @error = ''
    @success = ''
    @messageError = false
    @messageSuccess = false
    if @registerCheck
      @register()
    else
      @login()
        
  parseError: (error) ->
    switch error
      when 'INVALID_EMAIL'
        return 'The specified user account email is invalid.'
      when 'INVALID_PASSWORD'
        return 'The specified user account password is incorrect.'
      when 'INVALID_USER'
        return 'The specified user account does not exist.'
      when 'EMAIL_TAKEN'
        return 'The specified user account email is already taken.'
      else
        return 'Error logging user in.'
        
  register: ->
    @authService.register(@user)
      .then(=>
        @submitted = false
        @success = 'Registered successfully'
        @messageSuccess = true
        @login()
        return
      )
      .catch((error) =>
        @submitted = false
        @error = @parseError(error.code)
        @messageError = true
        return
      )
    return
    
  login: ->
    @authService.login(@user)
      .then(=>
        @submitted = false
        @$state.go 'main'
        return
      )
      .catch((error) =>
        @submitted = false
        @error = @parseError(error.code)
        @messageError = true
        return
      )
    return

angular
  .module('login')
  .controller 'loginController', ['authService', '$state', Controller]
