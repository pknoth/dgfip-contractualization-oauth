const config = require('../lib/config')

class OAuth {
  constructor () {
    this.authorizeUrl = config.oauth.authorizeUrl;
  }
}

export default OAuth
