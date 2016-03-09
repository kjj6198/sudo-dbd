var _ = require('lodash');

/**
 * get The Total Price With Table
 * param className{[array]} [the column you want to add]
 * @return {[integer]} [total number]
 */
function getTotalPrice(className) {
  var $price = $('.price').toArray();

  var prices = $price.map( (price) => parseInt($(price).text()))
			   .filter( (price) => !Number.isNaN(price));

  var total = _.reduce(prices, (total, price) => total + price);

  return total;
}

function displayTotal(container, price) {
  container.text(price);
}

displayTotal($("#total"), getTotalPrice("price"));
