<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/header.jsp" %>
<br>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Liste des topos répertoriés par les utilisateurs</h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Titre</th>
                <th>Edition</th>
                <th>Région</th>
                <th>Description</th>
                <th class="text-center">Dispo.</th>
                <th class="text-center">Propriétaire</th>
                <th class="text-center">Couverture</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="topoList">
                <tr>
                    <td><s:property value="name"/></td>
                    <td><s:property value="publisher"/></td>
                    <td><s:property value="site.region.name"/></td>
                    <td><s:property value="description"/></td>
                    <td class="text-center">
                        <s:if test="available==true">
                            <span class="glyphicon glyphicon-ok"></span>
                        </s:if>
                        <s:else>
                            <span class="glyphicon glyphicon-remove"></span>
                        </s:else>
                    </td>
                    <td class="text-center">
                        <button class="btn btn-primary">
                            <span class="glyphicon glyphicon-envelope" style="margin-right:6px;"></span>
                            <s:property value="user.firstName"/>
                        </button>
                    </td>
                    <td class="text-center">
                        <button class="btn btn-default">
                            Aperçu
                            <span class="glyphicon glyphicon-picture"></span>
                        </button>
                    </td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>