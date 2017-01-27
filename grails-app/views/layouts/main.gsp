<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><g:layoutTitle/></title>
    <g:layoutHead/>
    <r:layoutResources/>
</head>
<body>
    <header class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a href="/cimbidia" class="brand"><img alt="Logo_nav" id="topbar_logo" src="/cimbidia/images/logo.png">&nbsp;cimbidia</a>
            <ul class="nav">
                <li>test</li>
            </ul>

            <ul class="nav pull-right">
                <li><a href="/cimbidia/auth/login">Login</a></li>

            </ul>
        </div>
    </header>

    <div class="container">
        <g:layoutBody/>
    </div>
<r:layoutResources/>
</body>
</html>