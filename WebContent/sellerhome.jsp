<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="service.*" %>    
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title> 
<style>
  #h4TM
	{
	color:DarkSlateGray;
	background-color:#FAFAD2;
	}	
  #center
   {
   	color:DarkSlateGray;
	background-color:#FAFAD2;
    text-align:center;
   }
</style>
</head> 
<body id='h4TM' > 
 <div id="center">
    <div >
		<h4 id="center"  >Personal Center</h4> 
		<ul class="nav nav-tabs">
		    <li class="active">
		        <a href="./sellerhome.jsp">Home</a></li>
		    <li >
		        <a href="http://localhost:8080/dbmanagement/Store_total_order.jsp">Transaction management</a></li>
		    <li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Stock<span class="caret"></span></a>
		        <ul class="dropdown-menu">
		            <li>
		                <a href="./show_shoes.jsp">My shoes</a></li>
		            <li>
		                <a href="shoes_register.jsp">Insert Shoes</a></li>
		            
		            <li class="divider"></li>
		        </ul></li>
		    <li>
		        <a href="http://localhost:8080/dbmanagement/Store_profit.jsp">My profit</a></li>
		</ul>
	</div>
	 <div class="container-fluid">
		 <div class="row">
			 <div class="col-md-12" style="text-align:center;">
			  <h2>Hello <%=session.getAttribute("sellerid") %></h2>
			  <img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:150px;height:150px">
			  <div class="row">
			    <div class="table-responsive" class="tab-pane fade in active">
					<table class="table">
			        <caption class="text-center">Personal Information</caption>
					  <thead>
					    <tr class="text-center" > 
					      <th>saler_id</th>
					      <th>regin_id</th>
					      <th>email</th>
					      <th>store_id</th>
					      <th>salary</th>
					  </thead>
					  <tbody>
					  <% 
					    Salesperson sellerinfo=Factory.getIEmpDAOInstance().Sale_info(session.getAttribute("sellerid").toString());
			        	Salesperson seller=sellerinfo;
			        		%>
						    <tr class="active">
						      <td><%=seller.getSale_id()%></td>
						      <td><%=seller.getRegin_id()%></td>
						      <td><%=seller.getEmail()%></td>
						      <td><%=seller.getStore_id()%></td>
						      <td><%=seller.getSalary()%></td>
						    </tr>
					  </tbody>
					</table>
			    </div> 
			  </div>
			</div>
		</div>
	</div>
</div>
</body> 
</html> 
