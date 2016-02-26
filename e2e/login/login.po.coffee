###global element, By###
'use strict'

class LoginPage
  constructor: ->
    @form = findElement By.tagName('form')
    
module.exports = LoginPage
