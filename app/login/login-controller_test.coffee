###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'loginController', ->
  ctrl = undefined

  beforeEach module 'login'

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'loginController'

  it 'should have ctrlName as loginController', ->
    expect(ctrl.ctrlName).to.equal 'logiController'
