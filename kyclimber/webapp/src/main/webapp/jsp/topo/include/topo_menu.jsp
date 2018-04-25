<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="panel-group" id="accordion">
    <s:iterator value="topoMap" status="topoMap">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="%{#topoMap.index}"/>">
                        <s:property value="key.name"/>
                    </a>
                </h4>
            </div>
            <div id="collapse<s:property value="%{#topoMap.index}"/>" class="panel-collapse collapse">
                <div class="panel-body">
                    <s:iterator value="value" status="topo">
                        <span class="glyphicon glyphicon-minus"></span>
                        <a href="#" topoid="<s:property value="id"/>">
                            <s:property value="name"/>
                        </a>
                        <br>
                    </s:iterator>
                </div>
            </div>
        </div>
    </s:iterator>
</div>