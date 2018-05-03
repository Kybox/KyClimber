$(document).ready(function() {

    let hash = window.location.hash.substr(1);

    if(hash !== "") {

        /** Tab **/
        let currentActiveTab = $("#profil-nav-ul li.active");
        currentActiveTab.removeClass();
        let newActiveTab = $("#tab" + hash);
        newActiveTab.addClass("active");

        /** Content **/
        let currentActiveContent = $(".tab-pane.active");
        currentActiveContent.removeClass("active");
        let newActiveContent = $("#content-" + hash);
        newActiveContent.addClass("active");
    }
});

/** Open modal **/
function openProfilModal(){
    $("#updateModal").modal();
}

/** Open error modal **/
function openErrorModal(error) {
    $("#modalErrorMsg").text(error);
    $("#errorModal").modal();
}