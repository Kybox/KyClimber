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
            <h3 class="panel-title">
                Liste des utilisateur correspondant à votre recherche :
                <s:if test="usersSearchedList.size>0">
                    <s:property value="usersSearchedList.size"/>
                    <s:if test="usersSearchedList.size>1"> résultats</s:if>
                    <s:else> résultat</s:else>
                </s:if>
                <s:else>aucun résultat </s:else>
            </h3>
        </s:if>
        <s:elseif test="sitesSearchedList!=null">
            <h3 class="panel-title">
                Liste des sites d'escalade correspondant à votre recherche :
                <s:if test="sitesSearchedList.size>0">
                    <s:property value="sitesSearchedList.size"/>
                    <s:if test="sitesSearchedList.size>1"> résultats</s:if>
                    <s:else> résultat</s:else>
                </s:if>
                <s:else>aucun résultat </s:else>
            </h3>
        </s:elseif>
        <s:elseif test="toposSearchedList!=null">
            <h3 class="panel-title">
                Liste des topos correspondant à votre recherche :
                <s:if test="toposSearchedList.size>0">
                    <s:property value="toposSearchedList.size"/>
                    <s:if test="toposSearchedList.size>1"> résultats</s:if>
                    <s:else> résultat</s:else>
                </s:if>
                <s:else>aucun résultat </s:else>
            </h3>
        </s:elseif>
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
