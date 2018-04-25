$(document).ready(function() {

    $("a[topoid]").click(function (e) {
        e.preventDefault();
        if($(this).attr("topoid") != null)
            getAjaxTopoDetails($(this).attr("topoid"));
    })
});

function getAjaxTopoDetails(topoId) {
    $("#topoDetails").fadeOut(5);
    var data = "topoId=" + topoId;
    $.ajax({
        type: "POST",
        url: "topoAjax.action",
        data: data,
        dataType: "json",
        success: function (data) {
            displayTopo(data);
        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}

function displayTopo(data) {
    var jsonTopo = data.topo;
    // Panel title
    $("#topoDetailsTitle").text(jsonTopo.name);
    // Aside
    $("#topoDetailsCover").hide();
    $("#topoDetailsCover").attr("src", jsonTopo.cover);
    $("#topoDetailsUserEmail").text(jsonTopo.user.firstName);
    // Details
    $("#topoDetailsName").text(jsonTopo.name);
    $("#topoDetailsPublisher").text("Edition : " + jsonTopo.publisher);
    $("#topoDetailsSite").text(jsonTopo.site.name);
    $("#topoDetailsSite").attr("href", "site.action?regionId=" + jsonTopo.site.region.id + "&siteId=" + jsonTopo.site.id);
    $("#topoDetailsDescription").text(jsonTopo.description);


    // Show
    $("#topoDetails").fadeIn(500);
    $("#topoDetailsCover").fadeIn(1000);
}