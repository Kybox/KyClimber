/** TAB - COMMENTS **/
$(document).ready(function() {

    /** Actions buttons (edit & delete) **/
    $("button[commentid]").on("click", function (e) {
        var commentid = $(this).attr("commentid");
        var action = $(this).attr("action");
        if(action=="edit") {
            showInputEditComment(commentid);
        }
        else if(action=="delete") {
            openDeleteCommentConfirmationModal(commentid);
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

    /** Delete modal buttons **/
    $("button[commentIdToDelete]").on("click", function (e) {
        var commentid = $(this).attr("commentIdToDelete");
        deleteUserComment(commentid);
    });
});

/** Open delete modal confirmation **/
function openDeleteCommentConfirmationModal(id) {
    var divCommentReminder = $("#commentReminderToDelete");
    divCommentReminder.text($("#userCommentDate" + id).text());
    divCommentReminder.append("<br>Lieu : " + $("#userCommentSite" + id).text());
    divCommentReminder.append("<br>" + $("#userComment" + id).text());
    $("#btnModalDeleteComment").attr("commentIdToDelete", id);
    $("#deleteUserCommentModal").modal();
}

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

/** Save the updated comment **/
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

/** Delete a comment **/
function deleteUserComment(id) {
    var data = "commentId=" + id;
    $.ajax({
        type: "POST",
        url: "deleteAjaxUserComment.action",
        data: data,
        dataType: "json",
        success: function (data) {
            $("#userCommentTableRow" + id).remove();
            openProfilModal();

        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}