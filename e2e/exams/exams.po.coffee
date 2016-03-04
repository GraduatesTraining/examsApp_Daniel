###global element, By###
'use strict'

class ExamsPage
  constructor: ->
    @text = element By.tagName('p')
    @heading = element By.tagName('h2')

module.exports = ExamsPage
