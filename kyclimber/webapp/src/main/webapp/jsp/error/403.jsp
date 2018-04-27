<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="fr">
<%@ include file="../include/head.jsp" %>
<body>
<%@include file="../include/header.jsp" %>
<br>
<div class="alert alert-warning text-center" role="alert">
    L'accès à ces données nécessite une authentification utilisateur !
    <br>
    <br>
    <a href="signup.action">
        <button class="btn btn-info">
            Créer un compte
        </button>
    </a>
    <span class="glyphicon glyphicon-option-vertical"></span>
    <a href="login.action">
        <button class="btn btn-info">
            Se connecter
        </button>
    </a>
</div>
</body>
</html>