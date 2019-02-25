<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:set var="actionName" value="%{com.opensymphony.xwork2.ActionContext.name}"/>
<head>
    <meta charset="utf-8">
    <title>KyClimber</title>
    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Rock+Salt" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Titillium+Web" rel="stylesheet">
    <link href="/KyClimber/css/style.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Bootstrap original theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Global JS Files -->
    <script src="/KyClimber/js/navbar.js" type="text/javascript"></script>

    <s:if test="%{#actionName=='profile'}">
        <!-- [PROFILE] -->
        <script src="/KyClimber/js/profil.js" type="text/javascript"></script>
        <script src="/KyClimber/js/profil/profil_avatar.js" type="text/javascript"></script>
        <script src="/KyClimber/js/profil/profil_comments.js" type="text/javascript"></script>
        <script src="/KyClimber/js/profil/profil_topo.js" type="text/javascript"></script>
        <script src="/KyClimber/js/profil/topo/topo_update.js" type="text/javascript"></script>
        <script src="/KyClimber/js/profil/profil_password.js" type="text/javascript"></script>
        <script src="/KyClimber/js/profil/profil_infos.js" type="text/javascript"></script>
        <script src="/KyClimber/js/md5.min.js" type="text/javascript"></script>
    </s:if>

    <s:elseif test="%{#actionName=='login'}">
        <!-- [LOGIN] -->
        <script src="/KyClimber/js/md5.min.js" type="text/javascript"></script>
        <script src="/KyClimber/js/login.js" type="text/javascript"></script>
    </s:elseif>

    <s:elseif test="%{#actionName=='signup'}">
        <!-- [SIGNUP] -->
        <script src="/KyClimber/js/md5.min.js" type="text/javascript"></script>
        <script src="/KyClimber/js/signup.js" type="text/javascript"></script>
    </s:elseif>

    <s:elseif test="%{#actionName=='search'}">
        <!-- [SEARCH] -->
        <script src="/KyClimber/js/search.js" type="text/javascript"></script>
    </s:elseif>

    <s:elseif test="%{#actionName=='topo'}">
        <!-- [TOPO] -->
        <script src="/KyClimber/js/topo.js" type="text/javascript"></script>
    </s:elseif>

    <s:elseif test="%{#actionName=='site'}">
        <!-- [SITE] -->
        <script src="/KyClimber/js/site.js" type="text/javascript"></script>
    </s:elseif>

</head>
