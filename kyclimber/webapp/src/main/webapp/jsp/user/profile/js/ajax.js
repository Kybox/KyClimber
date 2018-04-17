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




/** PASSWORD **/

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




/*** TOPOS ****/

var promptRegionDropdown = "Liste des r&eacute;gions";
var promptUserDropdown = "Liste des utilisateurs";

function editTopo(id) {
    $("#txtName").val($("#name" + id).text());
    $("#txtDescription").val($("#description" + id).text());
    $("#txtEdition").val($("#puslisher" + id).text());
    $("#txtCover").val($("#cover" + id).attr("data-full"));
    $("#regionSelected").text($("#region" + id).text());

    if($("#available" + id + " span").attr("available") == "true")
        $("input:radio[name=editRadioAvailable][value=availalbleYes]").prop("checked", true);
    else $("input:radio[name=editRadioAvailable][value=availalbleNo]").prop("checked", true);

    if($("#lent" + id + " span").attr("lent") == "true"){
        $("input:radio[name=editRadioLent][value=lentYes]").prop("checked", true);
        $("#btnDropdownUserLent").prop("disabled", false);
        $("#lentUserSelected").text($("#userLent").text());
    }
    else {
        $("input:radio[name=editRadioLent][value=lentNo]").prop("checked", true);
        $("#btnDropdownUserLent").prop("disabled", true);
    }

    showTopoForm(false);
}
function clearTopoForm() {
    $("#txtName").val("");
    $("#txtDescription").val("");
    $("#txtEdition").val("");
    $("#txtCover").val("");
    $("#regionSelected").html(promptRegionDropdown);
    $("input:radio[name=editRadioAvailable][value=availalbleNo]").prop("checked", true);
    $("input:radio[name=editRadioLent][value=lentNo]").prop("checked", true);
    $("#btnDropdownUserLent").text(promptUserDropdown);
    $("#btnDropdownUserLent").prop("disabled", true);
}
function showTopoForm(clear) {
    if(clear) clearTopoForm();
    $("#topoForm").show(1000);
    $("#btnAddTopo").prop("disabled", true);
}
function hideTopoForm() {
    $("#topoForm").hide(1000);
    $("#btnAddTopo").prop("disabled", false);
}
function openProfilModal(){
    $("#updateModal").modal();
}




/** When the web page is ready **/
$(document).ready(function() {

    /** Dropdown actions **/
    $('#dropUser a').click(function(){
        $('#lentUserSelected').text($(this).text() + "  ");
    });
    $('#dropRegion a').click(function(){
        $('#regionSelected').text($(this).text() + "  ");
    });

    /** Radio buttons actions **/
    $("input[type=radio]").change(function () {
        var radioVal = $("input[name='editRadioLent']:checked").val();
        if(radioVal == "lentYes") {
            $("#btnDropdownUserLent").prop("disabled", false);
        }
        else if(radioVal == "lentNo") {
            $("#btnDropdownUserLent").prop("disabled", true);
        }
    });




    // grab all thumbnails and add bootstrap popovers
    // https://getbootstrap.com/javascript/#popovers
    $('[data-toggle="popover"]').popover({
        container: 'body',
        html: true,
        placement: 'auto top',
        trigger: 'hover',
        animation: true,
        content: function() {
            // get the url for the full size img
            var url = $(this).data('full');
            return '<img src="' + url + '" width="150px" height="200px">'
        }
    });
});