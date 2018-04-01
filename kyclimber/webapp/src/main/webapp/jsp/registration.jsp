<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<%@ include file="include/head.jsp" %>
<body>
    <%@include file="include/header.jsp" %>
    <h2>Inscription</h2>

    <s:form action="register">
        <s:textfield name="email" label="E-mail" requiredLabel="true"/>
        <s:password name="password" label="Mot de passe" requiredLabel="true"/>
        <s:textfield name="firstName" label="Prénom" requiredLabel="true"/>
        <s:textfield name="lastName" label="Nom"/>
        <s:submit value="Enregistrer"/>
    </s:form>
</body>
</html>
