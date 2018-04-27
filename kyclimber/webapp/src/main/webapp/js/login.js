$(document).ready(function() {

    var oldURL = document.referrer;

    /** Connect button **/
    $("#btnConnect").click(function (e) {
        var encryptPass = md5($("#userPassword").val());
        $("#encryptPass").val(encryptPass);
    });
});