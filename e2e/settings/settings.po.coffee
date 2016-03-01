###global element, By###
'use strict'

class SettingsPage
  constructor: ->
    @text = element By.tagName('p')
    @heading = element By.tagName('h2')

module.exports = SettingsPage
