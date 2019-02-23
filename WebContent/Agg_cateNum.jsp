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
  <title>Business Info</title>
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
<body id="h4TM">
    <h6><a href="./system_home.jsp">Back system home</a>  </h6>
	<pre class="pre-scrollable">
      <div class="table-responsive", class="tab-pane fade in active">
		<table class="table">
        <caption class="text-center">Sell Amount of Each Categories</caption>
		  <thead>
		    <tr>
		      <th>Categories</th>
		      <th>sell_num</th>
		  </thead>
		  <tbody>
		  <% 
		    List<Cate_Num> cateinfo=Factory.getIEmpDAOInstance().get_Cate();
        	Iterator<Cate_Num> iter=cateinfo.iterator();
        	while(iter.hasNext()){
        		Cate_Num cate=iter.next();%>
			    <tr class="active">
			      <td><%=cate.getBusiness()%></td>
			      <td><%=cate.getCsell_num()%></td>
			    </tr>
		  <%}  %>
		  </tbody>
		</table>
		</div> 
	</pre class="pre-scrollable">

</body>
</html>