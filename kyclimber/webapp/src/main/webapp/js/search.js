$(document).ready(function() {

    /** Submit action **/
    $("#btnCustomSearchSubmit").on("click", function (e) {

        if($("#keyword").val() == "") $("#keyword").attr("placeholder", "Ecrire une recherche !");
        else $("#formCustomSearch").submit();
    });
});