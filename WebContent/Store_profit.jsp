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
    <h6><a href="http://localhost:8080/dbmanagement/sellerhome.jsp">Back home</a>  </h6>
	<pre class="pre-scrollable">
      <div class="table-responsive", class="tab-pane fade in active">
		<table class="table">
        <caption class="text-center">Your Total Profit</caption>
		  <thead>
		    <tr>
		      <th>Store_id</th>
		      <th>Profit</th>
		  </thead>
		  <tbody>
		  <% 
		    List<Store_Profit> cateinfo=Factory.getIEmpDAOInstance().get_Profit(session.getAttribute("storeid").toString());
        	Iterator<Store_Profit> iter=cateinfo.iterator();
        	while(iter.hasNext()){
        		Store_Profit cate=iter.next();%>
			    <tr class="active">
			      <td><%=cate.getRegin()%></td>
			      <td><%=cate.getRsell_num()%></td>
			    </tr>
		  <%}  %>
		  </tbody>
		</table>
		</div> 
	</pre class="pre-scrollable">

</body>
</html>