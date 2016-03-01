'use strict'

angular
  .module 'cognizantExamTest'
  .run ($rootScope, $state, authService) ->
    $rootScope.$on('$stateChangeStart',
      (event, toState, toParams, fromState, fromParams) ->
        if (toState.authenticate and !authService.isLoggedIn())
          event.preventDefault()
          $state.go('login', toParams, {notify: false})
        return
    )