/*** TOPOS ****/

$(document).ready(function() {

    /** Cancel button **/
    $("#btnCancelTopoForm").click(function (e) {
        e.preventDefault();
        hideTopoForm();
    });

    /** Save button **/
    $("#formTopo").submit(function(e) {
        e.preventDefault();
        updateTopo();
    });

    /** Radio buttons actions **/
    $("input[type=radio]").change(function () {
        var radioVal = $("input[name='topoLent']:checked").val();
        if(radioVal === "true"){
            $("#userLentSelect").prop('required', true);
            $("#divUserLent").show();
        }
        else if(radioVal === "false"){
            $("#divUserLent").hide();
            $("#userLentSelect").prop('required', false);
        }
    });

    /** Cover preview **/
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

function checkTopoAvailable(id) {
    var available = $("#available" + id + " span").attr("available");
    return (available === "true");
}
function checkTopoLent(id){
    var lent = $("#lent" + id + " span").attr("lent");
    return (lent === "true");
}
function editTopo(id, userId) {

    $("#topoId").attr("value", id);
    $("#topoUserId").attr("value", userId);
    $("#txtName").val($("#name" + id).text());
    $("#txtDescription").val($("#description" + id).text());
    $("#txtEdition").val($("#puslisher" + id).text());
    $("#txtCover").val($("#cover" + id).attr("data-full"));
    $("#topoRegionSelect").val($("#region" + id).attr("regionid"));

    if(checkTopoAvailable(id) === true)
        $("input:radio[name=topoAvailable][value=true]").prop("checked", true);
    else $("input:radio[name=topoAvailable][value=false]").prop("checked", true);

    if(checkTopoLent(id) === true){
        $("input:radio[name=topoLent][value=true]").prop("checked", true);
        $("#divUserLent").show();
        $("#userLentSelect").val($("#userLent").attr("lentUserId"));
    }
    else {
        $("input:radio[name=editRadioLent][value=lentNo]").prop("checked", true);
        $("#divUserLent").hide();
    }

    showTopoForm(false, id);
}
function clearTopoForm() {
    $("#txtName").val("");
    $("#txtDescription").val("");
    $("#txtEdition").val("");
    $("#txtCover").val("");
    $("#topoRegionSelect").val("prompt")
    $("input:radio[name=topoAvailable][value=false]").prop("checked", true);
    $("input:radio[name=topoLent][value=false]").prop("checked", true);
    $("#userLentSelect").prop('required', false);
    $("#userLentSelect").val("prompt");
    $("#divUserLent").hide();
}
function showTopoForm(clear, topoid) {
    if(clear) clearTopoForm();
    $("#topoForm").attr("topoid", topoid);
    $("#topoForm").show(1000);
    $("#btnAddTopo").prop("disabled", true);
}
function hideTopoForm() {
    $("#topoForm").hide(1000);
    $("#btnAddTopo").prop("disabled", false);
}
function updateTopo() {
    var formData = $("#formTopo").serialize();
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

        const region = "#region" + currentId;
        const available = "#topoSpanAvailable" + currentId;

        $("#name" + currentId).text(obj.name);
        $(region).attr("regionid", obj.region.id);
        $(region).text(obj.region.name);
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