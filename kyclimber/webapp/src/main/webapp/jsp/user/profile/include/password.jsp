<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="hasFieldErrors()">
    <div class="alert alert-danger" role="alert">
        <s:fielderror/>
    </div>
</s:if>
<s:form theme="simple" id="passForm">
    <s:label for="oldPass" theme="simple">Votre mot de passe actuel *</s:label>
    <s:textfield name="oldPass" type="password" cssClass="form-control" theme="simple" required="true" maxlength="60"/>
    <br>
    <s:label for="newPass1" theme="simple">Votre nouveau mot de passe *</s:label>
    <s:textfield name="newPass1" type="password" cssClass="form-control" theme="simple" required="true" maxlength="60"/>
    <br>
    <s:label for="newPass2" theme="simple">Confirmez votre nouveau mot de passe *</s:label>
    <s:textfield name="newPass2" type="password" cssClass="form-control" theme="simple" required="true" maxlength="60"/>
    <hr/>
    <s:if test="hasActionErrors()">
        <div class="alert alert-info" role="alert">
            <s:actionerror/>
        </div>
    </s:if>
    <s:submit value="Mettre à jour le mot de passe >>" cssClass="btn btn-primary"/>
</s:form>