<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Authentification d'un compte utilisateur</h4>
            </div>
            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">@</span>
                    <input type="text" class="form-control" placeholder="Identifiant" aria-describedby="basic-addon1">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon2">***</span>
                    <input type="password" class="form-control" placeholder="Mot de passe" aria-describedby="basic-addon1">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                <button type="button" class="btn btn-primary">Connexion</button>
            </div>
        </div>
    </div>
</div>
