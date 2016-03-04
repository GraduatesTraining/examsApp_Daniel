'use strict'

###*
 # @ngdoc object
 # @name stats.controller:StatsCtrl

 # @description

###
class StatsCtrl
  constructor: ->
    @ctrlName = 'StatsCtrl'

angular
  .module('stats')
  .controller 'StatsCtrl', StatsCtrl
