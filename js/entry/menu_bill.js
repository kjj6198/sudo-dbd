var Rx = require('rx');
var odersChangeInputs = Rx.Observable.fromEvent($(".orderChangeInput"), "input");
var orderCheckbox = Rx.Observable.fromEvent($(".orderCompanyAffordCheckbox"), "change");

orderCheckbox.debounce(500).
forEach(function(check) {
    var $target = $(check.currentTarget);
    var checkVal = $target.prop("checked");
    var url = $target.parents("tr").data("purl");
    updateChange(url, "company_afford", checkVal);
});

odersChangeInputs.debounce(1000).
map(function(input) {
    var $target = $(input.currentTarget);
    var inputVal = $target.val();
    var pUrl = $target.parents("tr").data("purl");
    return {
        val: inputVal,
        url: pUrl
    }
}).
filter(function(inputObj) {
    return inputObj.val !== ""
}).
forEach(function(inputObj) {
    updateChange(inputObj.url, "change",inputObj.val);
});


function updateChange(url, column, val) {
    $.ajax({
        url: url,
        data: "order["+column+"]=" + val,
        type: "PATCH",
        dataType: 'text',
        success: function(msg) {
            console.log('success update' + url + ' with value ' + val);
            Materialize.toast("已儲存", 1000)
        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.log(xhr.status);
            console.log(thrownError);
        }
    })
}