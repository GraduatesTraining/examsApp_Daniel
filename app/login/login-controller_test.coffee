###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'loginController', ->
  ctrl = undefined

  beforeEach module('login', 'cognizantExamTest', 'firebase')

  beforeEach inject (authService, profileService, $controller) ->
    ctrl = $controller 'loginController'

  it 'should have object type for user', ->
    assert.isObject(ctrl.user)

  it 'should have string type for email', ->
    assert.isString(ctrl.user.email)

  it 'should have string type for password', ->
    assert.isString(ctrl.user.password)

  it 'should have boolean type for registerCheck', ->
    assert.isBoolean(ctrl.registerCheck)

  it 'should have empty email', ->
    assert.equal(ctrl.user.email, '')
    
  it 'should have empty password', ->
    assert.equal(ctrl.user.password, '')
    
  it 'should have false registerCheck', ->
    assert.isFalse(ctrl.registerCheck)