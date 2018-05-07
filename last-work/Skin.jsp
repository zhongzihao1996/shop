<%--
  Created by IntelliJ IDEA.
  User: zzm
  Date: 2017/5/22
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

</body>
<script>
    window.onload=function(){
        var bol = <%=request.getAttribute("bol")%>;
        var id = <%=request.getAttribute("id")%>;
        var number = <%=request.getAttribute("number")%>;
        if(!bol){
            alert("请登录");
            location.href="<%=request.getContextPath()%>/login.jsp";
        }
        else{
            alert("加入购物车成功");

            location.href="<%=request.getContextPath()%>/clothinfo?id="+id;

        }
    };




</script>
</html>
