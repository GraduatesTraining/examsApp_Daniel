'use strict'

angular
  .module 'exams'
  .config ($stateProvider) ->
    $stateProvider
      .state 'exams',
        url: '/exams'
        templateUrl: 'exams/exams.tpl.html'
        controller: 'ExamsCtrl'
        controllerAs: 'exams'
