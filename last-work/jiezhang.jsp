<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%--
  Created by IntelliJ IDEA.
  User: zzm
  Date: 2017/5/29
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <style>
    .fukuang{
      float: right;
      margin-right: 150px;
    }
  </style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<h1>结账</h1>
<div class="table-responsive">
  <table class="table">
    <tr>
      <th>商品id</th>
      <th>商品数量</th>
      <th>商品图片</th>
      <th>商品价格</th>
    </th>
    <%
      JSONArray adress = (JSONArray) request.getAttribute("adress");
      String[]id = (String[])request.getAttribute("id");
      String[]num = (String[])request.getAttribute("num");
      String[]price = (String[])request.getAttribute("price");
      String[]picture = (String[])request.getAttribute("picture");
      for (int i = 0;i<id.length;i++){
    %>
    <tr>
      <td><%=id[i]%></td>
      <td><%=num[i]%></td>
      <td><img src="<%=picture[i]%>" width="50px" height="50px" /></td>
      <td><%=price[i]%></td>
    </tr>
    <%}%>
  </table>

    <div><h1 id="Allprice"></h1></div>
    <div>
      <h1>收货地址：</h1>
      <input type="text"  id="address1" value=">"/>
    </div>
  <div class="fukuang">
    <button class="btn btn-large" style="width: 80px;height: 60px;font-size: 30px"  type="button" onclick="fukuang()">结账</button>
  </div>
</div>

</body>
<script>

  document.getElementById("Allprice").innerHTML = "总价："+getprice()+"元";
  function getprice(){

    <%
        int Allprice = 0;
        for (int i = 0;i<id.length;i++){
          Allprice = Integer.parseInt(price[i])*Integer.parseInt(num[i])+Allprice;
        }
    %>
      var Allprice = <%=Allprice%>
    return Allprice;
  }
  var address = <%=adress%>
  document.getElementById("address1").value = address[1].address;
  function fukuang(){
    alert("付款啦");
    //具体操作
  }
</script>
</html>
