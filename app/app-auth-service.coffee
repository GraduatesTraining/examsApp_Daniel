'use strict'

class Service
  constructor: (@firebaseAuth) ->
    url = 'https://flickering-heat-3627.firebaseio.com'
    @auth = @firebaseAuth(new Firebase(url))

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
    
  logout: ->
    @auth.$unauth()
    
  isLoggedIn: ->
    if @auth.$getAuth() isnt null
      return true
    else
      return false
        
  login: (user) ->
    @auth.$authWithPassword(user)
    
  register: (user) ->
    @auth.$createUser(user)
    
  loginData: ->
    @auth.$getAuth().password
    
  loginUid: ->
    @auth.$getAuth().uid
    
  changeEmail: (data) ->
    @auth.$changeEmail(data)
    
  changePassword: (data) ->
    @auth.$changePassword(data)
    
  deleteAccount: (data) ->
    @auth.$removeUser(data)

angular
  .module('cognizantExamTest')
  .service 'authService', ['$firebaseAuth', Service]
