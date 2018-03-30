<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Kybox
  Date: 30/03/2018
  Time: 08:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <s:iterator value="userList">
        <li>
            User : <s:property value="firstName"/> - <s:property value="lastName"/>
        </li>
    </s:iterator>
</body>
</html>
