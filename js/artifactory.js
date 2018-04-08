(function() {
  var Artifactory, Env, groupVariants, repoVariants, rp;

  Env = require('./env');

  rp = require('request-promise');

  repoVariants = ["build", "verify", "release"];

  groupVariants = ["build-users", "build-svc", "read", "release-users", "release-svc"];

  Artifactory = class Artifactory {
    static checkRepos(base) {
      var i, len, results, variant;
      results = [];
      for (i = 0, len = repoVariants.length; i < len; i++) {
        variant = repoVariants[i];
        results.push(checkRepo(`${base}-${variant}`));
      }
      return results;
    }

    static checkRepo(name) {
      var options;
      options = {
        method: 'GET',
        uri: `http://google.com/${name}`,
        resolveWithFullResponse: true
      };
      return rp(options).then((response) => {
        console.log(`GET succeeded with status ${response.statusCode}`);
        return true;
      }).catch((err) => {
        console.log(err);
        return false;
      });
    }

    static envSettings(env) {
      return this.settings = Env.settings(env);
    }

  };

  module.exports = Artifactory;

  //api_token = "24f7a182a033b81c6553f7124ba746e74dda01c3"

}).call(this);

//# sourceMappingURL=artifactory.js.map
