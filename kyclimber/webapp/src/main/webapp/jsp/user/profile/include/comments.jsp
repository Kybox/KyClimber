<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Liste de vos commentaires</h3>
    </div>
    <div class="panel-body">
        <div class=table-responsive>
            <table class="table nowrap table-hover">
                <thead>
                <tr>
                    <th>Date</th>
                    <th>Site d'escalade</th>
                    <th>Commentaire</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="commentList" status="commentObj">
                    <tr id="userCommentTableRow<s:property value="id"/>">
                        <td id="userCommentDate<s:property value="id"/>" style="vertical-align:middle;">
                            Le <s:date name="date" format="dd/MM/yyyy"/><br>
                            <small>à <s:date name="date" format="hh:mm:ss"/></small>
                        </td>
                        <td id="userCommentSite<s:property value="id"/>" style="vertical-align:middle;">
                            <a href="site.action?regionId=<s:property value="site.region.id"/>&siteId=<s:property value="site.id"/>">
                                <s:property value="site.name"/>
                            </a>
                            <h5>
                                <small>
                                    <s:property value="site.region.name"/>
                                </small>
                            </h5>
                        </td>
                        <td id="userCommentPost<s:property value="id"/>" style="vertical-align:middle;">
                            <div id="userComment<s:property value="id"/>">
                                <s:property value="post"/>
                            </div>
                            <form id="formUserEditComment<s:property value="id"/>" hidden>
                                <div class="input-group">
                                    <input type="text"
                                           id="userEditCommentInput<s:property value="id"/>"
                                           name="userEditCommentInput"
                                           class="form-control" required>
                                    <span class="input-group-btn">
                                        <button type="button"
                                                cancelEditUserComment="<s:property value="id"/>"
                                                class="btn btn-primary"
                                                data-toggle="tooltip"
                                                title="Annuler">
                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        </button>
                                        <button type="button"
                                                saveEditUserComment="<s:property value="id"/>"
                                                class="btn btn-primary"
                                                data-toggle="tooltip"
                                                title="Enregistrer">
                                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </td>
                        <td style="vertical-align:middle;">
                            <button id="btnEditUserComment<s:property value="id"/>"
                                    commentid="<s:property value="id"/>"
                                    action="edit"
                                    class="btn btn-primary"
                                    style="margin-right:6px;">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                Editer
                            </button>
                            <button id="btnDeleteUserComment<s:property value="id"/>"
                                    commentid="<s:property value="id"/>"
                                    action="delete"
                                    class="btn btn-primary">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                Supprimer
                            </button>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteUserCommentModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Profil utilisateur</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger text-center" role="alert">
                    <p>Attention, vous êtes sur le point de <b>supprimer</b> votre commentaire !</p>
                    <p>Cette action est <b>irreversible</b> !</p>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        Rappel du commentaire éligible à la suppression :
                    </div>
                    <div class="panel-body" id="commentReminderToDelete"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnModalDeleteComment" commentIdToDelete="" class="btn btn-danger" data-dismiss="modal">Supprimer</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
            </div>
        </div>
    </div>
</div>
