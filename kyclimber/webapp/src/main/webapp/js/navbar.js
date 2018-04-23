$(document).ready(function() {

    /** Submit action **/
    $("#btnNavSearch").on("click", function (e) {

        var searchData = $("#inputNavSearch").val();

        // Empty search
        if(searchData == ""){
            $("#inputNavSearch").attr("placeholder", "Ecrire une recherche !")
        }
        // Real search
        else {
            window.location.href = "search.action?userQuery=" + searchData;
        }
    });
});