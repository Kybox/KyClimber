<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="hasFieldErrors()">
    <div class="alert alert-danger" role="alert">
        <s:fielderror/>
    </div>
</s:if>

    <s:label for="email" theme="simple">Adresse e-mail *</s:label>
    <s:textfield name="email" id="email" type="email" cssClass="form-control" theme="simple" required="true" maxlength="60" value="%{user.email}"/>
    <br>
    <s:label for="firstName" theme="simple">Prénom / pseudo *</s:label>
    <s:textfield name="firstName" id="firstName" cssClass="form-control" theme="simple" required="true" maxlength="30" value="%{user.firstName}"/>
    <br>
    <s:label for="lastName" theme="simple">Nom</s:label>
    <s:textfield name="lastName" id="lastName" cssClass="form-control" theme="simple" maxlength="30" value="%{user.lastName}"/>
    <br>
    <div class="panel panel-default">
        <div class="panel-heading">Adresse postale (pour le prêt de topos)</div>
        <div class="panel-body">
            <s:label for="road" theme="simple">Numéro et nom de rue</s:label>
            <s:textfield name="road" id="road" cssClass="form-control" theme="simple" maxlength="30" value="%{user.road}"/>
            <br>
            <s:label for="postalCode" theme="simple">Code postal</s:label>
            <s:textfield name="postalCode" id="postalCode" cssClass="form-control" theme="simple" maxlength="30" value="%{user.postalCode}"/>
            <br>
            <s:label for="city" theme="simple">Ville</s:label>
            <s:textfield name="city" id="city" cssClass="form-control" theme="simple" maxlength="30" value="%{user.city}"/>
            <br>
            <s:label for="country" theme="simple">Pays</s:label>
            <s:textfield name="country" id="country" cssClass="form-control" theme="simple" maxlength="30" value="%{user.country}"/>
        </div>
    </div>
    <s:label for="tel" theme="simple">Téléphone</s:label>
    <s:textfield name="tel" id="tel" cssClass="form-control" theme="simple" maxlength="30" value="%{user.tel}"/>
    <hr/>
    <s:if test="hasActionErrors()">
        <div class="alert alert-info" role="alert">
            <s:actionerror/>
        </div>
    </s:if>

    <input type="button" id="submitComment" class="btn btn-primary" value="Mettre à jour les informations >>" onclick="updateUserInfos()">

<script type="application/javascript">
    function updateUserInfos() {
        var email = $("#email").val();
        var firstName = $("#firstName").val();
        var lastName = $("#lastName").val();
        var road = $("#road").val();
        var postalCode = $("#postalCode").val();
        var city = $("#city").val();
        var country = $("#country").val();
        var tel = $("#tel").val();
        $.ajax({
            type: "POST",
            url: "<s:url action="updateAjaxUserInfos"/>",
            data: "email=" + email + "&firstName=" + firstName + "&lastName=" + lastName +
                    "&road=" + road + "&postalCode=" + postalCode + "&city=" + city +
                    "&country=" + country + "&tel=" + tel,
            dataType: "json",
            success: function (data) {
                for (var key in data){
                    console.log(key, data[key]);
                }
                $("#updateModal").modal();
            }
        });
    }
</script>