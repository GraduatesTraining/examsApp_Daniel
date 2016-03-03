'use strict'

class Service
  constructor: (@firebaseObject) ->
    @url = 'https://flickering-heat-3627.firebaseio.com/profiles'
    
  createUser: (uid) ->
    @newUser = @firebaseObject(new Firebase(@url + '/' + uid))
    @newUser.name = ''
    @newUser.lastName = ''
    @newUser.$save()

  updateUser: (userData, uid) ->
    @newUser = @firebaseObject(new Firebase(@url + '/' + uid))
    @newUser.name = userData.name
    @newUser.lastName = userData.lastName
    @newUser.$save()
    
  getName: (uid) ->
    @firebaseObject(new Firebase(@url + '/' + uid + '/name'))
    
  getlastName: (uid) ->
    @firebaseObject(new Firebase(@url + '/' + uid + '/lastName'))

angular
  .module('cognizantExamTest')
  .service 'profileService', ['$firebaseObject', Service]
