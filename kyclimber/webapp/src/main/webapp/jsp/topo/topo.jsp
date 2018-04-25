<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<%@ include file="../include/head.jsp" %>
<body>
<%@ include file="../include/header.jsp" %>
<h4>Liste des topos enregistrés</h4>
<div class="col-md-12">
    <aside class="col-md-4">
        <h3><small>Sélectionnez une région puis un topo</small></h3>
        <%@ include file="include/topo_menu.jsp" %>
    </aside>
    <div class="col-md-8">
        <%@ include file="include/topo_details.jsp" %>
    </div>
</div>
</body>
</html>
