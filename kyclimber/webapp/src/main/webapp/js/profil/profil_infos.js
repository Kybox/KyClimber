$(document).ready(function() {

    /** Submit action **/
    $("#formUserInfos").submit(function (e) {
        e.preventDefault();
        updateUserInfos();
    });
});

/** Ajax update **/
function updateUserInfos() {
    var formData = $("#formUserInfos").serialize();
    $.ajax({
        type: "POST",
        url: "updateAjaxUserInfos.action",
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