<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="topoForm" class="col-sm-12" hidden>
    <s:form/>
    <div class="col-sm-6" style="margin-bottom:20px;">
        <div>
            <s:label for="name" theme="simple" value="Titre du topo :"/>
            <s:textfield name="name" value="" cssClass="form-control" theme="simple"/>
        </div>
        <br>
        <div>
            <s:label for="description" theme="simple" value="Description du topo :"/>
            <s:textfield name="description" theme="simple" value="" cssClass="form-control"/>
        </div>
        <br>
        <div>
            <s:label for="edition" theme="simple" value="Edition du topo :"/>
            <s:textfield name="edition" theme="simple" value="" cssClass="form-control"/>
        </div>
        <br>
        <div>
            <s:label for="cover" theme="simple" value="Lien vers l'image de couverture :"/>
            <s:textfield name="cover" theme="simple" value="" cssClass="form-control"/>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="dropdown">
            <b style="margin-right:4px">Sélectionner une région : </b>
            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <span id="regionSelected" style="margin-right:10px;">Liste des régions</span><span class="caret"></span>
                </a>
            </button>
            <ul id="dropRegion" class="dropdown-menu" style="height: auto;max-height:260px;overflow-x:hidden;">
                <s:iterator value="regionList">
                    <li><a href="#"><s:property value="name"/></a></li>
                </s:iterator>
            </ul>
        </div>
        <br>
        <div>
            <b>Le topo est-il disponible ?</b>
            <div class="radio">
                <label style="margin-right:10px">
                    <input type="radio" name="editRadioAvailable" value="availableNo" checked>Non
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </label>
                <label>
                    <input type="radio" name="editRadioAvailable" value="availalbleYes">Oui
                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                </label>
            </div>
        </div>
        <br>
        <div>
            <p><b>Avez-vous prêté votre topo et si oui, à quel utilisateur ?</b></p>
            <div class="radio" id="topoFormRadioGroup">
                <label style="margin-right:10px">
                    <input type="radio" name="editRadioLent" value="lentNo" checked>Non
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </label>
                <label>
                    <input type="radio" name="editRadioLent" value="lentYes" >Oui
                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                </label>
            </div>
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle"
                        type="button"
                        id="btnDropdownUserLent"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="true" disabled>
                    <a aria-expanded="false"
                       aria-haspopup="true"
                       role="button"
                       data-toggle="dropdown"
                       class="dropdown-toggle" href="#">
                        <span id="lentUserSelected" style="margin-right:10px;">Liste des utilisateurs</span>
                        <span class="caret"></span>
                    </a>
                </button>
                <ul id="dropUser" class="dropdown-menu" style="height: auto;max-height:200px;overflow-x:hidden;">
                    <s:iterator value="userList">
                        <li><a href="#"><s:property value="firstName"/></a></li>
                    </s:iterator>
                </ul>
            </div>
        </div>
        <br>
        <div>
            <b>Dernière étape :</b>
            <br>
            <button type="submit" class="btn btn-primary" style="margin-top:6px;">
                Enregistrer
            </button>
            <button class="btn btn-default" style="margin-top:6px;margin-left:10px;" onclick="hideTopoForm()">
                Annuler
            </button>
        </div>
    </div>
</div>
<hr>
<div class="col-sm-12">
    <br>
    <p>
        <b>Liste de mes topos enregistrés sur l'application</b>
        <button id="btnAddTopo" class="btn btn-primary pull-right" onclick="showTopoForm()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            Ajouter un nouveau topo
        </button>
    </p>
    <br>
    <table class="table responsive nowrap">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Région</th>
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
                <td style="vertical-align:middle;"><s:property value="name"/></td>
                <td style="vertical-align:middle;"><s:property value="region.name"/></td>
                <td style="vertical-align:middle;"><s:property value="description"/></td>
                <td style="vertical-align:middle;"><s:property value="publisher"/></td>
                <td style="vertical-align:middle;">
                    <a href="#" class="thumbnail" data-toggle="popover" data-full="<s:property value="cover"/>">
                        Aperçu
                    </a>
                </td>
                <td class="text-center" style="vertical-align:middle;">
                    <s:if test="%{#available==true}">
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </s:if>
                    <s:else>
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </s:else>
                </td>
                <td class="text-center" style="vertical-align:middle;">
                    <s:if test="%{#lentToUser==null}">
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </s:if>
                    <s:else>
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </s:else>
                </td>
                <td class="text-center" style="vertical-align:middle;">
                    <button type="button" class="btn btn-primary" onclick="displayEditTopoModal(<s:property value="id"/>)">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </button>
                </td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</div>