'use strict'

class Controller
  constructor: (@authService, @$state) ->
    @email = @authService.loginData().email
    @originatorEv = null
    
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
