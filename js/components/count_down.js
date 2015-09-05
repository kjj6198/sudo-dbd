var EXPIRED = "已截止";
var $activeCountDowns = $(".countDown").toArray().
map(function(element) {
    return $(element)
}).
filter(activeOrNot);
var timers = $activeCountDowns.map(function(activeCountDown) {
    console.log(activeCountDown.text().trim());
    var matchedText = activeCountDown.text().replace(/\s/g, '').match(/(\d+).+\:.+(\d+)/);

    return {
        elem: activeCountDown,
        minutes: matchedText[1],
        seconds: matchedText[2]
    };
});

setInterval(function() {
    timers = timers.
    map(function(timer) {
        return countdown(timer);
    }).
    filter(function(timer) {
        displayTimer(timer)
        return (timer.minutes !== 0 || timer.seconds !== 0);
    })
}, 1000);


function activeOrNot(countdown) {
    return countdown.text().trim() !== EXPIRED;
};

function countdown(timer) {
    if (timer.seconds === 0) {
        timer.minutes -= 1
        timer.seconds = 59;
    } else {
        timer.seconds -= 1
    }
    console.log(timer);
    return timer;
}

function displayTimer(timer) {
    if (timer.minutes === 0 && timer.seconds === 0) {
        timer.elem.text(EXPIRED);
    } else {
        timer.elem.text(timer.minutes + " : " + timer.seconds);
    };
}



// function countDown() {
//     var $this = $(this);
//     var time = $this.data(time).time;
//     var endDatetime = new Date(time);
//     var duration = parseInt((endDatetime-currentTime)/1000);
//     function getformatTime(secs) {
//         var minute = Math.floor(secs / 60);
//         var second = secs % 60;
//         if (secs < 0) {
//             return "已截止"
//         } else {
//             return minute.toString() + ":" + second.toString();
//         }
//     }
//     return getformatTime(duration);
// }




// et=$("td[data-time").data("time")
// st=$("td[data-time").siblings("td[data-starttime]").data("starttime")
// etd = new Date(et)
// std= new Date(st)
// ds = (etd-std)/1000