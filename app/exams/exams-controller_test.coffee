###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'ExamsCtrl', ->
  ctrl = undefined

  beforeEach module 'exams'

  beforeEach inject ($controller) ->
    ctrl = $controller 'ExamsCtrl'

  it 'should have ctrlName as ExamsCtrl', ->
    expect(ctrl.ctrlName).to.equal 'ExamsCtrl'

