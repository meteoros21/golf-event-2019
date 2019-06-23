<%--
  Created by IntelliJ IDEA.
  User: parkseongho
  Date: 2019-06-23
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>로그인</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<div id="app">
    <div class="container">
        <div class="login-container">
            <form name="login-form" id="login_frm" method="post" autocomplete="off" action="/login">
                <h2>Welcome to Game management</h2>
                <input type="text" name="userId" placeholder="User ID">
                <input type="password" name="passwd" placeholder="Password" style="border-top:none">
                <button type="submit" style="">Sign in</button>
                <%--<div style="width: 100%; text-align: center; margin-top: 10px">--%>
                    <%--<a href="#">forgot my password</a> |--%>
                    <%--<a href="#">sign up</a>--%>
                <%--</div>--%>
                <p style="width: 100%; text-align: right; margin-top: 1.5em; color: #3c3c3c">한국실업(미디아마)골프연맹</p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
