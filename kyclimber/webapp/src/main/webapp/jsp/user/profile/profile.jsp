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
        <h3 class="panel-title"><b><i>Mon profil utilisateur</i></b></h3>
    </div>
    <div class="panel-body">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#infos" data-toggle="tab">Informations</a></li>
            <li><a href="#pass" data-toggle="tab">Mot de passe</a></li>
            <li><a href="#pic" data-toggle="tab">Avatar</a></li>
            <li><a href="#topo" data-toggle="tab">Topos</a></li>
            <li><a href="#com" data-toggle="tab">Commentaires</a></li>
        </ul>
        <div class="tab-content ">
            <div class="tab-pane active" id="infos">
                <br>
                <%@ include file="include/infos.jsp" %>
            </div>
            <div class="tab-pane" id="pass">
                <br>
                <%@ include file="include/password.jsp" %>
            </div>
            <div class="tab-pane" id="pic">
                <br>
                <%@ include file="include/picture.jsp" %>
            </div>
            <div class="tab-pane" id="topo">
                <br>
                <%@ include file="include/topos.jsp" %>
            </div>
            <div class="tab-pane" id="com">
                <h3>Comments</h3>
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
</body>
</html>
