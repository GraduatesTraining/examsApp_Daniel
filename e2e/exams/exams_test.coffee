###global describe, beforeEach, it, browser ###
'use strict'

chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'
expect = chai.expect
ExamsPagePo = require './exams.po'

chai.use chaiAsPromised

describe 'Exams page', ->
  examsPage = undefined

  beforeEach ->
    examsPage = new ExamsPagePo
    browser.get '/#/exams'

  it 'should say ExamsCtrl', ->
    expect(examsPage.heading.getText()).to.eventually.equal 'exams'
    expect(examsPage.text.getText()).to.eventually.equal 'ExamsCtrl'
