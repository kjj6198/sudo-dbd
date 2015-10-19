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

	"use strict";

	$("#comment_rank").hide();
	// Default Rank
	var DEFAULT_RANK = 0;
	var rankInput = document.getElementById('comment_rank');
	rankInput.value = DEFAULT_RANK;

	var $rankPoint = $(".rank");

	function getColor(number) {
	  var color = ["#aaa", "#FFAA0E", "#FFF000", "#54FF3C", "#FF001C"];
	  return color[number - 1];
	}

	function getCount() {
	  return $('.rank_area .dbd_selected').length;
	}

	$rankPoint.map(function (index, elem) {
	  return {
	    container: elem,
	    rank: parseInt($(elem).text())
	  };
	}).each(function (index, el) {
	  var color = getColor(el.rank);
	  $(el.container).css({
	    'background-color': color
	  });
	});

	$(".rank_area .dbd_icon-star").each(function (index, el) {
	  $(el).on('click', function () {
	    var count;
	    $(this).addClass('dbd_selected');
	    $(this).prevAll().addClass('dbd_selected');
	    $(this).nextAll().removeClass('dbd_selected');

	    count = parseInt(getCount.call($(this)));

	    $('#comment_rank').val(count);
	  });
	});

/***/ }
/******/ ]);