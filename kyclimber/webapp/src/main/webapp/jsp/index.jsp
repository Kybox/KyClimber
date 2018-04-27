<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="fr">
<%@ include file="include/head.jsp" %>
<body>
<%@include file="include/header.jsp" %>
<div class="alert alert-info">
    <span class="glyphicon glyphicon-home" style="margin-right:10px;"></span><b>ACCUEIL</b>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><span class="glyphicon glyphicon-fire"></span> Derniers sites d'escalade ajoutés</h3>
            </div>
            <div class="panel-body">
                <!-- Sites carousel -->
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <s:iterator value="siteList" status="rowStatus">
                            <li data-target="#myCarousel" data-slide-to="<s:property value="#rowStatus.index"/>"
                                <s:if test="#rowStatus.index==0">class="active"</s:if>></li>
                        </s:iterator>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <s:iterator value="siteList" status="rowStatus" var="varSite">
                            <div class="item <s:if test="#rowStatus.index==0">active</s:if>">
                                <a href="site.action?regionId=<s:property value="region.id"/>&siteId=<s:property value="id"/>">
                                <img src="<s:property value="picture"/>" alt="Image" style="width:100%;" class="img-thumbnail img-responsive">
                                <div class="carousel-caption">
                                    <h3 style="background-color:black;"><s:property value="name"/></h3>
                                    <span style="background-color:black;"> >>> <s:property value="region.name"/> <<< </span>
                                </div>
                                </a>
                            </div>
                        </s:iterator>
                    </div>
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <br>
                <i>Texte et images : grimper.com</i>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <span class="glyphicon glyphicon-fire"></span>
                    Derniers topos ajoutés
                </h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    <s:iterator value="topoList">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-xs-2 text-center">
                                    <a href="topo.action?topoId=<s:property value='id'/>">
                                        <img src="<s:property value="cover"/>" alt="cover"
                                        style="width:46px;height:60px;">
                                    </a>
                                </div>
                                <div class="col-xs-10">
                                    <a href="topo.action?topoId=<s:property value='id'/>">
                                        <b><s:property value="name"/></b><br>
                                    </a>
                                    Site d'escalade :
                                    <a href="site.action?regionId=<s:property value="site.region.id"/>&siteId=<s:property value="site.id"/>">
                                        <s:property value="site.name"/>
                                    </a><br>
                                    Région : <s:property value="site.region.name"/>
                                </div>
                            </div>
                        </li>
                    </s:iterator>
                </ul>
            </div>
        </div>
    </div>
</div>
<hr>
</body>
</html>