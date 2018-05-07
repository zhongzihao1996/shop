<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="service.CSK.GoodsService" %>
<%--
  Created by IntelliJ IDEA.
  User: zzm
  Date: 2017/5/22
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
  <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <script src="js/jquery-1.10.2.min.js"></script>
  <style>
    .money{
      float: right;
      margin-right: 200px;
    }
    .money font{
      margin-left: 40px;
    }
    .jiezhang{
      float: right;
      margin-right: 200px;
      margin-top: 50px;
      width: 50px;
      height: 40px;
    }

  </style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<h1>我的购物车</h1>

<%
  JSONArray shop = (JSONArray) request.getAttribute("message");
  JSONArray Goods = (JSONArray) request.getAttribute("goods");

%>

<div class="money">
  <h1 id="font">总价</h1>
  <h2 id="Allprice" ></h2>
</div>
<table class="table" id="mytable">
  <tr>
    <th>商品id </th>
    <th>图片</th>
    <th>单价</th>
    <th>商品数量</th>
    <th>操作</th>
  </tr>

</table>
<div class="jiezhang">
  <button class="btn btn-large" style="width: 80px;height: 60px;font-size: 30px"  type="button" onclick="jiezhang()">结账</button>
</div>
</body>



<script>

  var shops=<%=shop%>;
  var goods = <%=Goods%>;
  var username = '<%=session.getAttribute("username")%>';
  var id = new Array();
  var num = new Array();
  var url = new Array();
  var price = new Array();


    for(var i = 0;i<goods.length;i++){
      url[i] = goods[i].picture;
      price[i]=goods[i].price;
//    console.log(goods[i]);
    }
    judege(username);
    add(id,num);




  function jiezhang(){

    location.href="<%=request.getContextPath()%>/jiezhangServlet?id="+id+"&num="+num+"&url="+url+"&price="+price;
  }

  function judege(name){
      var aa = name;
//      console.log(aa=="null");
        var s = 0;
    for(var i=0;i<shops.length;i++){

      if(name==shops[i].username){
        id[s] = shops[i].shopId;
        num[s] = shops[i].num;
        s++;
      }

    }if(aa==="null"){
      alert("请登录");
      location.href="<%=request.getContextPath()%>/login.jsp";
    }

  }

  document.getElementById("Allprice").innerHTML = getprice()+"元";

//得到总价格
  function getprice(){
    var Allprice = 0;
    console.log(num[1])
    for(var i = 0;i< goods.length;i++){

      Allprice = num[i]*price[i]+Allprice;
    }
    return Allprice;
  }

  //表格
  function add(a,b){
    for(var i = 0;i< a.length;i++){

      row=document.createElement("tr");
      td0=document.createElement("td");
      td1=document.createElement("td");
      td4=document.createElement("td");
      td2=document.createElement("td");
      td3=document.createElement("td");

      td1.innerHTML ="<img src='"+url[i]+"' height=\"200\" width=\"200\"/ >";
      td0.appendChild(document.createTextNode(a[i]));
      td4.appendChild(document.createTextNode(price[i]));
      td2.appendChild(document.createTextNode(b[i]));
      td3.innerHTML ="<button type=\"button\" class=\"btn btn-primary\" onclick='deletes(this)'>删除</button>";

      row.appendChild(td0);
      row.appendChild(td1);
      row.appendChild(td4);
      row.appendChild(td2);
      row.appendChild(td3);
      document.getElementById("mytable").appendChild(row);
    }

  }
  function deletes(a){

    var id = a.parentNode.parentNode.firstChild. innerHTML;
      if (confirm("确定删除该商品吗？")) {
        location.href="<%=request.getContextPath()%>/CartDeleteServlet?id="+id+"&username="+username;
      }
      else {

      }



  }




</script>

</html>
