<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.jfree.chart.ChartFactory, 
org.jfree.chart.JFreeChart, 
org.jfree.chart.servlet.ServletUtilities, 
util.*"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
        $(document).ready(function(){
            $("#a1").click(function(){
                $('#mainFrame').load('./Agg_cateNum.jsp');
            });
            
            $("#a2").click(function(){
                $('#mainFrame').load('./Agg_reginNum.jsp');
            });
            $("#a3").click(function(){
                $('#mainFrame').load('./Agg_brandBuss.jsp');
            });
            //单击 b 链接，加载 b.html
            $("#a").click(function(){
                $('#mainFrame').load('./deals.jsp');
            });
            ajaxFun();
        })
        
       window.setInterval(function(){
    	   		 $.ajax({
   		         type: "GET",                           
		         url: "./system_statistic", 
		         success: function(result){      
		var parsedJson = jQuery.parseJSON(result); 
		$("#orders").val(parsedJson.ordernum); 
		 $("#customer").val(parsedJson.customernum); 
		$("#seller").val(parsedJson.storenum); 
		$("#money").val(parsedJson.moneynum); 
		         }
		     })},10000);  
        
        function ajaxFun(){
    		 $.ajax({
    		   		         type: "GET",                           
    				         url: "./system_statistic", 
    				         success: function(result){       
    				var parsedJson = jQuery.parseJSON(result); 
    				$("#orders").val(parsedJson.ordernum); 
    				 $("#customer").val(parsedJson.customernum); 
    				$("#seller").val(parsedJson.storenum); 
    				$("#money").val(parsedJson.moneynum); 
    				         }
    				     });
    		  }
    </script>
<title>System Home</title>
</head>
<body>
<div class="container-fluid">
<div class="row">
 <div class="col-md-2 col-lg-2" style="background:#DCDCDC;height:700px">
<ul class="nav nav-pills nav-stacked">
  <li class="active"><a href="system_home.jsp">Home</a></li>
  <li><a id="a1" class="">Categories Manage</a></li>
  <li><a id="a2" class="">Region Manage</a></li>
  <li><a id="a3" class="">Business Manage</a></li>
</ul>
 </div>
 <div class="col-md-10 col-lg-10" style="background:AliceBlue;height:700px" id="mainFrame">
 <div class="col-md-12 col-lg-12" style="background:white;width:90%;height:100px;margin-left:30px;margin-top:20px;margin-right:30px;margin-bottom:30px;">
 <div class="col-md-3 col-lg-3">
 <h3>Users</h3>
  <input type="text" id="orders" name="orders">
 </div>
 <div class="col-md-3 col-lg-3">
 <h3>Sale People</h3>
 <input type="text" id="customer" name="customer">
 </div>
 <div class="col-md-3 col-lg-3">
 <h3>Orders</h3>
  <input type="text" id="seller" name="seller">
 </div>
 <div class="col-md-3 col-lg-3">
 <h3>Region</h3>
  <input type="text" id="money" name="money">
 </div>
 </div>
 <% 
JFreeChart chart=Factory.ChartDisplay().orderPrice_ByBrand();
JFreeChart chart2=Factory.ChartDisplay().orderPricr_ByColor();
String filename = ServletUtilities.saveChartAsPNG(chart, 500, 300, null, session); 
String filename2 = ServletUtilities.saveChartAsPNG(chart2, 500, 300, null, session); 
String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename; 
String graphURL2 = request.getContextPath() + "/DisplayChart?filename=" + filename2; 
%> 
 <div class="row">
  <div class="col-md-4 col-lg-4 col-md-offset-1" style="background:white;height:300px; margin-top:50px;">
<img src="<%= graphURL %>" width=500 height=300 border=0 > 
 </div>

  <div class="col-md-4 col-lg-4 col-md-offset-1" style="background:white;height:300px;margin-top:50px;">
 <img src="<%= graphURL2 %>" width=500 height=300 border=0 > 
 </div>
 
 </div>
 
 </div>
</div>
</div>
</body>
</html>