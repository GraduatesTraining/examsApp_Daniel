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
        
  login: (user) ->
    @auth.$authWithPassword(user)
    
  register: (user) ->
    @auth.$createUser(user)


angular
  .module('login')
  .service 'authService', ['$firebaseAuth', Service]
