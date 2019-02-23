<%@ page import="model.Stock" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="service.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>My Stock</title>
</head>
<body>
<%
	String store_id=session.getAttribute("storeid").toString();
	
	List<Stock>all=Factory.getIEmpDAOInstance().findStockByStore_id(store_id,request.getParameter("shoes_id"));
	Iterator<Stock> iter=all.iterator();
	%>
	<center>
	<table class="table table-striped">
	<thead>
	<h2> My Stock </h2>
	<br></br>
	<tr>
	<td>Shoes ID</td>
	<td>Store ID</td>
	<td>Size</td>
	<td>Color</td>
	<td>Amount</td>
	<td>Update</td>
	
	</tr>
	</thead>
	<tbody>
	<%
	while(iter.hasNext()){
		Stock stock=iter.next();
		%>
	<tr>
	<td><%=stock.getShoes_id() %></td>
	<td><%=stock.getSeller_id() %></td>
	<td><%=stock.getSize() %></td>
	<td><%=stock.getColor() %></td>
	<td><%=stock.getAmount() %></td>
	<td><a href="./shoes_update.jsp?shoes_id=<%=stock.getShoes_id() %>&store_id=<%=stock.getSeller_id() %>&size=<%=stock.getSize() %>&color=<%=stock.getColor() %>&amount=<%=stock.getAmount() %>" name="reg" class="btn btn-xs btn-primary" >Update</a></td>
	</tr>
	<%
		}
	%>
	</tbody>
	</table>
	</center>
</body>
</html>
