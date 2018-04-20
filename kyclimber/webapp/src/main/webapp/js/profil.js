/** Open modal **/
function openProfilModal(){
    $("#updateModal").modal();
}

/** Open error modal **/
function openErrorModal(error) {
    $("#modalErrorMsg").text(error);
    $("#errorModal").modal();
}