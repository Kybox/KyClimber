/** Global variable **/
var userAvatarId;

$(document).ready(function() {

    $("#btnUpdateUserAvatar").click(function () {
        updateUserAvatar();
    });

    /** Carousel selection **/
    $('[id^=carousel-selector-]').click(function () {
        var id_selector = $(this).attr("id");
        try {
            userAvatarId = /-(\d+)$/.exec(id_selector)[1];
            jQuery('#myCarousel').carousel(parseInt(userAvatarId));
        } catch (e) {
            console.log('Regex failed!', e);
        }
    });
});

/** Ajax update **/
function updateUserAvatar() {
    userAvatarId++;
    $.ajax({
        type: "POST",
        url: "updateAjaxUserAvatar.action",
        data: "userAvatarId=" + userAvatarId,
        dataType: "json",
        success: function () {
            openProfilModal();
        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}