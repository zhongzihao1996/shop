<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%--
  Created by IntelliJ IDEA.
  User: ZZH
  Date: 2017/5/14
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品详情</title>
    <link href="css/clotheinfo.css" type="text/css" rel="stylesheet">
    <link href="css/foundation.min.css" type="text/css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="js/clotheinfo.js" type="text/javascript"></script>
    <script src="js/foundation.min.js"></script>
</head>
<body>

<jsp:include page="top.jsp"></jsp:include>


<%
    JSONObject shop = (JSONObject) request.getAttribute("shop");
%>

<div class="info">
    <div class="info-pic">
        <a href="<%=shop.get("picture")%>" class="th radius" target="_blank" style="border: none;">
            <img src="<%=shop.get("picture")%>">
        </a>
    </div>
    <div class="info-right">
        <div class="info-text">
            <p><%=shop.get("name")%>
            </p>
        </div>
        <div class="info-price">
            <p>价格：￥<%=shop.get("price")%>
            </p>
        </div>
        <div class="info-act">
            <p class="info-act-text">数量:</p>
            <input type="button" value=" - " id="reduce"/>
            <input type="text" value="1" id="text"/>
            <input type="button" value=" + " id="plus"/>
        </div>
        <div class="info-add">
            <button type="button" class="button warning" onclick="toCart()">前往购物车</button>
            <button type="button" onclick="DropPage()">加入购物车</button>

            <%--<div id="Modal" class="reveal-modal  modal" data-reveal>--%>
                <%--<div class="modal-text">--%>
                    <%--<p>已成功加入购物车！</p>--%>
                <%--</div>--%>
                <%--<a class="close-reveal-modal ">&times;</a>--%>
            <%--</div>--%>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $(document).foundation();
    });
    function  DropPage(){
        var id = <%=shop.get("id")%>;
        var numbers = document.getElementById("text").value;
        var username = '<%=session.getAttribute("username")%>';

        <%--$.ajax({--%>
            <%--type:"Post",--%>
            <%--url:"<%=request.getContextPath()%>/CartServlet",--%>
            <%--data:{id:id,number:numbers,username:username},--%>
            <%--statusCode: {404: function() {--%>
                <%--alert('page not found'); }--%>
            <%--},--%>
            <%--success:function(data,textStatus){--%>

            <%--}--%>
        <%--});--%>

        location.href="<%=request.getContextPath()%>/CartServlet?id="+id+"&number="+numbers+"&username="+username;
    }
    function toCart(){
        location.href="<%=request.getContextPath()%>/cart"
    }
</script>


</body>
</html>
