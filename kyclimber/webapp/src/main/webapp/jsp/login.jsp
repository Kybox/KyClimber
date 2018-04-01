<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<%@ include file="include/head.jsp" %>
<body>
    <%@ include file="include/header.jsp" %>
    <h2>Connexion</h2>
    <s:form action="login">
        <s:textfield name="login" label="Identifiant" requiredLabel="true"/>
        <s:password name="password" label="Mot de passe" requiredLabel="true"/>
        <s:submit value="Connexion"/>
    </s:form>
</body>
</html>
