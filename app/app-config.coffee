'use strict'

angular
  .module 'cognizantExamTest'
  .config ($mdThemingProvider) ->
    corporative = $mdThemingProvider.extendPalette('red',
      '100': 'dfdfdf'
      '500': '6db33f'
    )
    $mdThemingProvider.definePalette('corporative', corporative)
    $mdThemingProvider.theme('default')
      .primaryPalette('corporative')