<%--
  Created by IntelliJ IDEA.
  User: ZZH
  Date: 2017/5/23
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录404</title>
</head>

<style>
    body{
        background-image: url("img/loginfailure.jpg");
    }
</style>
<body>
        
        <script>

            onload=function(){
                alert("登录失败");
                setTimeout(go, 1500);
            };
            function go(){
                location.href="login.jsp";
            }
        </script>

</html>
