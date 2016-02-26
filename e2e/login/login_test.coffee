###global describe, beforeEach, it, browser ###
'use strict'

chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'
expect = chai.expect
assert= chai.assert
LoginPagePo = require './login.po'

chai.use chaiAsPromised

describe 'Login page', ->
  loginPage = undefined
  @timeout(0)

  beforeEach ->
    loginPage = new LoginPagePo
    browser.get '/#/login'

  it 'should show a login form', ->
    expect(loginPage.form.getAttribute('name'))
      .to.eventually.equal 'loginForm'
        
  it 'should refuse empty submissions', ->

  it 'should refuse partial submissions', ->

  it 'should refuse invalid emails', ->

  it 'should refuse invalid passwords', ->

  it 'should accept complete submissions', ->
