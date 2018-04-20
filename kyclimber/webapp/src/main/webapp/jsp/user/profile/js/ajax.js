/** INFORMATIONS **/

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








/*** AVATAR ****/

var avatarId;
jQuery(document).ready(function($) {
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
});








/*** UPDATE MODAL INFO ***/
function openProfilModal(){
    $("#updateModal").modal();
}




/** When the web page is ready **/
$(document).ready(function() {


});