###global describe, beforeEach, it, expect, inject, module###
'use strict'

describe 'SettingsCtrl', ->
  ctrl = undefined

  beforeEach module 'settings'

  beforeEach inject ($controller) ->
    ctrl = $controller 'SettingsCtrl'
