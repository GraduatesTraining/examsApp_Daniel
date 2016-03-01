###global describe, beforeEach, it, browser ###
'use strict'

chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'
expect = chai.expect
StatsPagePo = require './stats.po'

chai.use chaiAsPromised

describe 'Stats page', ->
  statsPage = undefined

  beforeEach ->
    statsPage = new StatsPagePo
    browser.get '/#/stats'

  it 'should say StatsCtrl', ->
    expect(statsPage.heading.getText()).to.eventually.equal 'stats'
    expect(statsPage.text.getText()).to.eventually.equal 'StatsCtrl'
