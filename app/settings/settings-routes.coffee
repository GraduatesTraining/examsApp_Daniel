'use strict'

angular
  .module 'settings'
  .config ($stateProvider) ->
    $stateProvider
      .state 'settings',
        url: '/settings'
        templateUrl: 'settings/settings.tpl.html'
        controller: 'settingsController'
        controllerAs: 'settings'
