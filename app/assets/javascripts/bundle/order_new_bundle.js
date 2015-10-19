/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/js/";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports) {

	'use strict';

	var restaurantSelect = document.getElementById('menu_restaurant_id');
	var firstId = restaurantSelect.value;
	getRestaurantData(firstId);

	$(restaurantSelect).on('change', function (event) {
	  event.preventDefault();
	  var restaurantId = this.value;

	  getRestaurantData(restaurantId);
	});

	function getRestaurantData(id) {
	  var url = "http://" + location.host + "/restaurants";
	  $.ajax({
	    url: url + "/" + id,
	    type: 'GET',
	    dataType: 'json'
	  }).done(function (result) {
	    renderInfo(result.image_url, result.intro, result.name, result.id);
	  }).fail(function () {
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
	  if (introduction !== null) {
	    $(introContainer).text(introduction);
	  } else {
	    $(introContainer).text('無');
	  }
	}

/***/ }
/******/ ]);