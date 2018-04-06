<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
    <article>
        <header>
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">KyClimber</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><s:a action="home" class="btnNav">Accueil</s:a></li>
                        <li><s:a action="topo" class="btnNav">Sites</s:a></li>
                        <li><s:a action="user" class="btnNav">User</s:a></li>
                        <s:if test="#session.user">
                            <li><s:property value="#session.user.firstName"/> connecté</li>
                            <li><s:a action="logout" class="btnNav">Déconnexion</s:a></li>
                        </s:if>
                        <s:else>
                            <li><s:a action="login" class="btnNav">Connexion</s:a></li>
                            <li><s:a action="register" class="btnNav">Inscription</s:a></li>
                        </s:else>
                    </ul>
                </div>
            </nav>
        </header>
    </article>
<br><br>
<s:actionerror/>
<s:actionmessage/>