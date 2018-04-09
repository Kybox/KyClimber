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
            <s:form action="signup" theme="simple" id="signupForm">
                <s:label for="email" theme="simple">Adresse e-mail *</s:label>
                <s:textfield name="email" type="email" cssClass="form-control" theme="simple" required="true"/>
                <br>
                <s:label for="password" theme="simple">Mot de passe *</s:label>
                <s:textfield name="password" type="password" cssClass="form-control" theme="simple" required="true"/>
                <br>
                <s:label for="firstName" theme="simple">Prénom / pseudo *</s:label>
                <s:textfield name="firstName" cssClass="form-control" theme="simple" required="true"/>
                <br>
                <s:label for="lastName" theme="simple">Nom</s:label>
                <s:textfield name="lastName" cssClass="form-control" theme="simple"/>
                <hr/>
                <s:if test="hasActionErrors()">
                    <div class="alert alert-info" role="alert">
                        <s:actionerror/>
                    </div>
                </s:if>
                <s:submit value="Création du compte utilisateur" cssClass="btn btn-primary"/>
            </s:form>
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
