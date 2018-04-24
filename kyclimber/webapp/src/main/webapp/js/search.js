$(document).ready(function() {

    /** Submit action **/
    $("#btnCustomSearchSubmit").on("click", function (e) {

        if($("#keyword").val() == "") $("#keyword").attr("placeholder", "Ecrire une recherche !");
        else $("#formCustomSearch").submit();
    });

    if(selectedPreviousOption != "") setChecked(selectedPreviousOption);
});

function setChecked(radioBtn) {
    var radioBtnList = $("input:radio[name=selectedSearchOption]");
    radioBtnList.each(function (index, value) {
        if ($(this).attr("value") === radioBtn) {
            $(this).prop("checked", true);
        }
        else $(this).prop("checked", false);
    });
}