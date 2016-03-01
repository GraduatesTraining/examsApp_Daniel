###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'mainController', ->
  ctrl = undefined

  beforeEach module('main', 'firebase')

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'mainController'

  it 'should have properties initialized', ->
    assert.isNull(ctrl.originatorEv)
    assert.isString(ctrl.email)