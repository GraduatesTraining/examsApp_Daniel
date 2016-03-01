###global describe, beforeEach, it, browser ###
'use strict'

chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'
expect = chai.expect
SettingsPagePo = require './settings.po'

chai.use chaiAsPromised

describe 'Settings page', ->
  settingsPage = undefined

  beforeEach ->
    settingsPage = new SettingsPagePo
    browser.get '/#/settings'

  it 'should say SettingsCtrl', ->
    expect(settingsPage.heading.getText()).to.eventually.equal 'settings'
    expect(settingsPage.text.getText()).to.eventually.equal 'SettingsCtrl'
