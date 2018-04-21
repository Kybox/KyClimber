/** TAB - COMMENTS **/
$(document).ready(function() {

    /** Actions buttons **/
    $("button[commentid]").on("click", function (e) {
        var commentid = $(this).attr("commentid");
        var action = $(this).attr("action");
        if(action=="edit") {
            showInputEditComment(commentid);
        }
        else if(action=="delete") {
            alert("Delete " + commentid);
        }
    });

    /** Cancel edit buttons **/
    $("button[cancelEditUserComment]").on("click", function (e) {
        var commentid = $(this).attr("cancelEditUserComment");
        removeInputEditComment(commentid);
    });

    /** Save edit buttons **/
    $("button[saveEditUserComment]").on("click", function (e) {
        var commentid = $(this).attr("saveEditUserComment");
        saveUpdatedComment(commentid);
    });
});

/** Switch text to form for editing **/
function showInputEditComment(id) {
    var userComment = $("#userComment" + id);
    userComment.hide();
    $("#formUserEditComment" + id).show();
    $("#btnEditUserComment" + id).prop("disabled", true);
    $("#userEditCommentInput" + id).val($.trim(userComment.text()));
}

/** Switch form to text for cancel editing **/
function removeInputEditComment(id) {
    $("#userComment" + id).show();
    $("#formUserEditComment" + id).hide();
    $("#btnEditUserComment" + id).prop("disabled", false);
}

/** Save the comment update **/
function saveUpdatedComment(id) {
    var comment = $("#userEditCommentInput" + id).val();
    var data = "commentId=" + id + "&comment=" + comment;
    $.ajax({
        type: "POST",
        url: "updateAjaxUserComment.action",
        data: data,
        dataType: "json",
        success: function (data) {
            openProfilModal();
            removeInputEditComment(id);
            $("#userComment" + id).text(comment);

        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}