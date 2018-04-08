yaml = require 'js-yaml'
fs   = require 'fs'

class Environment
  @settings: (env = "dev") ->
    env ||= process.env.artifactory_env

    try
      doc = yaml.safeLoad(fs.readFileSync("conf/#{env}.yaml", 'utf8'))
      doc.env = env
      doc
    catch e
      console.log(e)
      undefined

module.exports = Environment