###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'StatsCtrl', ->
  ctrl = undefined

  beforeEach module 'stats'

  beforeEach inject ($rootScope, $controller) ->
    ctrl = $controller 'StatsCtrl'

  it 'should have ctrlName as StatsCtrl', ->
    expect(ctrl.ctrlName).to.equal 'StatsCtrl'

