$("#comment_rank").hide();
// Default Rank
var DEFAULT_RANK = 0;
var rankInput = document.getElementById('comment_rank');
rankInput.value = DEFAULT_RANK;


var $rankPoint = $(".rank");

function getColor(number) {
  var color = ["#aaa", "#FFAA0E","#FFF000","#54FF3C", "#FF001C"];
  return color[number - 1];
}

function getCount() {
 return $('.rank_area .dbd_selected').length;
}

$rankPoint.map(function(index, elem) {
	return {
	  container: elem,
	  rank: parseInt($(elem).text())
}})
  .each(function(index, el) {
	  var color = getColor(el.rank);
	  $(el.container).css({
	    'background-color': color,
	  });
  });

$(".rank_area .dbd_icon-star").each(function(index, el) {
  $(el).on('click',function(){
    var count = parseInt(getCount.call($(this))) || 0;

  	$(this).addClass('dbd_selected');
  	$(this).prevAll().addClass('dbd_selected');
  	$(this).nextAll().removeClass('dbd_selected');

    $('#comment_rank').val(count);
  })
});