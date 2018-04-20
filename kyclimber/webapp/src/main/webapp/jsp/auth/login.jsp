<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="fr">
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/header.jsp" %>
<br>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            <span class="glyphicon glyphicon-log-in" style="margin-right:6px;"></span>
            Connexion à un compte utilisateur
        </h3>
    </div>
    <div class="panel-body">
        <form method="post">
            <input type="hidden" name="password" id="encryptPass">
            <label for="email">Adresse e-mail :</label>
            <input type="email" class="form-control" name="login" id="email" required>
            <br>
            <label for="userPassword">Mot de passe :</label>
            <input type="password" class="form-control" id="userPassword" required>
            <hr/>
            <button id="btnConnect" class="btn btn-primary">Connexion !</button>
        </form>
    </div>
</div>
<s:if test="result=='error'">
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Connexion à un compte utilisateur</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger" role="alert">
                    <p><b>Une erreur est survenue !</b></p>
                    <p>L'adresse e-mail et/ou le mot de passe sont incorrects.</p>
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>
    <script type="application/javascript">
        $("#loginModal").modal("show");
    </script>
</s:if>
</body>
</html>
