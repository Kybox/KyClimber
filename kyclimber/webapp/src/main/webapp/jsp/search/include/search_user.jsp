<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="usersSearchedList.size>0">
    <div class="row">
        <s:iterator value="usersSearchedList">
            <div class="col-md-2">
                <div class="thumbnail">
                    <img src="<s:property value="avatar.url"/> " alt="avatar">
                    <div class="caption text-center">
                        <h3><s:property value="firstName"/></h3>
                        <p>
                            <a href="mailto:<s:property value="email"/>" class="btn btn-primary" role="button">
                                <span class="glyphicon glyphicon-envelope"></span>
                                Contacter
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </s:iterator>
    </div>
</s:if>
<s:else>
    <p>Aucun utilisateur trouvé, merci de réitérer votre recherche avec un autre mot-clé</p>
</s:else>