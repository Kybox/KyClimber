<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/header.jsp" %>
<div class="alert alert-info">
    <span class="glyphicon glyphicon-map-marker" style="margin-right:10px;"></span>
    <b>DECOUVRIR UN SITE D'ESCALADE</b>
</div>
<h3></h3>
<aside>
    <div class="col-md-3">
        <h3><small>Sélectionnez une région :</small></h3>
        <div class="list-group">
            <s:iterator value="mapRegionList">
                <s:url action="site" var="urlRegion">
                    <s:param name="regionId"><s:property value="key"/></s:param>
                </s:url>
                <s:a href="%{urlRegion}">
                    <button type="button" class="list-group-item">
                        <s:property value="value[0]"/>
                        <span class="badge alert-info"><s:property value="value[1]"/></span>
                    </button>
                </s:a>
            </s:iterator>
        </div>
    </div>
</aside>
<article>
    <div class="col-md-9">
        <s:set var="varRegionId" value="regionId"/>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <s:if test="%{#varRegionId==0}">
                    <div class="navbar-header">
                        <span class="navbar-brand">
                            Cliquez sur une région parmi la liste ci-contre afin d'afficher les différents site.
                        </span>
                    </div>
                </s:if>
                <s:else>
                    <%@ include file="include/site_dropdown.jsp"%>
                </s:else>
            </div>
        </nav>
        <!-- Site view -->
        <%@ include file="include/site_details.jsp"%>
    </div>
</article>
</body>
</html>
