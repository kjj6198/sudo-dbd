var Rx = require('rx');
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