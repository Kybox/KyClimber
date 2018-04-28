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
            <h3 class="panel-title">Création d'un compte utilisateur</h3>
        </div>
        <div class="panel-body">
            <s:if test="hasFieldErrors()">
                <div class="alert alert-danger" role="alert">
                    <s:fielderror/>
                </div>
            </s:if>
            <form id="signupForm" method="post">
                <label for="email">Adresse e-mail *</label>
                <input type="email" id="email" name="email" class="form-control" maxlength="60" required>
                <br>
                <label for="password">Mot de passe *</label>
                <input type="password" id="password" name="password" class="form-control" required>
                <br>
                <label for="firstName">Prénom / pseudo *</label>
                <input type="text" id="firstName" name="firstName" class="form-control" maxlength="30" required>
                <br>
                <label for="lastName">Nom</label>
                <input type="text" id="lastName" name="lastName" class="form-control" maxlength="30">
                <hr>
                <s:if test="hasActionErrors()">
                    <div class="alert alert-info" role="alert">
                        <s:actionerror/>
                    </div>
                </s:if>
                <button type="submit" class="btn btn-primary" id="btnSubmitSignupForm">
                    <span class="glyphicon glyphicon-user"></span>
                    Création du compte utilisateur
                </button>
            </form>
        </div>
    </div>
    <s:set var="varResult" value="result"/>
    <s:if test="%{#varResult=='success'}">
        <div id="modalSuccess" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Compte utilisateur validé !</h4>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-info" role="alert">
                            <b>Votre compte utilisateur est maintenant créé.</b><br>
                            Cliquez sur le bouton connexion pour commencer à commenter ou à ajouter
                            de nouveaux sites d'escalade.
                        </div>
                        <s:set var="varEmail" value="email"/>
                        <s:set var="varPass" value="password"/>
                        <s:form theme="simple" action="login">
                            <s:hidden name="login" value="%{varEmail}"/>
                            <s:hidden name="password" value="%{varPass}"/>
                            <s:submit cssClass="btn btn-primary" value="Connexion"/>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
        <script type="application/javascript">
            $('#modalSuccess').modal('toggle');
            $('#signupForm :input').prop('disabled', true);
        </script>
    </s:if>
</body>
</html>
