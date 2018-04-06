<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<%@ include file="include/head.jsp" %>
<body>
<%@ include file="include/header.jsp" %>
<h3>Découvrir un site d'escalade</h3>
<aside>
    <div class="col-md-3">
        <h3><small>Sélectionnez une région :</small></h3>
        <div class="list-group">
            <s:iterator value="regionList">
                <s:url action="topo" var="urlTag">
                    <s:param name="regionId"><s:property value="id"/></s:param>
                </s:url>
                <s:a href="%{urlTag}">
                    <button type="button" class="list-group-item">
                        <s:property value="name"/>
                    </button>
                </s:a>
            </s:iterator>
        </div>
    </div>
</aside>
<article>
    <div class="col-md-9">
        <nav class="navbar navbar-default">
            <s:set var="varRegionId" value="regionId"/>
            <div class="container-fluid">
                <s:if test="%{#varRegionId==0}">
                    <div class="navbar-header">
                        <span class="navbar-brand">
                            Cliquez sur une région parmi la liste ci-contre afin d'afficher les différents site.
                        </span>
                    </div>
                </s:if>
                <s:else>
                    <s:set var="varRegion" value="region"/>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                   role="button" aria-haspopup="true" aria-expanded="false" id="dp-btn">
                                    Liste des sites présents dans la région <s:property value="#varRegion.name"/>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <s:iterator value="siteList">
                                        <li><s:a href="#"><s:property value="name"/></s:a></li>
                                    </s:iterator>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </s:else>
            </div>
        </nav>
    </div>
</article>
<script type="application/javascript">
    $("#dp-btn").dropdown('toggle')
</script>
</body>
</html>
