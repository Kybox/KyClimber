<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="topoForm" class="col-sm-12" topoid="new" hidden>

    <!-- [FORM] -->
    <form id="formTopo">

        <!-- [HIDDEN] -->
        <input type="hidden" id="topoId" name="topoId" value="">
        <input type="hidden" id="topoUserId" name="topoUserId" value="">

        <!-- [LEFT COLUMN] -->
        <div class="col-sm-6" style="margin-bottom:20px;">

            <!-- [TITLE] -->
            <div>
                <label for="txtName">Titre du topo :</label>
                <input type="text" name="topoName" id="txtName" class="form-control" required>
            </div>
            <br>

            <!-- [DESCRIPTION] -->
            <div>
                <label for="txtDescription">Description du topo :</label>
                <input type="text" name="topoDescription" id="txtDescription" class="form-control" required>
            </div>
            <br>

            <!-- [PUBLISHER] -->
            <div>
                <label for="txtEdition">Edition du topo :</label>
                <input type="text" name="topoPublisher" id="txtEdition" class="form-control" required>
            </div>
            <br>

            <!-- [COVER] -->
            <div>
                <label for="txtCover">Lien vers l'image de couverture :</label>
                <input type="text" name="topoCover" id="txtCover" class="form-control" required>
            </div>
        </div>

        <!-- [RIGHT COLUMN] -->
        <div class="col-sm-6">

            <!-- [SITE SELECT] -->
            <div class="dropdown">
                <b style="margin-right:4px">Sélectionner le site d'escalade : </b>
                <select id="topoSiteSelect" class="form-control" name="topoSiteId" required>
                    <option value="prompt" disabled selected>Liste des site d'escalade</option>
                    <s:iterator value="siteList">
                        <option value="<s:property value="id"/>"><s:property value="name"/></option>
                    </s:iterator>
                </select>
            </div>
            <br>

            <!-- [AVAILABLE RADIO] -->
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

            <!-- [LENT_TO RADIO] -->
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
