###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'mainController', ->
  ctrl = undefined

  beforeEach module('main', 'cognizantExamTest', 'firebase')

  beforeEach inject (authService, $controller) ->
    ctrl = $controller 'mainController'
