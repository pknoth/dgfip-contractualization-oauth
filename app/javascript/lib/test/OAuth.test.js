import OAuth from '../../lib/OAuth'

const module = new OAuth()
const config = require('../../lib/config')

describe('OAuth', () => {
  it.only('should have an authorize_url property', () => {
    expect(module.authorizeUrl).toBe(config.oauth.authorizeUrl)
  })
})
