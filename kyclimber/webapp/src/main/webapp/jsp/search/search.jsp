<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="fr">
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/header.jsp" %>
<br>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title text-center">RECHERCHE</h3>
    </div>
    <div class="panel-body text-center">
        <p>Saisir les mots-clés de votre recherche dans le champs texte ci-dessous.</p>
        <p>Vous pouvez affiner votre recherche en sélectionnant les différentes options.</p>
        <div class="row" style="margin:6px;">
        <form id="formCustomSearch" method="post">
            <div class="col-md-12 panel panel-default">
                <div class="panel-body">
                    <div class="col-md-2"></div>
                    <div class="col-md-4 text-right">
                        <label class="form-control">
                            Rechercher un site d'escalade :
                            <input type="radio" name="selectedSearchOption" value="Rechercher un site d'escalade" checked>
                        </label>
                        <label class="form-control">
                            Rechercher un topo :
                            <input type="radio" name="selectedSearchOption" value="Rechercher un topo">
                        </label>
                        <label class="form-control">
                            Rechercher un utilisateur :
                            <input type="radio" name="selectedSearchOption" value="Rechercher un utilisateur">
                        </label>
                    </div>
                    <div class="col-md-4 text-center">
                        <br>
                        <input type="text" name="keywords" id="keyword" class="form-control">
                        <br>
                        <button type="button" class="btn btn-primary" id="btnCustomSearchSubmit">
                            <span class="glyphicon glyphicon-search"></span>
                            Rechercher
                        </button>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </form>
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
            <s:if test="usersSearchedList.size>0">
                <div class="row">
                    <s:iterator value="usersSearchedList">
                        <div class="col-md-2">
                            <div class="thumbnail">
                                <img src="<s:property value="avatar.url"/> " alt="avatar">
                                <div class="caption text-center">
                                    <h3><s:property value="firstName"/></h3>
                                    <p>
                                        <a href="mailto:<s:property value="email"/>" class="btn btn-primary" role="button">
                                            <span class="glyphicon glyphicon-envelope"></span>
                                            Contacter
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <s:else>
                <p>Aucun utilisateur trouvé, merci de réitérer votre recherche avec un autre mot-clé</p>
            </s:else>
        </s:if>
        <s:elseif test="sitesSearchedList!=null">
            <s:if test="sitesSearchedList.size>0">
                <div class="row">
                    <s:iterator value="sitesSearchedList">
                        <div class="col-md-2">
                            <div class="thumbnail">
                                <img src="<s:property value="picture"/> " alt="image">
                                <div class="caption text-center">
                                    <h3><s:property value="name"/><br>
                                    <small><s:property value="region.name"/></small></h3>
                                    <p>
                                        <a href="site.action?regionId=<s:property value="region.id"/>&siteId=<s:property value="id"/>"
                                           class="btn btn-primary" role="button">
                                            <span class="glyphicon glyphicon-flag"></span>
                                            Accéder
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </s:iterator>
                </div>
            </s:if>
            <s:else>
                <p>Aucun site d'escalade trouvé, merci de réitérer votre recherche avec un autre mot-clé</p>
            </s:else>
        </s:elseif>
    </div>
</div>
</body>
</html>
