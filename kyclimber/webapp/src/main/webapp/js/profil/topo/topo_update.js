function updateTopo() {
    var formData = $("#formTopo").serialize();
    formData += "&actionType=" + topoFormAction;
    console.log(formData);
    $.ajax({
        type: "POST",
        url: "updateAjaxUserTopo.action",
        data: formData,
        dataType: "json",
        success: function (data) {
            openProfilModal();
            hideTopoForm();
            updateTopoInTable(data);
        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}
function updateTopoInTable(data) {
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
}