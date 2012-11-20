SimpleUPC
==============
SimpleUPC is a lightweight node.js library for accesing [simpleupc.com](http://simpleupc.com/) API services.


# Install

```sh
$ npm install simpleupc
```


# Usage

##Initialization. 
You will get `YOUR_AUTH_KEY` after [creating an account](http://simpleupc.com/price.php)
```js
var simpleupc = require('simpleupc'),

    simpleupcClient = simpleupc.createClient('YOUR_AUTH_KEY');

// or using Client constructor
simpleupcClient = new simpleupc.Client('YOUR_AUTH_KEY');

simpleupcClient.productByUPC('036000280753', function(err, product) {
  console.log(product);
});
```

## simpleupcClient Methods

### `productByUPC(upcCode, callback)`
* `upcCode` : String
* `callback(err, product, originalResponse)` : Function

`originalResponse` notes:
  * `usedExternal` indicates whether an external source (such as Google Shopping API) was used to satisfy the request.
  * `ProductHasImage` indicates whether the product has an associated image. If true, the product's image can be returned using FetchImageByUPC method
  * `ProductHasNutritionFacts` indicates whether the product's information contains nutrition facts. If true, the product's nutrition facts can be returned using FetchNutritionFactsByUPC method
  * `Duration` - time spent on request


### `products(options, callback)`
* `options` : Object
  * `field` (Required)
Defines the field to search.
Allowed values: `category`, `brand`, `description`, `fullname` (e.g. brand and description combined).
  * `search` (Required)
Defines the keyword you would like to search (e.g. "Milk").
  * `requirenutrition` (Optional)
Defines whether to require results to have nutrition facts.
If requirenutrition is set to `false` (default) all items will be returned even if they don't have nutrition information.
If requirenutrition is set to `true` only items with nutrition information will be returned.
  * `matchtype` (Optional)
Defines whether to make a partial or exact match.
By default, search requests will search in `present` mode which performs partial matches (e.g. 'Turkey' matches with 'Poultry - Chicken & Turkey'
Use `exact` mode to search exact words (e.g. 'Turkey' would only return items that only contain 'Turkey')
  * `limit` (Optional)
Sets the maximum number of items to return.
By default, search requests will return up to 30 results (the maximum) at a time.
  * `offset` (Optional)
Determines where in the result set results are returned.
When the result set exceeds that which can be returned at once, additional parameters will be present indicating what the “next” and “previous” offsets should be.
This effect is used in conjunction with the limit parameter, and is similar to pagination.


* `callback(err, products, originalResponse)` : Function

`originalResponse` notes:
  * `count` - amount of returned results
  * `nextOffset` - offset that should be used for the next page with the same limit pagination
  * `prevOffset` - offset that should be used for the previous page with the same limit pagination
  * `Duration` - time spent on request



### `imageByUPC(upcCode, callback)`
* `upcCode` : String
* `callback(err, imagesObject, originalResponse)` : Function

`originalResponse` notes:
  * `usedExternal` indicates whether an external source (such as Google Shopping API) was used to satisfy the request.
  * `Duration` - time spent on request
 



### `nutritionsByUPC(upcCode, callback)`
* `upcCode` : String
* `callback(err, nutritionsObject, originalResponse)` : Function

`originalResponse` notes:
  * `usedExternal` indicates whether an external source (such as Google Shopping API) was used to satisfy the request.
  * `Duration` - time spent on request

## See also
For more information and respond examples please read [original documentation](http://simpleupc.com/api/)
