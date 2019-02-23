<%@ page import="util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎注册运动通</title>
</head>
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
        max-width: 400px;
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
<script type="text/javascript" language="javascript" >
function validate(){
	if(regist.uid.value==""){
		window.alert("pleaser insert username");
		document.regist.element(0).focus();
		return false;
	}
	 if(regist.uname.value==""){
		window.alert("please insert your name");
		document.regist.element(1).focus();
		return false;
	}
	
	 if(regist.upassword.value==""){
		window.alert("please insert password");
		document.regist.element(2).focus();
		return false;
	}
	 if(regist.upassword1.value==""){
		window.alert("insert password again");
		document.regist.element(3).focus();
		return false;
	}
	 if(regist.upassword.value!=regist.upassword1.value){
		window.alert("password inert not the same");
		return false;
	}
	 if(regist.uemail.value==""){
			window.alert("insert you email");
			return false;
		}
	 if(regist.uphone.value==""){
			window.alert("insert your phone");
			return false;
		}
	 if (isNaN(document.regist.uphone.value)) { 
		alert("wrong phone number"); 
		document.order.onum.focus();
		if(regist.yanzheng.value==""){
			window.alert("insert your verification code");
			return false;
		}
		return false;
		} 
	 
 
	 regist.action="./register";
	 regist.submit();
	}
	
	function email() {
		            var email = document.getElementById("uemail");
		      
		        var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		            if(!myreg.test(email.value))
		            {
 				alert('not a valid E_mail！');
 				document.getElementById("uemail").focus();
               return false;
	           }
		        }
	
	function phone(){
		  var myreg=/^((18[0-9]{1})|(13[0-9]{1})|(15[0-9]{1}))+\d{8}$/;
		  var phone=document.getElementById("uphone");
		  if(!myreg.test(phone.value))
          {
		alert('提示\n\n请输入有效的手机号！');
		document.getElementById("uphone").focus();
     return false;
     }
		  
		function  pass(){
			var myreg=/^((18[0-9]{1})|(13[0-9]{1})|(15[0-9]{1}))+\d{8}$/;
			  var pass=document.getElementById("upassword");
			  if(!myreg.test(phone.value))
	          {
			alert('提示\n\n请输入有效的手机号！');
			document.getElementById("upassword").focus();
	     return false;
		}}
		
	}
	
	function uidcheck(){
		  $.ajax({
		         type: "GET",                           //传数据的方式
		         url: "./register", //servlet地址
		         data: $('#regist').serialize(),      //传的数据  form表单 里面的数据
		       //  data: $('#form').serialize(),      //传的数据  form表单 里面的数据
		         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
		        // $("#result").val(result);           //找到输入框 并且将result的值 传进去
				if(result==1){
					alert("this id has been signed")
					document.getElementById("error1").style.display='';
					document.getElementById("ok1").style.display='none';
					document.getElementById("uid").focus();
				}
				else {
					document.getElementById("ok1").style.display='';
					document.getElementById("error1").style.display='none';
				
		         }
		}
		     });
	}
	
	function verify_email(){
		if(document.getElementById("regist").uemail.value==""){
			window.alert("please enter your email to verirfy!");
			return;
		}
		 var email = document.getElementById("uemail");
	      
	        var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	            if(!myreg.test(email.value))
	            {
			alert('Please insert a valid E_mail！');
			document.getElementById("uemail").focus();
        return false;
        }
		
		window.open('sendmail?email='+document.getElementById('uemail').value)
	}
	</script>

<body>
 <div class="container">

<form class="form-signin" method="post" name="regist" id="regist" onsubmit="validate()">
 <h2 class="form-signin-heading">Fill Personal Information</h2>
<input type="text" name="uid" id="uid" class="input-block-level" placeholder="Account Name"  onchange='uidcheck()'> &nbsp;&nbsp;<span id="ok1" class="glyphicon glyphicon-ok" style="display:none;"></span><span id="error1" class="glyphicon glyphicon-remove" style="display:none;"></span><br>
<input type="text" name="uname"id="uname" class="input-block-level" placeholder="Real Name"><br>
<input type="password" name="upassword"id="password" placeholder="Password" class="input-block-level"><br>
<input type="password" name="upassword1"id="password1" placeholder="Confirm Password" class="input-block-level"><br>
<input type="text" name="uphone"id="uphone" class="input-block-level" placeholder="Telephone"><br>
<input type="text" name="ucity"id="ucity" class="input-block-level" placeholder="City"><br>
<%int unit=6;
session.setAttribute("verification_code", Format.get_VerificationCode(unit));  %>


<label class="radio-inline">
        <input type="radio" name="usertype" id="home" value="1" checked> Home User
    </label>
    <label class="radio-inline">
        <input type="radio" name="usertype" id="business"  value="2"> Business User
    </label><br>

<label class="radio-inline">
        <input type="radio" name="gender" id="male" value="1" checked> male
    </label>
    <label class="radio-inline">
        <input type="radio" name="gender" id="femal"  value="2"> femal
    </label><br>


<input type="text" name="age"id="age" class="input-block-level" placeholder="Age" ><br>

<input type="text" name="income"id="income" class="input-block-level" placeholder="Salary" ><br>

<label class="radio-inline">
        <input type="radio" name="marriage" id="mar" value="1" checked> married
    </label>
    <label class="radio-inline">
        <input type="radio" name="marriage" id="unmar"  value="2"> unmarried
    </label><br>
    <input type="text" name="uemail"id="uemail" value="" class="input-block-level" placeholder="Email" onchange='verify_email()'><br>
<a class="btn btn-info" onclick="verify_email()" target="_blank">Verify Email</a>
<input type="text" name="yanzheng"id="yanzheng" class="input-block-level" placeholder="fill verification number" ><br>
<input type="submit" value="Register" class="btn btn-large btn-primary">
<input type="reset" value="Reset" class="btn btn-large btn-primary">
</form>


</div>



</body>
</html>