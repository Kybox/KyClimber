<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="hasFieldErrors()">
    <div class="alert alert-danger" role="alert">
        <s:fielderror/>
    </div>
</s:if>
<s:label for="oldPass" theme="simple" value="Votre mot de passe actuel *"/>
<s:textfield name="oldPass" id="oldPass" type="password" cssClass="form-control" theme="simple" required="true" maxlength="60"/>
<br>
<s:label for="newPass1" theme="simple" value="Votre nouveau mot de passe *"/>
<s:textfield name="newPass1" id="newPass1" type="password" cssClass="form-control" theme="simple" required="true" maxlength="60"/>
<br>
<s:label for="newPass2" theme="simple" value="Confirmez votre nouveau mot de passe *"/>
<s:textfield name="newPass2" id="newPass2" type="password" cssClass="form-control" theme="simple" required="true" maxlength="60"/>
<hr/>
<s:if test="hasActionErrors()">
    <div class="alert alert-info" role="alert">
        <s:actionerror/>
    </div>
</s:if>
<input type="button" id="submitComment" class="btn btn-primary" value="Mettre à jour le mot de passe >>" onclick="updateUserPassword()">