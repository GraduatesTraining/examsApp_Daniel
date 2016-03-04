###global element, By###
'use strict'

class MainPage
  constructor: ->
    @userButton = element By.name('userButton')
    @examsButton = element By.name('examsButton')
    @statsButton = element By.name('statsButton')
    @userEmail = element By.name('userEmail')
    @logOutButton = element By.name('logOutButton')
    @settingsButton = element By.name('settingsButton')

module.exports = MainPage
