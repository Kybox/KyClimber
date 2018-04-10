<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<h3><span class="label label-info" >Commentaires</span></h3>
<br>
<s:iterator value="commentList">
    <div class="media">
        <div class="media-left">
            <a href="#">
                <img class="media-object" src="http://0.gravatar.com/avatar/?s=64&d=mm&r=g" alt="User">
            </a>
        </div>
        <div class="media-body">
            <s:set var="varUser" value="user"/>
            <h4 class="media-heading">
                <s:property value="#varUser.firstName"/> -
                <s:property value="date"/>
            </h4>
            <p><s:property value="post"/></p>
        </div>
    </div>
    <br>
</s:iterator>

