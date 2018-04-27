<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="toposSearchedList.size>0">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Titre</th>
            <th>Edition</th>
            <th>Site d'escalade</th>
            <th>Région</th>
            <th>Disponible</th>
            <th>Détails</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="toposSearchedList">
            <tr>
                <td style="vertical-align: middle;"><s:property value="name"/></td>
                <td style="vertical-align: middle;"><s:property value="publisher"/></td>
                <td style="vertical-align: middle;">
                    <a href="site.action?regionId=<s:property value="site.region.id"/>&siteId=<s:property value="site.id"/>">
                        <s:property value="site.name"/>
                    </a>
                </td>
                <td style="vertical-align: middle;">
                    <s:property value="site.region.name"/>
                </td>
                <td style="vertical-align: middle;" class="text-center">
                    <s:if test="available!=true">
                        <span class="glyphicon glyphicon-remove"></span>
                    </s:if>
                    <s:else>
                        <span class="glyphicon glyphicon-ok"></span>
                    </s:else>
                </td>
                <td>
                    <button class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</s:if>
<s:else>
    <p>Aucun topo trouvé, merci de réitérer votre recherche avec un autre mot-clé</p>
</s:else>
