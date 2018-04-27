$(document).ready(function() {

    /** Edit buttons **/
    $("button[editcommentid]").click(function (e) {
        if($(this).attr("editcommentid") != null)
            showEditCommentForm($(this).attr("editcommentid"));
    });

    /** Cancel edit buttons **/
    $("button[cancelEditComment]").on("click", function (e) {
        var commentid = $(this).attr("cancelEditComment");
        hideEditCommentForm(commentid);
    });

    /** Forms submit **/
    $("form[commentid]").on("submit", function (e) {
        e.preventDefault();
        saveUpdatedComment($(this).attr("commentid"));
    });
    $("#formAddNewComment").on("submit", function (e) {
        e.preventDefault();
        addNewComment();
    });
});

function showEditCommentForm(id) {
    let postContent = $("#postContent" + id);
    postContent.hide();
    $("#editComment" + id).show();
    $("#btnEditComment" + id).prop("disabled", true);
    $("#userEditCommentInput" + id).val($.trim(postContent.text()));
}

function hideEditCommentForm(id) {
    $("#postContent" + id).show();
    $("#editComment" + id).hide();
    $("#btnEditComment" + id).prop("disabled", false);
}

/** Save the updated comment **/
function saveUpdatedComment(id) {
    let comment = $("#userEditCommentInput" + id).val();
    let data = "commentId=" + id + "&comment=" + comment;
    $.ajax({
        type: "POST",
        url: "updateAjaxUserComment.action",
        data: data,
        dataType: "json",
        success: function (data) {
            $("#postContent" + id).text(comment);
            hideEditCommentForm(id);
        },
        error: function (data, status, error) {
            alert("Oups, une erreur s'est produite...");
        }
    });
}

function addNewComment() {

    let formData = $("#formAddNewComment").serialize();

    $.ajax({
        type: "POST",
        url: "addNewAjaxComment.action",
        data: formData,
        dataType: "json",
        success: function (data) {
            for (var key in data){
                console.log(key, data[key]);
            }
            displayNewComment(data);
        }
    });
}

function displayNewComment(data){

    let user = data[0].user;
    var $divCom = $("#comments");
    var $com = '<div class="media" id="newCom">' +
        '<div class="media-left">' +
        '<a href="#">' +
        '<img class="media-object" src="'+ user.avatar.url +'"' +
        'alt="Image" height="64" width="64"></a>' +
        '</div>' +
        '<div class="media-body">' +
        '<h4 class="media-heading">' +
        user.firstName + " a \351crit \340 l'instant " +
        '</h4>' +
        '<p>' + data[0].post + '</p>' +
        '</div>' +
        '</div>' +
        '<br>';
    $divCom.prepend($com);
    $('#newCom').fadeOut(1).fadeIn("slow");
}