'use strict'

class Service
  constructor: (@firebaseObject) ->
    @url = 'https://flickering-heat-3627.firebaseio.com/profiles'
    
  createUser: (uid) ->
    @newUser = @firebaseObject(new Firebase(@url + '/' + uid))
    @newUser.name = ''
    @newUser.lastName = ''
    @newUser.$save()
    undefined

  updateUser: (userData, uid) ->
    @newUser = @firebaseObject(new Firebase(@url + '/' + uid))
    @newUser.name = userData.name
    @newUser.lastName = userData.lastName
    @newUser.$save()
    undefined
    
  getName: (uid) ->
    @firebaseObject(new Firebase(@url + '/' + uid + '/name'))
    
  getLastName: (uid) ->
    @firebaseObject(new Firebase(@url + '/' + uid + '/lastName'))

angular
  .module('cognizantExamTest')
  .service 'profileService', ['$firebaseObject', Service]
