'use strict'

class Controller
  constructor: (@authService, @$state) ->
    @email = @authService.loginData().email
    @image = @authService.loginData().profileImageURL
    @originatorEv = null
    @toolbar = false
    
  openMenu: ($mdOpenMenu, ev) =>
    @originatorEv = ev
    $mdOpenMenu(ev)
    return

  logOut: ->
    @authService.logout()
    @$state.go 'login'
    return

angular
  .module('main')
  .controller 'mainController', ['authService', '$state', Controller]
