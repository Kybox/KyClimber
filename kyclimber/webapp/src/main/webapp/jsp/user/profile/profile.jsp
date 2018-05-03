<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="fr">
<%@ include file="../../include/head.jsp" %>
<body>
<%@ include file="../../include/header.jsp" %>
<br>
<s:set var="varUser" value="user"/>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            <span class="glyphicon glyphicon-user"></span>
            <b><i>Mon profil utilisateur</i></b>
        </h3>
    </div>
    <div class="panel-body">
        <ul id="profil-nav-ul" class="nav nav-tabs">
            <li id="tabinfos" class="active">
                <a href="#content-infos" data-toggle="tab">
                    <span class="glyphicon glyphicon-list-alt"></span>
                    Informations
                </a>
            </li>
            <li id="tabpass">
                <a href="#content-pass" data-toggle="tab">
                    <span class="glyphicon glyphicon-lock"></span>
                    Mot de passe
                </a>
            </li>
            <li id="tabavatar">
                <a href="#content-avatar" data-toggle="tab">
                    <span class="glyphicon glyphicon-picture"></span>
                    Avatar
                </a>
            </li>
            <li id="tabtopo">
                <a href="#content-topo" data-toggle="tab">
                    <span class="glyphicon glyphicon-transfer"></span>
                    Topos
                </a>
            </li>
            <li id="tabcomments">
                <a href="#content-comments" data-toggle="tab">
                    <span class="glyphicon glyphicon-comment"></span>
                    Commentaires
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="content-infos">
                <br>
                <%@ include file="include/infos.jsp" %>
            </div>
            <div class="tab-pane" id="content-pass">
                <br>
                <%@ include file="include/password.jsp" %>
            </div>
            <div class="tab-pane" id="content-avatar">
                <br>
                <%@ include file="include/avatar.jsp" %>
            </div>
            <div class="tab-pane" id="content-topo">
                <br>
                <%@ include file="include/topos.jsp" %>
            </div>
            <div class="tab-pane" id="content-comments">
                <br>
                <%@ include file="include/comments.jsp" %>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Profil utilisateur</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-info" role="alert">
                    <p>Mise à jour effectuée !</p>
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="errorModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">
                    <span class="glyphicon glyphicon-user" style="margin-right:6px;"></span>
                    Profil utilisateur
                </h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger" role="alert">
                    <p>
                        <span class="glyphicon glyphicon-alert" style="margin-right:6px;"></span>
                        <b>Une erreur s'est produite !</b>
                    </p>
                    <br>
                    <span id="modalErrorMsg"></span>
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
