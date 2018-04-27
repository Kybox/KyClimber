$(document).ready(function() {

    /** Submit action **/
    $("#formUserPassword").submit(function (e) {

        e.preventDefault();

        var op = md5($("#oldPassword").val());
        var np1 = md5($("#newPassword1").val());
        var np2 = md5($("#newPassword2").val());

        if(checkPassword(np1, np2))
            updateUserPassword(op, np1);
        else
            openErrorModal("Les nouveaux mots de passe ne correspondent pas...");
    });
});

/** Check indentical password **/
function checkPassword(p1, p2){
    if(p1 === p2) return true;
    else return false;
}

/** Ajax update **/
function updateUserPassword(op, np) {
    var formData = "oldPassword=" + op + "&newPassword=" + np;
    $.ajax({
        type: "POST",
        url: "updateAjaxUserPassword.action",
        data: formData,
        dataType: "json",
        success: function (data) {
            openProfilModal();
        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}