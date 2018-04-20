<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="topoForm" class="col-sm-12" topoid="new" hidden>
    <form id="formTopo">
        <input type="hidden" id="topoId" name="topoId" value="">
        <input type="hidden" id="topoUserId" name="topoUserId" value="">
        <div class="col-sm-6" style="margin-bottom:20px;">
            <div>
                <label for="txtName">Titre du topo :</label>
                <input type="text" name="topoName" id="txtName" class="form-control" required>
            </div>
            <br>
            <div>
                <label for="txtDescription">Description du topo :</label>
                <input type="text" name="topoDescription" id="txtDescription" class="form-control" required>
            </div>
            <br>
            <div>
                <label for="txtEdition">Edition du topo :</label>
                <input type="text" name="topoPublisher" id="txtEdition" class="form-control" required>
            </div>
            <br>
            <div>
                <label for="txtCover">Lien vers l'image de couverture :</label>
                <input type="text" name="topoCover" id="txtCover" class="form-control" required>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="dropdown">
                <b style="margin-right:4px">Sélectionner une région : </b>
                <select id="topoRegionSelect" class="form-control" name="topoRegionId" required>
                    <option value="prompt" disabled selected>Liste des régions</option>
                    <s:iterator value="regionList">
                        <option value="<s:property value="id"/>"><s:property value="name"/></option>
                    </s:iterator>
                </select>
            </div>
            <br>
            <div>
                <b>Le topo est-il disponible ?</b>
                <div class="radio">
                    <label style="margin-right:10px">
                        <input type="radio" name="topoAvailable" value="false" checked>Non
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </label>
                    <label>
                        <input type="radio" name="topoAvailable" value="true">Oui
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </label>
                </div>
            </div>
            <br>
            <div>
                <p><b>Avez-vous prêté votre topo et si oui, à quel utilisateur ?</b></p>
                <div class="radio" id="topoFormRadioGroup">
                    <label style="margin-right:10px">
                        <input type="radio" name="topoLent" value="false" checked>Non
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </label>
                    <label>
                        <input type="radio" name="topoLent" value="true" >Oui
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                    </label>
                </div>
                <div class="dropdown" id="divUserLent">
                    <select class="form-control" id="userLentSelect" name="topoUserLentId">
                        <option value="prompt" disabled selected>Liste des utilisateurs</option>
                        <s:iterator value="userList">
                            <option value="<s:property value="id"/>"><s:property value="firstName"/></option>
                        </s:iterator>
                    </select>
                </div>
            </div>
            <br>
            <div>
                <b>Dernière étape :</b>
                <br>
                <button type="submit" class="btn btn-primary" id="btnSubmitTopoForm" style="margin-top:6px;">
                    Enregistrer
                </button>
                <button type="button" class="btn btn-default" id="btnCancelTopoForm" style="margin-top:6px;margin-left:10px;">
                    Annuler
                </button>
            </div>
        </div>
    </form>
</div>
<hr>
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
                <td id="name<s:property value="id"/>" style="vertical-align:middle;"><s:property value="name"/></td>
                <td id="region<s:property value="id"/>"
                    regionid="<s:property value="region.id"/>"
                    style="vertical-align:middle;">
                    <s:property value="region.name"/>
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