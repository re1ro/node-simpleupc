ahr2 = require 'ahr2'

simpleupc = exports

METHODS = require './methods'
ERRORS = require './errors'

simpleupc.Client = class Client
  constructor: (@auth, version = 1)->
    @url = "http://api.simpleupc.com/v#{version}.php"


for method, apiMethod of METHODS
  Client::[method] = do (apiMethod = apiMethod)-> #creating closures
    if method is 'products'
      (params, cb)->
        _request.call(@, apiMethod, params, cb)
        return
    else
      (upc, cb)->
        _request.call(@, apiMethod, {upc}, cb)
        return


_request = (method, params, cb)->
  ahr2(
    href   : @url
    headers:
      'Content-Type': 'application/json'

    encodedBody: JSON.stringify({
    @auth
    method
    params
    })
  ).when (err, ahr, data)->
    cb err, data

  return


simpleupc.createClient = (apiKey, version)->
  new Client(apiKey, version)