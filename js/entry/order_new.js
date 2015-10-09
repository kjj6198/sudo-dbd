
var restaurantSelect = document.getElementById('menu_restaurant_id');
var firstId = restaurantSelect.value;
getRestaurantData(firstId);

$(restaurantSelect).on('change', function(event) {
	event.preventDefault();
	var restaurantId = this.value;
	
	getRestaurantData(restaurantId);
});


function getRestaurantData(id) {
  var url = "http://" + location.host + "/restaurants";
  $.ajax({
  	url: url + "/" + id,
  	type: 'GET',
  	dataType: 'json',
  })
  .done(function(result) {
	  renderInfo(result.image_url, result.intro, result.name, result.id);

  })
  .fail(function() {
	  console.log("error");
  });

}

function renderInfo(image_url, introduction, name, id) {
  var imageContainer = document.getElementById('restaurant_image');
  var introContainer = document.getElementById('intro');
  var titleContainer = document.getElementById('restaurant_name');
  var linkContainer = document.getElementById('restaurant_link');
  var link = "http://" + location.host + "/restaurants" + '/' + id;

  linkContainer.setAttribute('href', link);
  imageContainer.setAttribute('src', image_url);
  
  $(titleContainer).text(name);
  if( introduction !== null) {
    $(introContainer).text(introduction);
  }
  else {
    $(introContainer).text('無');
  }
}

