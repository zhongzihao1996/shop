<%@ page import="service.CSK.ShopInfoService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <title>滨江东路商城</title>
    <style>
        *{
            margin:0px;
            padding:0px;
            list-style:none;
        }
        .top{
            height:40px;
            background-color: #333;
        }

        .menu{
            width:605px;
            height:40px;
            margin-left:100px;
            float:left;
        }
        .menu a{
            display:block;
            float:left;
            margin-left:20px;
            color:#FFFFFF;
            font-size:16px;
            text-decoration: none;
            margin-top:12px;
        }

        .menu a:first-child{
            border:0px;
            margin-right:15px;
            font-size:20px;
            margin-top:10px;
        }

        .menu a:hover{
            color:#c0c0c0;
        }



        .top-cart{
            display:block;
            width:160px;
            height:40px;
            background-color: #424242;
            float:right;
            margin-right:20px;
            text-align:center;
            line-height:40px;
            color:#b0b0b0;
            font-size: 16px;
            text-decoration: none;
        }
        .top-cart img{
            vertical-align: -3px;
        }

        .top-cart span:hover{
            color:#f0f0f0;
        }
        .sub-menu{
            height:40px;
            float:right;
            margin-right:30px;
        }

        .sub-menu a{
            display:block;
            float:left;
            color:#b0b0b0;
            font-size:16px;
            text-decoration:none;
            margin-right:10px;
            margin-top:12px;
            padding-right: 15px;
        }
        .sub-menu a:first-child{
            border:0px;
        }

        .sub-menu a:last-child{
            margin-left: 20px;
            border-right:0px solid #b0b0b0;
        }

        .sub-menu a:hover{
            color:#c0c0c0;
        }

        .sub-menu .username{
            color: blanchedalmond;
        }

        .sub-menu .del{
            color: red;
            opacity: 0.5;
        }

    </style>
</head>
<div class="top">
    <div class="menu">
        <%
            ShopInfoService si = new ShopInfoService();
            String shopName = si.get().getString("name");
        %>
        <a href="index.jsp"><%=shopName%>
        </a>
        <a href="<%=request.getContextPath()%>/search?page=1&name=衣" target="_blank">衣服专区</a>
        <a href=<%=request.getContextPath()%>/search?page=1&name=鞋 target="_blank">鞋子专区</a>
        <a href=<%=request.getContextPath()%>/search?page=1&name=裤 target="_blank">裤子专区</a>
        <a href=<%=request.getContextPath()%>/search?page=1&name=衬衫 target="_blank">衬衫专区</a>
    </div>

    <%
        if (request.getSession().getAttribute("username") != null && request.getSession().getAttribute("username") != "") {

    %>
    <a class="top-cart" href="cart">
        <span>购物车</span>
        <i><img src="img/gouwuche.png"></i>
    </a>
    <%
    }

    %>

    <div class="sub-menu">
        <%
            if (request.getSession().getAttribute("username") != null && request.getSession().getAttribute("username") != "") {

        %>
        <a href="#" class="username">${username}</a>
        <a href="#">:欢迎您回来</a>
        <a href="RemoveUserServlet" style="margin-left: 0" class="del">注销</a>
        <a href="cart/#/order">订单中心</a>
        <%
        } else {

        %>
        <a href="register.html">注册</a>
        <a href="login.jsp">登录</a>
        <%
            }
        %>
    </div>

</div>
