<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="varRegion" value="region"/>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right ">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"
               role="button" aria-haspopup="true" aria-expanded="false" id="dp-btn">
                Liste des sites présents dans la région <s:property value="#varRegion.name"/>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <s:iterator value="siteList">
                    <s:url action="site" var="urlSite">
                        <s:param name="regionId"><s:property value="regionId"/></s:param>
                        <s:param name="siteId"><s:property value="id"/></s:param>
                    </s:url>
                    <li>
                        <s:a href="%{urlSite}"><s:property value="name"/> (<s:property value="department"/>)</s:a>
                    </li>
                </s:iterator>
            </ul>
        </li>
    </ul>
</div>
<script type="application/javascript">$("#dp-btn").dropdown('toggle')</script>
