<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" language="javascript">
	function addcart(){
		var xmlhttp;
		if (window.XMLHttpRequest)
		{
		    //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		    xmlhttp=new XMLHttpRequest();
		}
		else
		{
		    // IE6, IE5 浏览器执行代码
		    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("GET","./cart?uid=gccg102&shoes_id=adt-1241",true);
		xmlhttp.send();
		var a=xmlhttp.responseText;
		window.alert(a);
	}
	
	function ajaxFun(){
		window.alert("12");
		  $.ajax({
		         type: "GET",                           //传数据的方式
		         url: "./register", //servlet地址
		         data: $('#regist').serialize(),      //传的数据  form表单 里面的数据
		       //  data: $('#form').serialize(),      //传的数据  form表单 里面的数据
		         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
		        // $("#result").val(result);           //找到输入框 并且将result的值 传进去
				window.alert(result);
		         }
		     });
		  }
	</script>
<title>Insert title here</title>
</head>
<body>
<a href="./HelloWorldServlet">hehe</a>
<a href="./HelloWorldServlet1">time refresh</a>
<a type="button" class="btn btn-primary" onclick="ajaxFun()">Add to Cart</a>
<form action="./register" class="form-signin" method="post" name="regist" id="regist">
 <h2 class="form-signin-heading">Fill Personal Information</h2>
<input type="text" name="uid" id="uid" class="input-block-level" placeholder="Account Name"  onchange='ajaxFun()'> &nbsp;&nbsp;<span class="glyphicon glyphicon-ok red"></span><br>
<input type="text" name="uname"id="uname" class="input-block-level" placeholder="Real Name"><br>
<input type="password" name="upassword"id="password" placeholder="Password" class="input-block-level"><br>
<input type="password" name="upassword1"id="password1" placeholder="Confirm Password" class="input-block-level"><br>
<input type="text" name="uphone"id="uphone" class="input-block-level" placeholder="Telephone"><br>
<input type="text" name="ucity"id="ucity" class="input-block-level" placeholder="City"><br>
<input type="text" name="uemail"id="uemail" class="input-block-level" placeholder="Email"><br>
<input type="text" name="yanzheng"id="yanzheng" class="input-block-level" placeholder="confirm email number" ><br>
<input type="submit" value="Register" class="btn btn-large btn-primary">
<input type="reset" value="Reset" class="btn btn-large btn-primary"></form>
</body>
</html>