<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<%@ include file="include/head.jsp" %>
<body>
<%@ include file="include/header.jsp" %>
<h2>Section TOPO</h2>
<form action="topo_list.action">
    <select name="regionSelect">
        <s:iterator value="regionList">
            <option value=<s:property value="id"/>><s:property value="name"/></option>
        </s:iterator>
    </select>
    <s:submit value="Sélectionner"/>
</form>
<s:iterator value="regionList">
    <li>- <s:property value="name"/></li>
</s:iterator>
</body>
</html>
