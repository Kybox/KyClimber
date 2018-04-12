<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="hasFieldErrors()">
    <div class="alert alert-danger" role="alert">
        <s:fielderror/>
    </div>
</s:if>

    <s:label for="email" theme="simple" value="Adresse e-mail *"/>
    <s:textfield name="email" id="email" type="email" cssClass="form-control" theme="simple" required="true" maxlength="60" value="%{user.email}"/>
    <br>
    <s:label for="firstName" theme="simple" value="Prénom / pseudo *"/>
    <s:textfield name="firstName" id="firstName" cssClass="form-control" theme="simple" required="true" maxlength="30" value="%{user.firstName}"/>
    <br>
    <s:label for="lastName" theme="simple" value="Nom"/>
    <s:textfield name="lastName" id="lastName" cssClass="form-control" theme="simple" maxlength="30" value="%{user.lastName}"/>
    <br>
    <div class="panel panel-default">
        <div class="panel-heading">Adresse postale (pour le prêt de topos)</div>
        <div class="panel-body">
            <s:label for="road" theme="simple" value="Numéro et nom de rue"/>
            <s:textfield name="road" id="road" cssClass="form-control" theme="simple" maxlength="30" value="%{user.road}"/>
            <br>
            <s:label for="postalCode" theme="simple" value="Code postal"/>
            <s:textfield name="postalCode" id="postalCode" cssClass="form-control" theme="simple" maxlength="30" value="%{user.postalCode}"/>
            <br>
            <s:label for="city" theme="simple" value="Ville"/>
            <s:textfield name="city" id="city" cssClass="form-control" theme="simple" maxlength="30" value="%{user.city}"/>
            <br>
            <s:label for="country" theme="simple" value="Pays"/>
            <s:textfield name="country" id="country" cssClass="form-control" theme="simple" maxlength="30" value="%{user.country}"/>
        </div>
    </div>
    <s:label for="tel" theme="simple" value="Téléphone"/>
    <s:textfield name="tel" type="tel" id="tel" cssClass="form-control" theme="simple" maxlength="20" value="%{user.tel}"/>
    <hr/>
    <s:if test="hasActionErrors()">
        <div class="alert alert-info" role="alert">
            <s:actionerror/>
        </div>
    </s:if>

    <input type="button" id="submitComment" class="btn btn-primary" value="Mettre à jour les informations >>" onclick="updateUserInfos()">