'use strict'

###*
 # @ngdoc object
 # @name settings.controller:SettingsCtrl

 # @description

###
class SettingsCtrl
  constructor: ->
    @ctrlName = 'SettingsCtrl'

angular
  .module('settings')
  .controller 'SettingsCtrl', SettingsCtrl
