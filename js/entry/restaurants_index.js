var Rx = require('rx');
jQuery(document).ready(function($) {
  $('.modal-trigger').leanModal();	
});

$restaurants = $('.rank_area');

$.each($restaurants, function(index, val) {
  var amount = parseInt($(this).data("rank"));
  displayStar(amount, $(this));
});


function displayStar(amount,container) {
  template = "<span class='dbd_icon-star dbd_selected'></i>";
  
  for( var i = 0; i < amount; i++ ) { //denny hate this
  	container.append(template);
  }

}
