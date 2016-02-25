'use strict'

angular
  .module 'cognizantExamTest'
  .config ($urlRouterProvider) ->
    $urlRouterProvider.otherwise '/home'
