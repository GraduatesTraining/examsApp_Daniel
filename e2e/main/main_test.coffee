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
    
  it 'should show settings module when the settings button is clicked', ->
    mainPage.userButton.click()
    mainPage.settingsButton.click()
    expect(browser.getCurrentUrl())
      .to.eventually.equal('http://localhost:3000/#/settings')
    
  it 'should show exams module when the exams button is clicked', ->
    mainPage.examsButton.click()
    expect(browser.getCurrentUrl())
      .to.eventually.equal('http://localhost:3000/#/exams')
    
  it 'should show stats module when the stats button is clicked', ->
    mainPage.statsButton.click()
    expect(browser.getCurrentUrl())
      .to.eventually.equal('http://localhost:3000/#/stats')
    
  it 'should show user email when the user button is clicked', ->
    mainPage.userButton.click()
    expect(mainPage.userEmail.getText())
      .to.eventually.equal('daniel.revillatirados@cognizant.com')
    
  it 'should logout when the logout button is clicked', ->
    mainPage.userButton.click()
    mainPage.logOutButton.click()
    expect(browser.getCurrentUrl())
      .to.eventually.equal('http://localhost:3000/#/login')
