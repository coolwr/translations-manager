authorisation = require '../helpers/authorisationService'

module.exports = (Account) ->
  # make proper ACLs in the next version!
  require('../helpers/clearBaseACLs')(Account, require('./account.json'))
