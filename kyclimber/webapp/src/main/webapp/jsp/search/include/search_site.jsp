<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="sitesSearchedList.size>0">
    <div class="row">
        <s:iterator value="sitesSearchedList">
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <img src="<s:property value="picture"/> " alt="image" style="height:140px;width:248px;">
                    </div>
                    <div class="panel-body text-center">
                        <b><s:property value="name"/></b>
                        <br>
                        <s:property value="region.name"/>
                        <p>
                            Type : <s:property value="type"/>
                            <br>
                            Cotation : <s:property value="quotation"/>
                        </p>
                        <div>
                            <a href="site.action?regionId=<s:property value="region.id"/>&siteId=<s:property value="id"/>"
                               class="btn btn-primary" role="button">
                                <span class="glyphicon glyphicon-flag"></span>
                                Accéder
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </s:iterator>
    </div>
</s:if>
<s:else>
    <p>Aucun site d'escalade trouvé, merci de réitérer votre recherche avec un autre mot-clé</p>
</s:else>