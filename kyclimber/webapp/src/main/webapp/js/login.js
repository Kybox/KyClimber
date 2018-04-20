$(document).ready(function() {

    /** Connect button **/
    $("#btnConnect").click(function (e) {
        var encryptPass = md5($("#userPassword").val());
        $("#encryptPass").val(encryptPass);
    });
});