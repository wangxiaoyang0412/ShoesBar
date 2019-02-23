<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 600px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
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
 <div class="container">
   <form class="form-signin" action=""method="post" name="denglu" id="denglu" onSubmit=isValid()>
    <h2 class="form-signin-heading">Please sign in</h2>
   <input type="text" class="input-block-level" id="username"name="username"onblur="checkUid()"size="50"placeholder="Account Name">
<input type="password" class="input-block-level" id="password"name="password"onblur="checkFirPwd()"size="50"placeholder="Password">
	<p>
	<label class="radio-inline">
        <input type="radio" name="usertype" id="customer" value="customer" checked> Customer
    </label>
    <label class="radio-inline">
        <input type="radio" name="usertype" id="seller"  value="seller"> Seller
    </label>
   <br><br>
  <input type="submit"name="submit" class="btn btn-large btn-primary" value="Sign In"/>
  
         <br><a href="./register.jsp" name="reg" class="btn btn-link btn-primary" >Register</a>
          <a>
          Forget password?
        </a>
   </form>
   </div>
</body>
</html>