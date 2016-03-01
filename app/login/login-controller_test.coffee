###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'loginController', ->
  ctrl = undefined

  beforeEach module('login', 'firebase')

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'loginController'

  it 'should have properties initialized', ->
    assert.isObject(ctrl.user)
    assert.isString(ctrl.user.email)
    assert.isString(ctrl.user.password)
    assert.isString(ctrl.error)
    assert.isString(ctrl.success)
    assert.isBoolean(ctrl.registerCheck)
    assert.isBoolean(ctrl.submitted)
    assert.isBoolean(ctrl.messageError)
    assert.isBoolean(ctrl.messageSuccess)
    assert.equal(ctrl.user.email, '')
    assert.equal(ctrl.user.password, '')
    assert.equal(ctrl.error, '')
    assert.equal(ctrl.success, '')
    assert.isFalse(ctrl.registerCheck)
    assert.isFalse(ctrl.submitted)
    assert.isFalse(ctrl.messageError)
    assert.isFalse(ctrl.messageSuccess)
