<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
    <article>
        <header>
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="navbar-header">
                    <button type="button"
                            class="navbar-toggle collapsed"
                            data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1"
                            aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">KyClimber</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><s:a action="index" class="btnNav">Accueil</s:a></li>
                        <li><s:a action="site" class="btnNav">Sites</s:a></li>
                        <li><s:a action="site" class="btnNav">Rechercher</s:a></li>
                        <s:if test="#session.user">
                            <li><s:a action="profile" class="btnNav">Mon profil</s:a></li>
                            <li>
                                <s:a action="logout" class="btnNav">
                                Déconnexion (<s:property value="#session.user.firstName"/>)
                                </s:a>
                            </li>
                        </s:if>
                        <s:else>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                       role="button" aria-haspopup="true" aria-expanded="false" id="dp-auth">
                                        Authentification
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <s:a action="login">
                                                <span class="glyphicon glyphicon-log-in"></span>
                                                Connexion
                                            </s:a>
                                        </li>
                                        <li role="separator" class="divider"></li>
                                        <li>
                                            <s:a action="signup">
                                                <span class="glyphicon glyphicon-user"></span>
                                                Inscription
                                            </s:a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </s:else>
                    </ul>
                </div>
            </nav>
        </header>
    </article>
<br><br>