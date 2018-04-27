<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="panel panel-default" id="topoDetails" hidden>
    <div class="panel-heading">
        <b>Description du topo</b>
    </div>
    <div class="panel-body">
        <div class="row">
            <aside class="col-sm-3">
                <div>
                    <s:if test="topo!=null">
                        <img src="<s:property value="topo.cover"/>"
                             alt="cover"
                             id="topoDetailsCover"
                             class="img-responsive">
                    </s:if>
                    <s:else>
                        <img src="" alt="cover" id="topoDetailsCover" class="img-responsive">
                    </s:else>

                </div>
            </aside>
            <div class="col-sm-9">
                <div>
                    <h4 id="topoDetailsName">
                        <s:if test="topo!=null">
                            <s:property value="topo.name"/>
                        </s:if>
                    </h4>
                </div>
                <div>
                    <h5 id="topoDetailsPublisher">
                        <s:if test="topo!=null">
                            <s:property value="topo.publisher"/>
                        </s:if>
                    </h5>
                </div>
                <div>
                    Concerne le site d'escalade :
                    <a href="#" id="topoDetailsSite">
                        <s:if test="topo!=null">
                            <s:property value="topo.site.name"/>
                        </s:if>
                    </a>
                </div>
                <br>
                <div id="topoDetailsDescription">
                    <s:if test="topo!=null">
                        <s:property value="topo.description"/>
                    </s:if>
                </div>
                <s:if test="#session.user">
                    <br>
                    <div class="panel panel-default text-center">
                        <div class="panel-body">
                            <button class="btn btn-primary">
                                <span class="glyphicon glyphicon-envelope" style="margin-right:6px;"></span>
                                Réserver le topo en contactant le propriétaire
                            </button>
                        </div>
                    </div>
                </s:if>
            </div>
        </div>
    </div>
</div>
