chai = (require 'chai')
chaiAsPromised = require("chai-as-promised")
chai.use(chaiAsPromised)
expect = chai.expect

arti = require '../src/artifactory'

describe 'Artifactory', ->
  describe 'envSettings', ->
    it 'should get default environment settings', ->
      expect(arti.envSettings().env).to.equal "dev"
  
    it 'should get requested environment settings', ->
      expect(arti.envSettings("prod").key).to.equal "prod value"
      
  describe 'checkRepo', ->
    it 'should work', ->
      expect(arti.checkRepo "base").to.eventually.be.false