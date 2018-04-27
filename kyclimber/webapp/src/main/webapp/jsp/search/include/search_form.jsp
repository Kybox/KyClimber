<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="formCustomSearch" method="post">
    <div class="col-md-12 panel panel-default">
        <div class="panel-body">
            <div class="col-md-2"></div>
            <div class="col-md-4 text-right">
                <label class="form-control">
                    Rechercher un site d'escalade :
                    <input type="radio" name="selectedSearchOption" id="searchOption1" value="Rechercher un site d'escalade" checked="true">
                </label>
                <label class="form-control">
                    Rechercher un topo :
                    <input type="radio" name="selectedSearchOption" id="searchOption2" value="Rechercher un topo" checked="false">
                </label>
                <label class="form-control">
                    Rechercher un utilisateur :
                    <input type="radio" name="selectedSearchOption" id="searchOption3" value="Rechercher un utilisateur" checked="false">
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
