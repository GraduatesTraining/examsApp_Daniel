###global element, By###
'use strict'

class LoginPage
  constructor: ->
    @email = element By.model('login.user.email')
    @password = element By.model('login.user.password')
    @form = element By.tagName('form')
    @loginButton = element By.name('loginButton')
    @registerButton = element By.name('registerButton')
    @checkbox = element By.model('login.registerCheck')
    @messageSuccess = element By.model('login.success')
    @messageError = element By.model('login.error')
    
module.exports = LoginPage
