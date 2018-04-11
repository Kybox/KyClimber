<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<h3><span class="label label-info" >Commentaires</span></h3>
<br>
<s:if test="#session.user">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">Ajouter un commentaire :</h4>
        </div>
        <div class="panel-body">
            <textarea id="comment" name="comment" class="form-control" rows="5"></textarea>
            <br>
            <input type="button" id="submitComment" class="btn btn-primary" value="Envoyer le commentaire >>" onclick="addNewComment()">
        </div>
        <div class="panel-footer">Après l'envoi du commentaire, vous pourrez toujours modifier.</div>
    </div>
    <script type="application/javascript">
        function addNewComment() {
            var siteId = <s:property value="#varSiteId"/>;
            var userId = <s:property value="#session.user.id"/>;
            var post = $("#comment").val();
            $.ajax({
                type: "POST",
                url: "<s:url action="addNewAjaxComment"/>",
                data: "siteId="+siteId+"&userId="+userId+"&post="+post,
                dataType: "json",
                success: function (data) {
                    for (var key in data){
                        console.log(key, data[key]);
                    }
                    var $divCom = jQuery("#comments");
                    var $com = '<div class="media" id="newCom">' +
                        '<div class="media-left">' +
                        '<a href="#">' +
                        '<img class="media-object" src="http://0.gravatar.com/avatar/?s=64&d=mm&r=g"' +
                        'alt="Image" height="64" width="64"></a>' +
                        '</div>' +
                        '<div class="media-body">' +
                        '<h4 class="media-heading">' +
                        data[0].user.firstName + ' a écrit le ' + data[0].date +
                        '</h4>' +
                        '<p>' + data[0].post + '</p>' +
                        '</div>' +
                        '</div>' +
                        '<br>';
                    $divCom.prepend($com);
                    $('#newCom').fadeOut(1).fadeIn("slow");
                }
            });
        }
    </script>
</s:if>
<div id="comments">
    <s:iterator value="commentList">
        <s:set var="varUser" value="user"/>
        <div class="media">
            <div class="media-left">
                <a href="#">
                    <img class="media-object"
                    <s:if test="%{#varUser.avatar!=null}">
                         src="<s:property value="#varUser.avatar"/>"
                    </s:if>
                    <s:else>
                         src="http://0.gravatar.com/avatar/?s=64&d=mm&r=g"
                    </s:else>
                         alt="Image"
                         height="64" width="64">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">
                    <s:property value="#varUser.firstName"/>
                    a écrit le
                    <s:property value="date"/>
                    <s:if test="%{#session.user.id==#varUser.id}">
                        (modifier)
                    </s:if>
                </h4>
                <p><s:property value="post"/></p>
            </div>
        </div>
        <br>
    </s:iterator>
</div>
