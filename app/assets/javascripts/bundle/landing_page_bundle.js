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
/***/ function(module, exports, __webpack_require__) {

	__webpack_require__(1);



/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	var Rx = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"rx\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));
	var animateTime = 2000;

	var $shrimp = $("#shrimp");
	var $sdbdText = $("#sdbd_text");
	var shrimpWidth = $shrimp.width();
	var shrimpOriginLeft = $shrimp.css("left");
	var shrimpClicks = Rx.Observable.fromEvent($shrimp, "click");

	shrimpClicks.
	throttle(animateTime).
	forEach(function(click) {
	    fancyShrimp();
	})
	// animateFunction
	var fancyShrimp = function() {
	    console.log('do');
	    flashAnimate($sdbdText);
	    cycleMove($shrimp);
	}
	var flashAnimate = function(elem) {
	    elem.css("opacity", 0);
	    elem.animate({
	        opacity: 1
	    }, animateTime);
	}
	var cycleMove = function(elem) {
	    var offsetLeft = elem.offset().left;
	    elem.animate({
	        left: -1 * offsetLeft
	    }, 250, function() {
	        elem.css("left", "120%");
	        elem.animate({
	            left: shrimpOriginLeft
	        }, 250);
	    })
	}

/***/ }
/******/ ]);