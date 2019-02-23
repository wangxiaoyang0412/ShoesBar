<%@ page import="model.Shoes" %>
<%@ page import="java.util.*" %>
<%@ page import="util.Factory" %>
<%@ page import="service.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/menu_login_in.jsp" />
<div class="container-fluid" id="mainContent">
<div class="row">
<h2 style="margin-left:60px">Shoes Bar</h2>
<% 
if(!request.getAttribute("shoes").equals("no")){
List<Shoes> all = (List<Shoes>)request.getAttribute("shoes");
Iterator<Shoes> iter=all.iterator();
while(iter.hasNext())
{
	Shoes shoe=iter.next();
%>
<div class="col-lg-3" style="margin-top:30px ;border:1px dotted #337ab7">
  <h4><font face="verdana"><%=shoe.getBrand() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=shoe.getStyle() %></font></h4>
  <div class="card" style="width:300px;">
    <img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">$<%=shoe.getPrice() %><span style="margin-left:100px"></span><%=shoe.getName() %></h4>
      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
      <a href="./shoes_detail.jsp?shoes_id=<%=shoe.getShoes_id() %>" class="btn btn-primary">See Profile</a>
    </div>
  </div>
  </div>
  
 <%} }else{%><h4>No matched shoes, please try other search</h4>
<%  }%>
  </div>
  <ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <li class="active" id="page1"><a >1</a></li>
    <li id="page2"><a href="#">2</a></li>
    <li><a href="#" id="page3">3</a></li>
    <li><a href="#" id="page4">4</a></li>
    <li><a href="#" id="page5">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>
</div>
<jsp:include page="/bottom.jsp" />
</body>
</html>