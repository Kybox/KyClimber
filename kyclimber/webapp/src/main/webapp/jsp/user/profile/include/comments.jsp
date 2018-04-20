<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Liste de vos commentaires</h3>
    </div>
    <div class="panel-body">
        <div class=table-responsive>
            <table class="table nowrap table-hover">
                <thead>
                <tr>
                    <th>Date</th>
                    <th>Site</th>
                    <th>Commentaire</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="commentList">
                    <tr>
                        <td style="vertical-align:middle;"><s:property value="date"/></td>
                        <td style="vertical-align:middle;">
                            <a href="site.action?regionId=<s:property value="site.region.id"/>&siteId=<s:property value="site.id"/>">
                                <s:property value="site.name"/>
                            </a>
                        </td>
                        <td style="vertical-align:middle;"><s:property value="post"/></td>
                        <td style="vertical-align:middle;">
                            <button id="btnEditUserComment<s:property value="id"/>" class="btn btn-primary" style="margin-right:6px;">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                Editer
                            </button>
                            <button class="btn btn-primary">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                Supprimer
                            </button>
                        </td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
</div>
