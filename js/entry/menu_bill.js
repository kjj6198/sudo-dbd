
var Rx = require('rx');
var odersChangeInputs = Rx.Observable.fromEvent($(".orderChangeInput"), "input");

odersChangeInputs.debounce(1000).
map(function (input) {
    var $target = $(input.currentTarget);
    var inputVal = $target.val();
    var pUrl = $target.data("purl");
    return {
        val: inputVal,
        url: pUrl  
    }
}).
filter(function (inputObj) {
    return inputObj.val !== ""
}).
forEach(function (inputObj) {
    updateChange(inputObj.url, inputObj.val);
});

// $(".orderChangeInput").on("input", function() {
//     // console.log(window.location.host);
//     var $this = $(this);
//     var inputVal =$this.val();
//     var url = $this.data('purl');
// })

function updateChange (url, val) {
    $.ajax({
        url: url,
        data: "change="+val,
        type: "PATCH",
        dataType: 'text',
        success: function(msg) {
            console.log('success update'+url+' with value '+val);
            Materialize.toast("已儲存", 1000)
        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.log(xhr.status);
            console.log(thrownError);
        }
    })
}