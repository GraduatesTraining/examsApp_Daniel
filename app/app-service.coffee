'use strict'

###*
 # @ngdoc object
 # @name home.service:HomeService

 # @description

###
class Service
  constructor: (@firebaseAuth) ->
    ref = new Firebase('https://flickering-heat-3627.firebaseio.com')
    @auth = @firebaseAuth(ref)
    
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


angular
  .module('cognizantExamTest')
  .service 'authService', ['$firebaseAuth', Service]
