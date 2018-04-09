<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="varSiteId" value="siteId"/>
<s:if test="%{#varRegionId!=0&&#varSiteId!=0}">
    <s:set var="varSite" value="site"/>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <s:property value="#varSite.name"/>
                <s:property value="#varSite.department"/>
                - Région <s:property value="#varRegion.name"/>
            </h3>
        </div>
        <div class="panel-body">
            <img src="<s:property value="#varSite.picture"/>" class="img-responsive" alt="Image">
            <br>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    Cotation : <s:property value="#varSite.quotation"/>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <s:property value="#varSite.description"/>
            <br>
            <br>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    Type
                                </h4>
                            </div>
                            <div class="panel-body">
                                <s:property value="#varSite.type"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    Orientation
                                </h4>
                            </div>
                            <div class="panel-body">
                                <s:property value="#varSite.orientation"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    Hauteur
                                </h4>
                            </div>
                            <div class="panel-body">
                                <s:property value="#varSite.height"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    Voies
                                </h4>
                            </div>
                            <div class="panel-body">
                                <s:property value="#varSite.route"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <h3><span class="label label-info" >Roche et escalade</span></h3>
            <br>
            <s:property value="#varSite.typeDescription"/>
            <br>
            <br>
            <h3><span class="label label-info" >Accès</span></h3>
            <br>
            <s:property value="#varSite.access"/>
            <br>
            <br>
            <h3><span class="label label-info" >Topos</span></h3>
            <br>
            <s:property value="#varSite.topo"/>
            <br>
            <s:set var="varMap" value="#varSite.map"/>
            <br>
            <h3><span class="label label-info" >Vue satellite</span></h3>
            <br>
            <div id="map-container-3" class="z-depth-1" style="height: 500px"></div>
            <br>
            <h3><span class="label label-info" >Commentaires</span></h3>
            <br>
        </div>
    </div>
</s:if>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDRhcMiI3JWmyW8CFcKE4ET09unMCOxxv8"></script>
<script type="application/javascript">
    function satellite_map() {
        var var_location = new google.maps.LatLng(<s:property value="varMap"/>);
        var var_mapoptions = {
            center: var_location,
            zoom: 14,
            mapTypeId: 'satellite'
        };
        var map = new google.maps.Map(document.getElementById("map-container-3"), var_mapoptions);
    }
    google.maps.event.addDomListener(window, 'load', satellite_map);
</script>