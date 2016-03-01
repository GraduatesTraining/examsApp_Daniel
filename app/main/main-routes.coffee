'use strict'

angular
  .module 'main'
  .config ($stateProvider) ->
    $stateProvider
      .state 'main',
        url: '/main'
        templateUrl: 'main/main.tpl.html'
        controller: 'mainController'
        controllerAs: 'main'
        authenticate: true
