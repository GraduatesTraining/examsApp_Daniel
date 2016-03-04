'use strict'

class Controller
  constructor: (@authService, @profileService, @messageService) ->
    @profile =
      name: ''
      lastName: ''
      modify: true
    @profileService.getName(@authService.loginUid()).$loaded()
      .then((name)=>
        @profile.name = name.$value
        undefined
      )
    @profileService.getLastName(@authService.loginUid()).$loaded()
      .then((lastName)=>
        @profile.lastName = lastName.$value
        undefined
      )
    @chMailData =
      oldEmail: ''
      newEmail: ''
      password: ''
    @chPassData =
      email: ''
      oldPassword: ''
      newPassword: ''
    @dltAccData =
      email: ''
      password: ''
    @chMailStatus = @messageService.newEv()
    @chPassStatus = @messageService.newEv()
    @dltAccStatus = @messageService.newEv()
 
  updateProfile: ->
    @profileService.updateUser(@profile, @authService.loginUid())
    undefined
    
  changeEmail: ->
    @chMailStatus.start()
    if @chMailData.oldEmail isnt @authService.loginData().email
      @chMailStatus.stopKo('The specified email isn\'t yours.')
    else if @chMailData.oldEmail is @chMailData.newEmail
      @chMailStatus.stopKo('The specified emails are equal.')
    else
      @authService.changeEmail(@chMailData)
        .then(=>
          @chMailStatus.stopOk()
          undefined
        )
        .catch((error)=>
          @chMailStatus.stopKo(@authService.parseError(error.code))
          undefined
        )
    undefined
    
  changePassword: ->
    @chPassStatus.start()
    if @chPassData.email isnt @authService.loginData().email
      @chPassStatus.stopKo('The specified email isn\'t yours.')
    else if @chPassData.oldPassword is @chPassData.newPassword
      @chPassStatus.stopKo('The specified passwords are equal.')
    else
      @authService.changePassword(@chPassData)
        .then(=>
          @chPassStatus.stopOk()
          undefined
        )
        .catch((error)=>
          @chPassStatus.stopKo(@authService.parseError(error.code))
          undefined
        )
    undefined
    
  deleteAccount: ->
    @dltAccStatus.start()
    if @dltAccData.email isnt @authService.loginData().email
      @dltAccStatus.stopKo('The specified email isn\'t yours.')
    else
      @authService.deleteAccount(@dltAccData)
        .then(=>
          @dltAccStatus.stopOk()
          undefined
        )
        .catch((error)=>
          @dltAccStatus.stopKo(@authService.parseError(error.code))
          undefined
        )
    undefined
    

angular
  .module('settings')
  .controller 'settingsController',
    ['authService', 'profileService', 'messageService', Controller]
