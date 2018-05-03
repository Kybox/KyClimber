function updateTopo() {

    var topoForm = $("#formTopo");
    var topoId = $("#topoForm").attr("topoid");
    var formData = topoForm.serialize();
    formData += "&actionType=" + topoFormAction;

    $.ajax({
        type: "POST",
        url: "updateAjaxUserTopo.action",
        data: formData,
        dataType: "json",
        success: function (data) {
            openProfilModal();
            hideTopoForm();
            updateTopoInTable(data, topoId);
        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}
function updateTopoInTable(data, topoId) {

    let topoTitle = $("#topoTitle" + topoId + " a");
    topoTitle.text(data.topo.name);

    let topoPublisher = $("#topoPublisher" + topoId);
    topoPublisher.text(" - Edition : " + data.topo.publisher);

    let topoDescription = $("#description" + topoId);
    topoDescription.text(data.topoDescription);

    let topoCover = $("#cover" + topoId + " > img");
    topoCover.attr("src", data.topo.cover);

    let topoSiteId = data.topo.site.id;
    let topoSiteName = data.topo.site.name;
    let topoRegionId = data.topo.site.region.id;
    let topoSite = $("#site" + topoId + " > a");
    topoSite.text(topoSiteName);
    topoSite.attr("href", "site.action?regionId=" + topoRegionId + "&siteId=" + topoSiteId);

    let topoAvailable = $("#available" + topoId + " > span");
    if(data.topo.available !== true) {
        topoAvailable.attr("class", "glyphicon glyphicon-remove");
        topoAvailable.attr("available", "false");
    }
    else {
        topoAvailable.attr("class", "glyphicon glyphicon-ok");
        topoAvailable.attr("available", "true");
    }

    let topoLent = $("#lent" + topoId + " > span");
    let topoUserLent = $("#lent" + topoId + " > div");
    if(data.topo.lentToUser !== null){
        topoLent.attr("class", "glyphicon glyphicon-ok");
        topoLent.attr("lent", "true");
        topoUserLent.text(data.topo.lentToUser.id);
        topoUserLent.show();
    }
    else{
        topoLent.attr("class", "glyphicon glyphicon-remove");
        topoLent.attr("lent", "false");
        topoUserLent.hide();
    }




    /*
    var topo = data[topoFormIndex];

    let topoTitle = $("#name" + topoId);

    topoTitle.text(topo.name);
*/
    /*
    for(var i = 0; i < data.length; i++){

        var obj = data[i];
        var currentId = i + 1;

        const site = "#siteid";
        const available = "#topoSpanAvailable" + currentId;

        $("#name" + currentId).text(obj.name);
        $(site).attr("siteid", obj.site.id);
        $(site).text(obj.site.name);
        $("#description" + currentId).text(obj.description);
        $("#publisher" + currentId).text(obj.publisher);
        $("#cover" + currentId).attr("data-full", obj.cover);

        alert("Available = " + obj.available);
        if(obj.available){
            alert("Add OK");
            $(available).attr("class", "glyphicon glyphicon-ok");
            $(available).attr("available", "true");
        }
        else {
            alert("Add NO");
            $(available).attr("class", "glyphicon glyphicon-remove");
            $(available).attr("available", "false");
        }
    }
    */
}