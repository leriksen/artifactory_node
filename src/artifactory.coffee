Env = require './env'
rp = require 'request-promise'

repoVariants = [
  "build"
  "verify"
  "release"
]

groupVariants = [
  "build-users"
  "build-svc"
  "read"
  "release-users"
  "release-svc"
]

class Artifactory
  @checkRepos = (base) ->
    checkRepo "#{base}-#{variant}" for variant in repoVariants

  @checkRepo = (name) ->
    options =
      method: 'GET'
      uri: "http://google.com/#{name}"
      resolveWithFullResponse: true


    rp options
    .then (response) =>
      console.log "GET succeeded with status #{response.statusCode}"
      true
    .catch (err) =>
      console.log err
      false
      
  @envSettings = (env) ->
    @settings = Env.settings(env)

module.exports = Artifactory

#api_token = "24f7a182a033b81c6553f7124ba746e74dda01c3"

