<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="service.*" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Ordered_management</title>
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  #h4TM
	{
	color:DarkSlateGray;
	background-color:AliceBlue;
	}	
  #center
   {
   	color:DarkSlateGray;
	background-color:AliceBlue;
    text-align:center;
   }		
  </style>
</head>
<body id="h4TM" >
    <div >
	<h4 id="center"  >Transaction management</h4> 
	<ul class="nav nav-tabs">
	    <li >
	        <a href="http://localhost:8080/dbmanagement/sellerhome.jsp">Home</a></li>
	    <li>
	        <a href="http://localhost:8080/dbmanagement/Store_total_order.jsp">Orders for the past three months</a></li>
	    <li>
	        <a href="http://localhost:8080/dbmanagement/Store_W_delivere.jsp">Waiting deliver</a></li>
	    <li  class="active" class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Delivered<span class="caret"></span></a>
	        <ul class="dropdown-menu">
	            <li>
	                <a href="http://localhost:8080/dbmanagement/Store_order_Confirmed.jsp">Confirmed</a></li>
	            <li>
	                <a href="http://localhost:8080/dbmanagement/Store_order_W_confirmed.jsp">Waiting confirm</a></li>
	            <li>
	                <a href="http://localhost:8080/dbmanagement/Store_order_Returned.jsp">Returned</a></li>
	            <li class="divider"></li>
	        </ul>
	    </li>
	</ul>
	</div>
	<h3>  </h3>
	<pre class="pre-scrollable">
      <div class="table-responsive", class="tab-pane fade in active">
		<table class="table">
        <caption class="text-center">Waiting confirmed by customer</caption>
		  <thead>
		    <tr>
		      <th>Order_id</th>
		      <th>user_id</th>
		      <th>Date</th>
		      <th>Item amount</th>
		      <th>Total price</th>
		      <th>Position</th>
		  </thead>
		  <tbody>
		  <% 
		    List<Orders> orderinfo=Factory.getIEmpDAOInstance().find_SellerOrders(session.getAttribute("storeid").toString());
        	Iterator<Orders> iter=orderinfo.iterator();
        	while(iter.hasNext()){
        		Orders order=iter.next();
		      if(order.getStatus()==3) {%>
			    <tr class="warning">
			      <td><%=order.getOrder_id()%></td>
			      <td><%=order.getUid()%></td>
			      <td><%=order.getTime() %></td>
			      <td><%=order.getItem_amount() %></td>
			      <td><%=order.getTotal_price() %></td>
			      <td>Waiting Confirmed</td>
			    </tr>
			    <%} %>
		  <%}  %>
		  </tbody>
		</table>
		</div> 
	</pre class="pre-scrollable">
 <address>
   <strong>If have problems, please contact administrator</strong><br>
    <a href="mailto:#">nuz2@pitt.edu</a> 
 </address>
	
</body>
</html>