var Rx = require('rx');
var odersChangeInputs = Rx.Observable.fromEvent($(".orderChangeInput"), "input");
var orderCheckbox = Rx.Observable.fromEvent($(".orderCompanyAffordCheckbox"), "change");
var orderFoodInputs = Rx.Observable.fromEvent($(".orderFoodNameInput"), "input");
var orderPriceInputs = Rx.Observable.fromEvent($(".orderPriceInput"), "input");
var orderNoteInputs = Rx.Observable.fromEvent($(".orderNoteInput"), "input");

orderNoteInputs.debounce(1000).
map(getInputStream).
filter(emptyValOrNot).
distinct().
forEach(function(inputObj) {
    updateChange(inputObj.url, "note", inputObj.val);
});

orderPriceInputs.debounce(1000).
map(getInputStream).
filter(emptyValOrNot).
distinct().
forEach(function(inputObj) {
    updateChange(inputObj.url, "price", inputObj.val);
});

orderFoodInputs.debounce(1000).
map(getInputStream).
filter(emptyValOrNot).
distinct().
forEach(function(inputObj) {
    updateChange(inputObj.url, "food_name", inputObj.val);
});

odersChangeInputs.debounce(1000).
map(getInputStream).
filter(emptyValOrNot).
distinct().
forEach(function(inputObj) {
    updateChange(inputObj.url, "change", inputObj.val);
});

orderCheckbox.debounce(500).
forEach(function(check) {
    var $target = $(check.currentTarget);
    var checkVal = $target.prop("checked");
    var url = $target.parents("tr").data("purl");
    updateChange(url, "company_afford", checkVal);
});



function getInputStream(input) {
    var $target = $(input.currentTarget);
    var inputVal = $target.val().trim();
    var pUrl = $target.parents("tr").data("purl");
    return {
        val: inputVal,
        url: pUrl
    };
}

function emptyValOrNot(inputObj) {
    return inputObj.val !== "";
}

function updateChange(url, column, val) {
    $.ajax({
        url: url,
        data: "order[" + column + "]=" + val,
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