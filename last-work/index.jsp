<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="service.CSK.GoodsService"%>
<%--
  Created by IntelliJ IDEA.
  User: CSK
  Date: 2017/4/27
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商城</title>
    <script src="js/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/index/slicebox.css"/>
    <link href="css/index/index.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/index/modernizr.custom.46884.js"></script>
    <script type="text/javascript" src="js/index/jquery.slicebox.js"></script>

</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

<div id="header">
    <div class="main">
        <div id="search">
            <input style="padding-left: 15px;" type="text" class="search-input" placeholder="请问您需要什么">
            <div class="search-right">
                <a href="#" class="search-img"><img src="img/search.png" width=100% height=100%></a>
            </div>
        </div>
    </div>
</div>

<div class="content clearfix">
    <div class="content-center">
        <div id="container">
            <div class="wrapper">
                <ul id="sb-slider" class="sb-slider">
                    <li>
                        <a href="<%=request.getContextPath()%>/search?page=1&name=衣" target="_blank"><img src="img/1.jpg" alt="image1"/></a>
                        <div class="sb-description">
                            <h3>气质女生必备，夏装精品上衣推荐</h3>
                        </div>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/search?page=1&name=鞋" target="_blank"><img src="img/2.jpg" alt="image2"/></a>
                        <div class="sb-description">
                            <h3>2017年新款夏季运动鞋，夏日的精品美鞋推荐</h3>
                        </div>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/search?page=1&name=裤" target="_blank"><img src="img/3.jpg" alt="image1"/></a>
                        <div class="sb-description">
                            <h3>来自韩国的裤子，精品中的精品</h3>
                        </div>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/search?page=1&name=衬衫" target="_blank"><img src="img/4.jpg" alt="image1"/></a>
                        <div class="sb-description">
                            <h3>优质推荐供应戈劳恪斯韩版时尚修身格子衬衫</h3>
                        </div>
                    </li>
                </ul>
                <div id="nav-arrows" class="nav-arrows">
                    <a href="#" class="next">&gt;</a>
                    <a href="#" class="prev">&lt;</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="bottom">
    <div class="bottom-tit">
        <h1>猜你喜欢</h1>
    </div>
    <div class="content-main">
        <div class="content-ul clearfix">
            <%
                GoodsService gs = new GoodsService();
                JSONArray shops = (JSONArray) gs.select("衣", null, null).get("shops");
                for (int i = 0; i < 8; i++) {
                    JSONObject shop = (JSONObject) shops.get(i);
            %>

            <div class="content-li ">
                <div class="content-li-pc">
                    <a href="<%=request.getContextPath()%>/clothinfo?id=<%=shop.get("id")%>" target="_blank"
                       class="">
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
            <%
                GoodsService gs1 = new GoodsService();
                JSONArray shops1 = (JSONArray) gs1.select("鞋", null, null).get("shops");
                for (int i = 0; i < 8; i++) {
                    JSONObject shop = (JSONObject) shops1.get(i);
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

    </div>
</div>

<script src="js/index/index.js"></script>

<script>
    $('.search-right').click(function () {
        if (!$('.search-input').val()) {
            $('.search-input').focus();
            return;
        }
        location.href = '<%=request.getContextPath()%>/search?page=1&name=' + $('.search-input').val();
    })
    $('.search-input').keydown(function (e) {
        if (e.keyCode == '13') {
            $('.search-right').click();
        }
    })

</script>
</body>
</html>
