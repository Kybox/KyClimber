<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<form id="formUserPassword">
    <!-- Current password -->
    <label for="oldPassword">Votre mot de passe actuel *</label>
    <input type="password" id="oldPassword" class="form-control" required>
    <br>
    <!-- New password 1 -->
    <label for="newPassword1">Votre nouveau mot de passe *</label>
    <input type="password" id="newPassword1" class="form-control" required>
    <br>
    <!-- New password 2 -->
    <label for="newPassword2">Confirmez votre nouveau mot de passe *</label>
    <input type="password" id="newPassword2" class="form-control" required>
    <hr>
    <button type="submit" class="btn btn-primary">
        <span class="glyphicon glyphicon-floppy-save" style="margin-right:6px;"></span>
        Mettre à jour le mot de passe
    </button>
</form>