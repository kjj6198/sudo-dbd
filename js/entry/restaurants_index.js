var Rx = require('rx');
$(document).ready(function(){
    $('.modal-trigger').leanModal();
});

var $restaurants = $('.rank_area');

$.each($restaurants, function(index, val) {
  var amount = parseInt($(this).data("rank"));

  if(Number.isNaN(amount)) {
  	$(val).text("尚未評分");
  }
  else {
  	displayStar(amount, $(this));
  }
  
});


function displayStar(amount,container) {
  var template = "<span class='dbd_icon-star dbd_selected'></i>";
  
  for( var i = 0; i < amount; i++ ) { //denny hate this
  	container.append(template);
  }

}
