<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理系统</title>

    <link rel="stylesheet" href="css/login/supersized.css">
    <link rel="stylesheet" href="css/login/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/login/supersized.3.2.7.min.js"></script>
    <script src="js/login/supersized-init.js"></script>
    <script src="js/login/scripts.js"></script>
</head>
<body>
<form action="<%=request.getContextPath()%>/LoginServlet" method="post">
    <div class="page-container">
        <h1>用户登录</h1>
        <input type="text" name="username" class="username" placeholder="请输入用户名">
        <input type="password" name="password" class="password" placeholder="请输入密码">
            <button type="submit">提交</button>
        <div class="reg">
            <a href="register.html"><span>点击进行注册</span></a>
        </div>
    </div>
</form>


</body>
</html>