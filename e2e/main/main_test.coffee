###global describe, beforeEach, it, browser ###
'use strict'

chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'
expect = chai.expect
MainPagePo = require './main.po'

chai.use chaiAsPromised

describe 'Main page', ->
  mainPage = undefined
  @timeout(0)

  beforeEach ->
    mainPage = new MainPagePo
    browser.get '/#/main'

  it 'should say MainCtrl', ->
    expect(mainPage.heading.getText()).to.eventually.equal 'main'
    expect(mainPage.text.getText()).to.eventually.equal 'MainCtrl'
