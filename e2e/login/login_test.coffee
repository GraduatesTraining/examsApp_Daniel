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
        
  it 'should refuse empty login submissions', ->
    loginPage.email.clear()
    loginPage.password.clear()
    loginPage.loginButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-invalid')
    )
        
  it 'should refuse empty register submissions', ->
    expect(loginPage.checkbox.isSelected())
      .to.eventually.not.be.ok
    loginPage.email.clear()
    loginPage.password.clear()
    loginPage.checkbox.click().then(->
      loginPage.registerButton.click().then(->
        expect(loginPage.form.getAttribute('class'))
          .to.eventually.contain('ng-invalid')
      )
    )

  it 'should refuse partial login submissions', ->
    loginPage.email.sendKeys('danrevi@gmail.com')
    loginPage.password.clear()
    loginPage.loginButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-invalid')
    )
    loginPage.email.clear()
    loginPage.password.sendKeys('123456')
    loginPage.loginButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-invalid')
    )

  it 'should refuse partial register submissions', ->
    expect(loginPage.checkbox.isSelected())
      .to.eventually.not.be.ok
    loginPage.checkbox.click()
    loginPage.email.sendKeys('danrevi@gmail.com')
    loginPage.password.clear()
    loginPage.registerButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-invalid')
    )
    loginPage.email.clear()
    loginPage.password.sendKeys('123456')
    loginPage.registerButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-invalid')
    )

  it 'should refuse invalid emails', ->
    loginPage.password.clear()
    loginPage.email.sendKeys('login')
    expect(loginPage.email.getAttribute('class'))
      .to.eventually.contain('ng-invalid')

  it 'should refuse invalid passwords', ->
    loginPage.email.clear()
    loginPage.password.sendKeys('pass')
    expect(loginPage.password.getAttribute('class'))
      .to.eventually.contain('ng-invalid')

  it 'should accept complete login submissions', ->
    loginPage.email.sendKeys('daniel.revillatirados@cognizant.com')
    loginPage.password.sendKeys('password')
    loginPage.loginButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-valid')
      expect(loginPage.messageSuccess.getText())
        .to.eventually.be.empty
    )

  it 'should refuse login submissions with nonexistent email', ->
    loginPage.email.sendKeys('john@doe.com')
    loginPage.password.sendKeys('password')
    loginPage.loginButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-valid')
      expect(loginPage.messageError.getText())
        .to.eventually.equal('The specified user account does not exist.')
    )

  it 'should refuse login submissions with incorrect password', ->
    loginPage.email.sendKeys('daniel.revillatirados@cognizant.com')
    loginPage.password.sendKeys('12345')
    loginPage.loginButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-valid')
      expect(loginPage.messageError.getText())
        .to.eventually
          .equal('The specified user account password is incorrect.')
    )

  it 'should accept complete register submissions', ->
    expect(loginPage.checkbox.isSelected())
      .to.eventually.not.be.ok
    loginPage.checkbox.click()
    loginPage.email.sendKeys('test@test.com')
    loginPage.password.sendKeys('password')
    loginPage.registerButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-valid')
      expect(loginPage.messageSuccess.getText())
        .to.eventually.equal('Registered successfully')
    )

  it 'should refuse complete register submissions with email already taken', ->
    expect(loginPage.checkbox.isSelected())
      .to.eventually.not.be.ok
    loginPage.checkbox.click()
    loginPage.email.sendKeys('test@test.com')
    loginPage.password.sendKeys('password')
    loginPage.registerButton.click().then(->
      expect(loginPage.form.getAttribute('class'))
        .to.eventually.contain('ng-valid')
      expect(loginPage.messageError.getText())
        .to.eventually
          .equal('The specified user account email is already taken.')
    )