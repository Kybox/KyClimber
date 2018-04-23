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
        <form>
            <div class="col-md-12 panel panel-default">
                <div class="panel-body">
                    <div class="col-md-2"></div>
                    <div class="col-md-4 text-right">
                        <label>Rechercher un site d'escalade : <input type="radio" name="searchOption"></label>
                        <label>Rechercher un topo : <input type="radio" name="searchOption"></label>
                        <label>Rechercher un utilisateur : <input type="radio" name="searchOption"></label>
                    </div>
                    <div class="col-md-4 text-center">
                        <input type="text" class="form-control">
                        <br>
                        <button type="submit" class="btn btn-primary">
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
<div>
    <p>Résultats de votre recherche :</p>
</div>
</body>
</html>
