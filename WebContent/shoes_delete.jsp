<%@ page import="model.Shoes" %>
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
<title>My Shoes</title>
</head>
<body>
<%
    Factory.getIEmpDAOInstance().delete_shoes(request.getParameter("shoes_id"));
	String keyWord=request.getParameter("kw");
	if(keyWord==null){
		keyWord="";
	}
	List<Shoes>all=Factory.getIEmpDAOInstance().findShoesByStore_id("chg108");
	Iterator<Shoes> iter=all.iterator();
	%>
	<center>
	<table class="table table-striped">
	<thead>
	<h2> My Shoes </h2>
	<br></br>
	<tr>
	<td>Shoes ID</td>
	<td>Name</td>
	<td>Brand</td>
	<td>Style</td>
	<td>Gender</td>
	<td>Price</td>
	<td>Stock</td>
	<td>Delete</td>
	</tr>
	</thead>
	<tbody>
	<%
	while(iter.hasNext()){
		Shoes shoe=iter.next();
		%>
	<tr>
	<td><%=shoe.getShoes_id() %></td>
	<td><%=shoe.getName() %></td>
	<td><%=shoe.getBrand() %></td>
	<td><%=shoe.getStyle() %></td>
	<td><%=shoe.getGender() %></td>
	<td><%=shoe.getPrice() %></td>
	<td><a href="./show_stock.jsp?shoes_id=<%=shoe.getShoes_id() %>&store_id=chg108" name="reg" class="btn btn-xs btn-primary" >Stock</a></td>
	<td><a href="./shoes_delete.jsp?shoes_id=<%=shoe.getShoes_id() %>&store_id=chg108" name="reg" class="btn btn-xs btn-primary" >Delete</a></td>
	</tr>
	<%
		}
	%>
	</tbody>
	</table>
        <!-- <br><a href="./show_stock.jsp" name="reg" class="btn btn-lg btn-primary" >My Stock</a></br> -->
	</center>
</body>
</html>