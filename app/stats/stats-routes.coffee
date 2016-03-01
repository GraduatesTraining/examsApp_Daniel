'use strict'

angular
  .module 'stats'
  .config ($stateProvider) ->
    $stateProvider
      .state 'stats',
        url: '/stats'
        templateUrl: 'stats/stats.tpl.html'
        controller: 'StatsCtrl'
        controllerAs: 'stats'
