/*** TOPOS ****/
var topoFormAction;

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

    // To update
    $("#topoSiteSelect").val($("#region" + id).attr("regionid"));

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
    $("#topoSiteSelect").val("prompt");
    $("input:radio[name=topoAvailable][value=false]").prop("checked", true);
    $("input:radio[name=topoLent][value=false]").prop("checked", true);
    $("#userLentSelect").prop('required', false);
    $("#userLentSelect").val("prompt");
    $("#divUserLent").hide();
}
function showTopoForm(clear, topoid) {
    if(clear) clearTopoForm();

    if(topoid==="new") topoFormAction = "new";
    else topoFormAction = "update";

    alert(topoFormAction);

    $("#topoForm").attr("topoid", topoid);
    $("#topoForm").show(1000);
    $("#btnAddTopo").prop("disabled", true);
}
function hideTopoForm() {
    $("#topoForm").hide(1000);
    $("#btnAddTopo").prop("disabled", false);
}
