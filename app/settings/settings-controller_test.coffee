###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'SettingsCtrl', ->
  ctrl = undefined

  beforeEach module 'settings'

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'SettingsCtrl'

  it 'should have ctrlName as SettingsCtrl', ->
    expect(ctrl.ctrlName).to.equal 'SettingsCtrl'

