<%@ page import="model.User" %>
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
<title>Insert title here</title>
</head>
<body>
<%User user11=(User)request.getAttribute("uid");
	String keyWord=request.getParameter("kw");
	if(keyWord==null){
		keyWord="";
	}
	List<User>all=Factory.getIEmpDAOInstance().findAll3("123");
	Iterator<User> iter=all.iterator();
	String i=request.getAttribute("user11").toString();
	User us= (User)request.getAttribute("user");
	%>
	<p><%=us.getUid() %>
	<center>
	<form action="user_list.jsp" method="post">
	请输入关键字<input type="text" name="kw">
	<input type="submit" value="查询">
	</form>
	<table class="table table-striped">
	<thead>
	<tr>
	<td>用户名：</td>
	<td>姓名：</td>
	<td>密码：</td>
	<td>电子邮箱：</td>
	<td>手机号码：</td>
	</tr>
	</thead>
	<tbody>
	<%
	while(iter.hasNext()){
		User user=iter.next();
		%>
	<tr>
	<td><%=user.getUid() %></td>
	<td><%=user.getUname() %></td>
	<td><%=user.getUpassword() %></td>
	<td><%=user.getUemail() %></td>
	<td><%=user.getUphone() %></td>
	</tr>
	<%
		}
	%>
	</tbody>
	</table>
	</center>

</body>
</html>