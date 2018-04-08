(function() {
  var Environment, fs, yaml;

  yaml = require('js-yaml');

  fs = require('fs');

  Environment = class Environment {
    static settings(env = "dev") {
      var doc, e;
      env || (env = process.env.artifactory_env);
      try {
        doc = yaml.safeLoad(fs.readFileSync(`conf/${env}.yaml`, 'utf8'));
        doc.env = env;
        return doc;
      } catch (error) {
        e = error;
        console.log(e);
        return void 0;
      }
    }

  };

  module.exports = Environment;

}).call(this);

//# sourceMappingURL=env.js.map
