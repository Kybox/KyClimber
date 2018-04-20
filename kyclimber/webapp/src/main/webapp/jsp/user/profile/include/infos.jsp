<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<form id="formUserInfos">
    <!-- Email address -->
    <label for="email">Adresse e-mail *</label>
    <input type="email" name="email" id="email" class="form-control"
           value="<s:property value="user.email"/>" maxlength="60" required>
    <br>
    <!-- First name -->
    <label for="firstName">Prénom / pseudo *</label>
    <input type="text" name="firstName" id="firstName" class="form-control"
           value="<s:property value="user.firstName"/>" maxlength="30" required>
    <br>
    <!-- Last name -->
    <label for="lastName">Nom</label>
    <input type="text" name="lastName" id="lastName" class="form-control"
           value="<s:property value="user.lastName"/>" maxlength="30" required>
    <br>
    <!-- Postal address -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-envelope" style="margin-right:6px;"></span>
            Adresse postale <i>(pour le prêt de topos)</i>
        </div>
        <div class="panel-body">
            <!-- Road and number -->
            <label for="road">Numéro et nom de rue</label>
            <input type="text" name="road" id="road" class="form-control"
                   value="<s:property value="user.road"/>" maxlength="200">
            <br>
            <!-- Postal code -->
            <label for="postalCode">Code postal</label>
            <input type="text" name="postalCode" id="postalCode" class="form-control"
                   value="<s:property value="user.postalCode"/>" maxlength="5">
            <br>
            <!-- City -->
            <label for="city">Ville</label>
            <input type="text" name="city" id="city" class="form-control"
                   value="<s:property value="user.city"/>" maxlength="163">
            <br>
            <!-- Country -->
            <label for="country">Pays</label>
            <input type="text" name="country" id="country" class="form-control"
                   value="<s:property value="user.country"/>" maxlength="100">
        </div>
    </div>
    <!-- Submit validation -->
    <button type="submit" id="btnSumbitFormUserInfos" class="btn btn-primary">
        <span class="glyphicon glyphicon-floppy-save" style="margin-right:6px;"></span>
        Mettre à jour les informations
    </button>
</form>