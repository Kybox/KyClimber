<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<%@ include file="include/head.jsp" %>
<body>
<%@ include file="include/header.jsp" %>
<h2>Découvrir un site d'escalade</h2>
<aside>
    <span id="regionList">Sélectionnez une région :</span>
    <s:iterator value="regionList">
        <li>
            <s:url action="topo" var="urlTag">
                <s:param name="regionId"><s:property value="id"/></s:param>
            </s:url>
            <s:a href="%{urlTag}"><s:property value="name"/></s:a>
        </li>
    </s:iterator>
</aside>
<article>
    <s:set var="varRegionId" value="regionId"/>
    <s:if test="%{#varRegionId==0}">
        Cliquez sur une région parmi la liste ci-contre afin d'afficher les différents site.
    </s:if>
    <s:else>
        <nav>
            <s:set var="varRegion" value="region"/>
            Liste des sites présents dans la région <s:property value="#varRegion.name"/> :
            <s:iterator value="siteList">
                <li>
                    - <s:property value="name"/>
                </li>
            </s:iterator>
        </nav>
    </s:else>
</article>
</body>
</html>
