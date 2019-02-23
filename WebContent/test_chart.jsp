<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="org.jfree.chart.ChartFactory, 
org.jfree.chart.JFreeChart, 
org.jfree.chart.servlet.ServletUtilities, 
util.*"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Insert title here</title>
</head>
<% request.setCharacterEncoding("UTF-8");%>
<body>
<% 
JFreeChart chart=Factory.ChartDisplay().test();
JFreeChart chart2=Factory.ChartDisplay().orderPricr_ByColor();
String filename = ServletUtilities.saveChartAsPNG(chart2, 500, 300, null, session); 
String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename; 
%> 
<p><%=graphURL %></p>
<img src="<%= graphURL %>" width=500 height=300 border=0 > 

</body> 
</html>