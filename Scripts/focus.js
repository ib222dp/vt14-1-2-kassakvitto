"use strict";

//Object literal
var Focus = {
    init: function () {
        var amount = document.getElementById("Amount");
        amount.focus();
        amount.select();
    }
};

window.onload = Focus.init;
