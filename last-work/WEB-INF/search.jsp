<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %><%--
  Created by IntelliJ IDEA.
  User: ZZH
  Date: 2017/5/13
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>衣服专区</title>
    <link href="css/search.css" type="text/css" rel="stylesheet">
    <link href="css/foundation.min.css" type="text/css" rel="stylesheet">
    <link href="css/page.css" type="text/css" rel="stylesheet">

    <script src="js/jquery.js"></script>
    <script src="js/foundation.min.js"></script>
    <script src="js/page.js"></script>
</head>
<body>
<div class="top">
    <div class="menu">
        <a href="index.jsp">滨江东路商城</a>
        <a href="<%=request.getContextPath()%>/search?page=1&name=衣" target="_blank">衣服专区</a>
        <a href=<%=request.getContextPath()%>/search?page=1&name=鞋 target="_blank">鞋子专区</a>
        <a href=<%=request.getContextPath()%>/search?page=1&name=裤 target="_blank">裤子专区</a>
        <a href=<%=request.getContextPath()%>/search?page=1&name=衬衫 target="_blank">衬衫专区</a>
    </div>

    <a class="top-cart" href="#">
        <span>购物车(0)</span>
        <i><img src="img/gouwuche.png"></i>
    </a>

    <div class="sub-menu">
        <%
            if (request.getSession().getAttribute("username") != null && request.getSession().getAttribute("username") != "") {

        %>
        <a href="#" class="username">${username}</a>
        <a href="#">:欢迎您回来</a>
        <a href="login.jsp" class="del">注销</a>
        <%
        } else {

        %>
        <a href="#">注册</a>
        <a href="login.jsp">登录</a>
        <%
            }
        %>
    </div>

</div>

<div id="header">
    <div class="main">
        <div id="search">
            <input type="text" class="search-input" placeholder="请问您需要什么衣服">
            <div class="search-right">
                <a href="#" class="search-img"><img src="img/search.png" width=100% height=100%></a>
            </div>
        </div>
    </div>
</div>

<div class="sort clearfix">
    <button type="button" class="button secondary">按價格升序</button>
    <button type="button" class="button secondary">按降價格序</button>
</div>

<div class="content clearfix">
    <div class="content-main">
        <div class="content-ul clearfix">
            <%
                JSONArray shops = (JSONArray) request.getAttribute("shops");
                for (int i = 0; i < shops.size(); i++) {
                    JSONObject shop = (JSONObject) shops.get(i);
            %>
            <div class="content-li ">
                <div class="content-li-pc">
                    <a href="<%=request.getContextPath()%>/clothinfo?id=<%=shop.get("id")%>" target="_blank" class="">
                        <img src="<%=shop.get("picture")%>">
                    </a>
                </div>
                <div class="content-li-text">
                    <p><%=shop.get("name")%>
                    </p>
                </div>
                <div class="content-li-text1">
                    <h2>￥<%=shop.get("price")%>
                    </h2>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="pageList">
            <ul class="clearfix page" maxshowpageitem="5" pagelistcount="40"  id="page"></ul>
        </div>
    </div>
</div>
<script>
    var currentPage =<%=request.getAttribute("page")%>;
    $("#page").initPage(${pageShopNum}*40,currentPage,function(page){
        if(page!=currentPage){
            location.href = "<%=request.getContextPath()%>/search?page="+page+"&name=${name}";
        }
    });

    $('.search-right').click(function(){
        location.href='<%=request.getContextPath()%>/search?page=1&name='+$('.search-input').val();
    })
    $('.search-input').keydown(function(e){
        if(e.keyCode=='13'){
            $('.search-right').click();
        }
    })

    $('.sort button').first().click(function(){
        location.href = "<%=request.getContextPath()%>/search?page=1&name=${name}&order=asc";
    });
    $('.sort button').last().click(function(){
        location.href = "<%=request.getContextPath()%>/search?page=1&name=${name}&order=desc";
    });

    var order="${order}";
    if(order=='asc'){
        $('.sort button').first().addClass('success').removeClass('secondary');
    }else if(order=='desc'){
        $('.sort button').last().addClass('success').removeClass('secondary');
    }
</script>
</body>
</html>
