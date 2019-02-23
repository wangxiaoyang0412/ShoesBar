<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to SportsTong!</title><link rel="shortcut icon" href="favicon2.ico"> 
<script type="text/javascript" language="JavaScript">

function chooseUser()
{

		 if(document.denglu1.choose.value=="emp"){
			denglu.action="./emp_denglu.jsp";
			docunment.denglu1.submit();
		}
		 else if(document.denglu1.choose.value=="user"){
				denglu.action="./denglu.jsp";
				document.denglu1.submit();
			}
		 else if(document.denglu1.choose.value=="piaowu"){
				denglu.action="./ticket_get.jsp";
				document.denglu1.submit();
			}
	}

</script>
</head>
<body style="background-image:url(image/index.jpg)">
<font color="red" size="+4" face="华文琥珀">Welcome to %$$$%%%</font>
<center>
<br>
<h3><marquee onmouseout=this.start() onmouseover=this.stop() behavior="scroll" 
direction="left" width="660px" height="40px" SCROLLDELAY="90" >
<font color="green">Choose Identity
</font></marquee> </h3>
<br>

   <form action=""method="post" name="denglu1" id="denglu" onSubmit="chooseUser()">
   <p>选择登陆身份：<input type="radio" name="choose"id="choose1" value="user">customer
   <input type="radio" name="choose"id="choose2" value="emp">system manager
           

<input type="submit"name="submit"value="登录"></form>

<br><form name="register"action="./user_insert.jsp"method="post">
没有账户？立刻申请<button><font size="3"color="red">注册</font></button></form>
</center>
</body>
</html>