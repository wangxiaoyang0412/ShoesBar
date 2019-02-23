<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="service.*" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>For order deliver</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	  #center
		{
	    text-align:center; 
		}	
  </style>
</head>

<body>

<div class="panel panel-info">
	<div id=center class="panel-heading">
		<h3 class="panel-title" >Attention</h3>
	</div>
	<div id=center class="panel-body">
		Item Have been delivered
		<a class="btn btn-default" href="http://localhost:8080/dbmanagement/Store_W_delivere.jsp" role="button" >Back</a>
	</div>
</div>
 <%String orderid=request.getParameter("id"); %>
     <p><%=orderid %></p>
	 <% Factory.getIEmpDAOInstance().update_SellerOrders(orderid);%>
</body>
</html>







