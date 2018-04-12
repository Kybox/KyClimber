function updateUserInfos() {
    var email = $("#email").val();
    var firstName = $("#firstName").val();
    var lastName = $("#lastName").val();
    var road = $("#road").val();
    var postalCode = $("#postalCode").val();
    var city = $("#city").val();
    var country = $("#country").val();
    var tel = $("#tel").val();

    $.ajax({
        type: "POST",
        url: "updateAjaxUserInfos.action",
        data: "email=" + email + "&firstName=" + firstName + "&lastName=" + lastName +
                "&road=" + road + "&postalCode=" + postalCode + "&city=" + city +
                "&country=" + country + "&tel=" + tel,
        dataType: "json",
        success: function (data) {
            openProfilModal();
        }
    });
}
function updateUserPassword(){
    var oldPass = md5($("#oldPass").val());
    var newPass1 = md5($("#newPass1").val());
    var newPass2 = md5($("#newPass2").val());

    $.ajax({
        type: "POST",
        url: "updateAjaxUserPassword.action",
        data: "oldPass=" + oldPass + "&newPass1=" + newPass1 + "&newPass2=" + newPass2,
        dataType: "json",
        success: function(data){ openProfilModal(); },
        error: function (data, status, error) { alert("Erreur dans les informations saisies !") }
    });
}

function updateUserAvatar() {
    avatarId++;
    $.ajax({
        type: "POST",
        url: "updateAjaxUserAvatar.action",
        data: "avatarId=" + avatarId,
        dataType: "json",
        success: function () {
            openProfilModal();
        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}

function openProfilModal(){
    $("#updateModal").modal();
}

// Avatar gallery
var avatarId;
jQuery(document).ready(function($) {

    //Handles the carousel thumbnails
    $('[id^=carousel-selector-]').click(function () {
        var id_selector = $(this).attr("id");
        try {
            avatarId = /-(\d+)$/.exec(id_selector)[1];
            console.log(id_selector, avatarId);
            jQuery('#myCarousel').carousel(parseInt(avatarId));
        } catch (e) {
            console.log('Regex failed!', e);
        }
    });
    // When the carousel slides, auto update the text
    /*
    $('#myCarousel').on('slid.bs.carousel', function (e) {
        var id = $('.item.active').data('slide-number');
        $('#carousel-text').html($('#slide-content-'+id).html());
    });
    */
});