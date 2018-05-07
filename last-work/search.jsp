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
    <meta charset="utf-8">
    <title>专区</title>
    <link href="css/search.css" type="text/css" rel="stylesheet">
    <link href="css/foundation.min.css" type="text/css" rel="stylesheet">
    <link href="css/page.css" type="text/css" rel="stylesheet">

    <script src="js/jquery.js"></script>
    <script src="js/foundation.min.js"></script>
    <script src="js/page.js"></script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>

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
