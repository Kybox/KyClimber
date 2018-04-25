<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="panel panel-default" id="topoDetails" hidden>
    <div class="panel-heading">
        <b>Description du topo</b>
    </div>
    <div class="panel-body">
        <div class="row">
        <aside class="col-sm-3">
            <div>
                <img src="" alt="" id="topoDetailsCover" style="background-color:#000;width:170px;height:200px;">
            </div>
            <div>
                <ul class="list-group text-center">
                    <li class="list-group-item">Diponible :</li>
                    <li class="list-group-item">
                        <button class="btn btn-primary" id="topoDetailsBtnEmail">
                            <span class="glyphicon glyphicon-envelope"></span>
                            <span id="topoDetailsUserEmail" style="margin-left:6px;"></span>
                        </button>
                    </li>
                </ul>
            </div>
        </aside>
        <div class="col-sm-9">
            <div><h4 id="topoDetailsName"></h4></div>
            <div><h5 id="topoDetailsPublisher"></h5></div>
            <div id="topoDetailsSite"></div><br>
            <div id="topoDetailsDescription"></div>
        </div>
        </div>
    </div>
</div>
