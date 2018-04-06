<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
    <article class="header">
        <header>
            <nav>
                <span id="title">KyClimber</span>
                <s:a action="home" class="btnNav">Accueil</s:a>
                <s:a action="topo" class="btnNav">Sites</s:a>
                <s:a action="user" class="btnNav">User</s:a>
                <s:if test="#session.user">
                    Utilisateur connecté :
                    <s:property value="#session.user.firstName"/>
                    <s:a action="logout" class="btnNav">Déconnexion</s:a>
                </s:if>
                <s:else>
                    <s:a action="login" class="btnNav">Connexion</s:a>
                    <s:a action="register" class="btnNav">Inscription</s:a>
                </s:else>
            </nav>
        </header>
    </article>
<s:actionerror/>
<s:actionmessage/>