'use strict'

angular
  .module 'login'
  .config ($stateProvider) ->
    $stateProvider
      .state 'login',
        url: '/login'
        templateUrl: 'login/login.tpl.html'
        controller: 'loginController'
        controllerAs: 'login'
        authenticate: false