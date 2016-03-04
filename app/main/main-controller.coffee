'use strict'

class Controller
  constructor: (@authService, @state) ->
    @email = @authService.loginData().email
    @image = @authService.loginData().profileImageURL
    @originatorEv = null
    
  openMenu: ($mdOpenMenu, ev) =>
    @originatorEv = ev
    $mdOpenMenu(ev)
    undefined

  logOut: ->
    @authService.logout()
    @state.go 'login'
    undefined

angular
  .module('main')
  .controller 'mainController', ['authService', '$state', Controller]
