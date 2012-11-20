ahr2 = require 'ahr2'

METHODS = require './methods'


module.exports = class Client
  constructor: (@auth, options = {})->
    version = options.version || 1
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
    _errorHandler err, data, method, cb
    return

  return


_errorHandler = (err, data, method, cb)->
  result = data && if method is 'FetchProducts' then data.results else data.result

  if data and not data.success
    cb data.error, result, data
  else
    cb err, result, data

  return
