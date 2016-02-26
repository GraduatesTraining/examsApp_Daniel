###global element, By###
'use strict'

class MainPage
  constructor: ->
    @text = element By.tagName('p')
    @heading = element By.tagName('h2')

module.exports = MainPage
