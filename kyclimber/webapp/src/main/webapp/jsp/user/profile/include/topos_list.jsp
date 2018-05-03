<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="col-sm-12">
    <br>
    <p>
        <span class="glyphicon glyphicon-th-list"></span>
        <b>Liste de mes topos enregistrés sur l'application</b>
        <button id="btnAddTopo" class="btn btn-primary pull-right" onclick="showTopoForm(true, 'new')">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            Ajouter un nouveau topo
        </button>
    </p>
    <br>
    <div class="panel-group" id="accordion">
        <s:iterator value="topoList" status="topo">
            <s:if test="#session.user.id == user.id">
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
                            <th>Disponible</th>
                            <th class="text-center">Prêté</th>
                            <th>Modifier</th>
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
                            <td id="available<s:property value="id"/>" class="text-center">
                                <s:if test="available==true">
                                    <span id="topoSpanAvailable<s:property value="id"/>"
                                          class="glyphicon glyphicon-ok"
                                          aria-hidden="true"
                                          available="true">
                                    </span>
                                </s:if>
                                <s:else>
                                    <span id="topoSpanAvailable<s:property value="id"/>"
                                          class="glyphicon glyphicon-remove"
                                          aria-hidden="true"
                                          available="false">
                                    </span>
                                </s:else>
                            </td>
                            <td id="lent<s:property value="id"/>" class="text-center">
                                <s:if test="lentToUser!=null">
                                    <span class="glyphicon glyphicon-ok"
                                          aria-hidden="true"
                                          lent="true">
                                    </span>
                                    <div id="userLent<s:property value="id"/>" hidden>
                                        <s:property value="lentToUser.id"/>
                                    </div>
                                </s:if>
                                <s:else>
                                    <span class="glyphicon glyphicon-remove"
                                          aria-hidden="true"
                                          lent="false">
                                    </span>
                                    <div id="userLent<s:property value="id"/>" hidden></div>
                                </s:else>
                            </td>
                            <td class="text-center">
                                <button type="button"
                                        class="btn btn-primary"
                                        onclick="editTopo(<s:property value="id"/>,<s:property value="user.id"/>)">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                </button>
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
