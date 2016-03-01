'use strict'

###*
 # @ngdoc object
 # @name exams.controller:ExamsCtrl

 # @description

###
class ExamsCtrl
  constructor: ->
    @ctrlName = 'ExamsCtrl'

angular
  .module('exams')
  .controller 'ExamsCtrl', ExamsCtrl
