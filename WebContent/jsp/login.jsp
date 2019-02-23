<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" language="JavaScript">
function isValid()
{
	if(document.denglu.username.value==""){
		window.alert("请输入账号");
		document.denglu.element(0).focus();
		return false;
	}
	if(document.denglu.password.value==""){
		window.alert("请输入密码");
		document.denglu.element(1).focus();
		return false;
	}
	denglu.action="./login";
	denglu.submit();
	}

</script>
<title>用户登录</title>
</head>
<body>
<center>
<br><br>
<h2><font color="green" face="黑体">欢迎使用运动荟<font></h2><br>
	<p><font color="red" size="+4" face="华文行楷">请填写登录信息</font></p>
   <form action=""method="post" name="denglu" id="denglu" onSubmit=isValid()>
   <p>用户名：<input type="text"class="input"id="username"name="username"onblur="checkUid()"size="50"placeholder="注册时账号"
   />
   &nbsp;&nbsp;<p> 密码：<input type="password"class="input"id="password"name="password"onblur="checkFirPwd()"size="51"placeholder="请输入密码"/>
	
   <p><input type="submit"name="submit"value="登录"/>

   </form>
   </center>
</body>
</html>