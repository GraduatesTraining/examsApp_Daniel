###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'MainCtrl', ->
  ctrl = undefined

  beforeEach module 'main'

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'MainCtrl'

  it 'should have ctrlName as MainCtrl', ->
    expect(ctrl.ctrlName).to.equal 'MainCtrl'

