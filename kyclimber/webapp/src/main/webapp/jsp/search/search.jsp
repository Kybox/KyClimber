<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="fr">
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/header.jsp" %>
<div class="alert alert-info">
    <span class="glyphicon glyphicon-search" style="margin-right:10px;"></span>
    <b>EFFECTUER UNE RECHERCHE</b>
</div>
<script type="text/javascript">
    var selectedPreviousOption = "<s:property value="selectedSearchOption"/>";
</script>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title text-center">RECHERCHE</h3>
    </div>
    <div class="panel-body text-center">
        <p>Saisir les mots-clés de votre recherche dans le champs texte ci-dessous.</p>
        <p>Vous pouvez affiner votre recherche en sélectionnant les différentes options.</p>
        <div class="row" style="margin:6px;">
            <%@ include file="include/search_form.jsp" %>
        </div>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <s:if test="usersSearchedList!=null">
            <h3 class="panel-title">Liste des utilisateur correspondant à votre recherche</h3>
        </s:if>
        <s:else>
            <h3 class="panel-title">Résultats de recherche</h3>
        </s:else>
    </div>
    <div class="panel-body">
        <s:if test="usersSearchedList!=null">
            <%@ include file="include/search_user.jsp" %>
        </s:if>
        <s:elseif test="sitesSearchedList!=null">
            <%@ include file="include/search_site.jsp" %>
        </s:elseif>
        <s:elseif test="toposSearchedList!=null">
            <%@ include file="include/search_topo.jsp" %>
        </s:elseif>
    </div>
</div>
</body>
</html>
