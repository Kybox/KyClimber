<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="col-sm-12">
    <br>
    <p>
        <span class="glyphicon glyphicon-th-list"></span>
        <b>Liste des topos que vous avez emprunté</b>
    </p>
    <br>
    <div class="panel-group" id="accordion2">
        <s:iterator value="topoList" status="topo">
            <s:if test="#session.user.id == lentToUser.id">
            <div class="panel panel-default">
                <s:set var="topoIndex" value="%{#topo.index}"/>
                <div class="panel-heading">
                    <h4 id="topoTitle<s:property value="id"/>" class="panel-title">
                        <span class="glyphicon glyphicon-book"></span>
                        <a data-toggle="collapse" data-parent="#accordion" href="#topo<s:property value="#topoIndex"/>">
                            <s:property value="name"/>
                        </a>
                        <small id="topoPublisher<s:property value="id"/>"> - Edition : <s:property value="publisher"/></small>

                    </h4>
                </div>
                <s:if test="#topoIndex==0">
                    <s:set var="topoClass" value="%{'panel-collapse collapse in'}"/>
                </s:if>
                <s:else>
                    <s:set var="topoClass" value="%{'panel-collapse collapse'}"/>
                </s:else>
                <div id="topo<s:property value="#topoIndex"/>" class="panel-collapse collapse">
                    <table class="table responsive nowrap">
                        <thead>
                        <tr>
                            <th>Couverture</th>
                            <th>Description</th>
                            <th class="text-center">Site</th>
                            <th class="text-center text-nowrap">Emprunté à</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td id="name<s:property value="id"/>" hidden>
                                <s:property value="name"/>
                            </td>
                            <td id="puslisher<s:property value="id"/>" hidden>
                                <s:property value="publisher"/>
                            </td>
                            <td id="cover<s:property value="id"/>">
                                <img src="<s:property value="cover"/>" style="width:100px;">
                            </td>
                            <td id="description<s:property value="id"/>">
                                <s:property value="description"/>
                            </td>
                            <td id="site<s:property value="id"/>" siteid="<s:property value="site.id"/>"class="text-center">
                                <a href="site.action?regionId=<s:property value="site.region.id"/>&siteId=<s:property value="site.id"/>">
                                    <s:property value="site.name"/>
                                </a>
                            </td>
                            <td class="text-center">
                                <a href="mailto:<s:property value="lentToUser.email"/>">
                                    <button type="button" class="btn btn-default">
                                        <span class="glyphicon glyphicon-envelope" style="margin-right:6px;"></span>
                                        <s:property value="lentToUser.firstName"/>
                                    </button>
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            </s:if>
        </s:iterator>
    </div>
</div>
