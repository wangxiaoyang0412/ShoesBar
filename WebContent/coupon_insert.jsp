<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Insert title here</title> 
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
<script type="text/javascript">
function validate(){

	 coupon.action="./coupon_insert";
	 coupon.submit();
	}
	
	
	
	function couponinsert(){
		  $.ajax({
		         type: "POST",                           //传数据的方式
		         url: "./coupon_insert", //servlet地址
		         data: $('#coupon').serialize(),      //传的数据  form表单 里面的数据
		         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
		        // $("#result").val(result);           //找到输入框 并且将result的值 传进去
				if(result==1){
					window.alert("add coupon success");
				}
				else {
					window.alert("add coupon fail");
		         }
		}
		     });
	}
	
	</script>

<body>
 <div class="container">

<form class="form-signin" method="post" name="coupon" id="coupon" enctype="multipart/form-data" action="coupon_insert" >
 <h2 class="form-signin-heading">Fill Coupon Information</h2>
<input type="text" name="coupon_id" id="coupon_id" class="input-block-level" placeholder="Account Name"  onchange='uidcheck()'> &nbsp;&nbsp;<span id="ok1" class="glyphicon glyphicon-ok" style="display:none;"></span><span id="error1" class="glyphicon glyphicon-remove" style="display:none;"></span><br>
<input type="text" name="coupon_name"id="coupon_name" class="input-block-level" placeholder="Real Name"><br>
<input type="text" name="seller_id"id="seller_id" class="input-block-level" placeholder="seller_id"><br>
<input type="text" name="discount_price"id="discount_price" class="input-block-level" placeholder="discount_price"><br>
<input type="text" name="amount"id="amount"  class="input-block-level" placeholder="amount"><br>
<select class="form-control" id="coupon_type" name="coupon_type">
<option>coupon_type</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
    </select><br>
   <div class="form-group">
    <label class="sr-only" for="inputfile">Upload Picture</label>
    <input type="file" name="inputfile" id="inputfile">
  </div> 
<input type="submit" value="Add" class="btn btn-large btn-primary">
</form>


</div>



</body>
</html>