'use strict'

###*
 # @ngdoc object
 # @name main.controller:MainCtrl

 # @description

###
class MainCtrl
  constructor: ->
    @ctrlName = 'MainCtrl'

angular
  .module('main')
  .controller 'MainCtrl', MainCtrl
