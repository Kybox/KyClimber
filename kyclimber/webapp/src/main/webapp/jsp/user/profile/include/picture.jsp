<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Sélectionnez un avatar pour votre profil</h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-6" id="slider-thumbs">
                <!-- Bottom switcher of slider -->
                <ul class="hide-bullets" style="list-style:none;margin-left: -40px;margin-top:20px;">
                    <s:iterator value="avatarList">
                    <li class="col-sm-3">
                        <s:set var="varId" value="%{id-1}"/>
                        <a class="thumbnail" id="carousel-selector-<s:property value="#varId"/>">
                            <img src="<s:property value="url"/>">
                        </a>
                    </li>
                    </s:iterator>
                </ul>
            </div>
            <div class="col-sm-6">
                <div class="col-xs-12" id="slider">
                    <!-- Top part of the slider -->
                    <div class="row">
                        <div class="col-sm-12" id="carousel-bounding-box">
                            <div class="carousel slide" id="myCarousel">
                                <!-- Carousel items -->
                                <div class="carousel-inner">
                                    <s:iterator value="avatarList">
                                        <s:set var="varUrl" value="url"/>
                                        <s:set var="varId" value="%{id-1}"/>
                                        <s:if test="%{#session.user.avatar==#varUrl}">
                                            <div class="active item" data-slide-number="<s:property value="varId"/>">
                                                <img src="<s:property value="url"/>" style="width: 100%;">
                                            </div>
                                        </s:if>
                                        <s:else>
                                            <div class="item" data-slide-number="<s:property value="varId"/>">
                                                <img src="<s:property value="url"/>" style="width: 100%;">
                                               </div>
                                        </s:else>
                                    </s:iterator>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <br>
                    <br>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <button type="submit" class="btn btn-primary center-block">Mettre à jour mon avatar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>