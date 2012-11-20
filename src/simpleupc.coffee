simpleupc = exports

simpleupc.Client = require './Client'

simpleupc.createClient = (apiKey, version)->
  new Client(apiKey, version)