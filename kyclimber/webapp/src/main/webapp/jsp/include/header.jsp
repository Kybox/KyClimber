<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
    <article>
        <header>
            <nav>
                [ <s:a action="home">Accueil</s:a> ] -
                [ <s:a action="topo_region">Topo</s:a> ] -
                [ <s:a action="user">User</s:a> ] -
                <s:if test="#session.user">
                    Utilisateur connecté :
                    <s:property value="#session.user.firstName"/>
                    <s:a action="logout">Déconnexion</s:a>
                </s:if>
                <s:else>
                    [ <s:a action="login">Connexion</s:a> / <s:a action="register">Inscription</s:a> ]
                </s:else>
            </nav>
        </header>
    </article>
<s:actionerror/>
<s:actionmessage/>