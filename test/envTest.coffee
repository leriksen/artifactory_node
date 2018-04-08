expect = (require 'chai').expect

env = require '../src/env'

describe 'Environment', ->
  it 'should be return default environment settings', ->
    expect(env.settings().env).to.equal "dev"

  it 'should be return requested environment settings', ->
    expect(env.settings("prod").env).to.equal "prod"