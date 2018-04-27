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
            <form id="formAddNewComment">
                <input type="hidden" name="siteId" value="<s:property value="site.id"/>">
                <textarea id="comment" name="comment" class="form-control" rows="5" required></textarea>
                <br>
                <button type="submit" class="btn btn-primary">
                    Envoyer le commentaire
                    <span class="glyphicon glyphicon-floppy-save" style="margin-left:6px;"></span>
                </button>
            </form>
        </div>
        <div class="panel-footer">
            <div class="well inline-headers" style="margin:0px;">
                <h3 style="display: inline-block;vertical-align:baseline;margin:0px;">
                    <span class="glyphicon glyphicon-info-sign" style="margin-right:6px;"></span>
                </h3>
                <h4 style="display: inline-block;vertical-align:baseline;margin:0px;">
                    <small>
                        <i>Après l'envoi du commentaire, vous pourrez toujours le modifier en étant authentifié.</i>
                    </small>
                </h4>
            </div>
        </div>
    </div>
</s:if>
<div id="comments">
    <s:iterator value="commentList">
        <s:set var="varUser" value="user"/>
        <div class="media">
            <div class="media-left">
                <a href="#">
                    <img class="media-object"
                    <s:if test="user.avatar.url!=null">
                         src="<s:property value="user.avatar.url"/>"
                    </s:if>
                    <s:else>
                         src="http://0.gravatar.com/avatar/?s=64&d=mm&r=g"
                    </s:else>
                         alt="Image"
                         height="64" width="64">
                </a>
            </div>
            <div class="media-body" style="vertical-align: middle">
                <h4 class="media-heading">
                    <s:property value="#varUser.firstName"/>
                    a écrit le
                    <s:date name="date" format="dd/MM/yyyy"/> à <s:date name="date" format="HH:mm:ss" timezone = "GMT+02:00"/>
                    <s:if test="%{#session.user.id==#varUser.id}">
                        <button class="btn btn-default" style="margin-left:10px;"
                                data-toggle="tooltip" title="Editer"
                                id="btnEditComment<s:property value="id"/>"
                                editcommentid="<s:property value="id"/>">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </button>
                    </s:if>
                </h4>
                <div style="vertical-align:middle;">
                    <p id="postContent<s:property value="id"/>">
                        <s:property value="post"/>
                    </p>
                    <s:if test="#session.user&&#session.user.id==user.id">
                        <form id="editComment<s:property value="id"/>" commentid="<s:property value="id"/>" hidden>
                            <div class="input-group">
                                <input type="text"
                                       id="userEditCommentInput<s:property value="id"/>"
                                       name="userEditCommentInput"
                                       class="form-control" placeholder="" required>
                                <span class="input-group-btn" style="vertical-align:middle;">
                                    <button type="button"
                                            cancelEditComment="<s:property value="id"/>"
                                            class="btn btn-primary"
                                            data-toggle="tooltip"
                                            title="Annuler">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    </button>
                                    <button type="submit"
                                            saveEditComment="<s:property value="id"/>"
                                            class="btn btn-primary"
                                            data-toggle="tooltip"
                                            title="Enregistrer">
                                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </s:if>
                </div>
            </div>
        </div>
        <br>
    </s:iterator>
</div>
