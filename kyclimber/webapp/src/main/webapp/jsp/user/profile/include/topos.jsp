<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- [INCLUDE FORM] -->
<%@ include file="topos_form.jsp" %>
<hr>

<!-- [TOPO LIST] -->
<div class="col-sm-12">
    <br>
    <p>
        <b>Liste de mes topos enregistrés sur l'application</b>
        <button id="btnAddTopo" class="btn btn-primary pull-right" onclick="showTopoForm(true, 'new')">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            Ajouter un nouveau topo
        </button>
    </p>
    <br>
    <table class="table responsive nowrap">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Site</th>
                <th>Description</th>
                <th>Edition</th>
                <th>Couverture</th>
                <th>Disponible</th>
                <th>Prêté</th>
                <th>Modifier</th>
            </tr>
        </thead>
        <tbody>
        <s:iterator value="topoList">
            <tr>
                <td id="name<s:property value="id"/>" style="vertical-align:middle;"><s:property value="name"/></td>
                <td id="siteid" siteid="<s:property value="site.id"/>" style="vertical-align:middle;">
                    <s:property value="site.name"/>
                </td>
                <td id="description<s:property value="id"/>" style="vertical-align:middle;"><s:property value="description"/></td>
                <td id="puslisher<s:property value="id"/>" style="vertical-align:middle;"><s:property value="publisher"/></td>
                <td style="vertical-align:middle;">
                    <a href="#" id="cover<s:property value="id"/>" class="thumbnail" data-toggle="popover" data-full="<s:property value="cover"/>">
                        Aperçu
                    </a>
                </td>
                <td id="available<s:property value="id"/>" class="text-center" style="vertical-align:middle;">
                    <s:if test="available==true">
                        <span id="topoSpanAvailable<s:property value="id"/>" class="glyphicon glyphicon-ok" aria-hidden="true" available="true"></span>
                    </s:if>
                    <s:else>
                        <span id="topoSpanAvailable<s:property value="id"/>" class="glyphicon glyphicon-remove" aria-hidden="true" available="false"></span>
                    </s:else>
                </td>
                <td id="lent<s:property value="id"/>" class="text-center" style="vertical-align:middle;">
                    <s:set var="varLent" value="lentToUser"/>
                    <s:property value="lentToUser.firstName"/>
                    <s:if test="%{varLent==null}">1</s:if>
                    <s:if test="varLent==null">2</s:if>
                    <s:if test="#varLent==null">3</s:if>
                    <s:if test="%{lentToUser==null}">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true" lent="false"></span>
                    </s:if>
                    <s:else>
                        <span class="glyphicon glyphicon-ok" aria-hidden="true" lent="true"></span>
                        <div id="userLent" lentUserId="<s:property value="lentToUser.id"/>">
                        <s:a href="#"><s:property value="lentToUser.firstName"/></s:a>
                        </div>
                    </s:else>
                </td>
                <td class="text-center" style="vertical-align:middle;">
                    <button type="button"
                            class="btn btn-primary"
                            onclick="editTopo(<s:property value="id"/>, <s:property value="user.id"/>)">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </button>
                </td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>