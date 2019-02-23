<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="model.Coupon" %>
<%@ page import="java.util.*" %>
<%@ page import="util.Factory" %>
<%@ page import="service.*" %>
<!DOCTYPE html> 
<html>
<head>
	<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	<style type="text/css">
#loading{z-index:1;padding:5px 0 5px 29px;
background:url(image/load1.gif) no-repeat 10px top;left:50%;top:50%;width:180px;
position:fixed; height:200px}
</style>

	<script type="text/javascript" >
	
	function getcoupon(btn){
			var index=-1;
			var fm=document.getElementById("coupon");
			for(var i=0;i<fm.btn.length;i++){
				if(fm.btn[i]==btn){
					index=i;
					break;
				}
			}
			var coupon_id=fm.coupon_id[index].value;
			  $.ajax({
				         type: "GET",                           //传数据的方式
				         url: "./get_coupon",
				       data:  {"coupon_id":coupon_id},      //传的数据
				         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
				if(result==1){alert("you got this coupon successly")}     
				else{alert("you have got this coupon before!")}   
				// $("#result").val(result);           //找到输入框 并且将result的值 传进去
						
				         }
				     });
	}
	
	
	</script>
</head>
<body class="container-fluid">
<div id="content">
<jsp:include page="/menu_login_in.jsp"/>
<form id="coupon">
<%List<Coupon> all= (List<Coupon>)request.getAttribute("coupon");
 Iterator<Coupon> itor= all.iterator();
 while(itor.hasNext()){
	 Coupon coupon=itor.next();
%>
<div class="col-lg-2" style="margin-top:35px ;border:1px dotted #337ab7;height:325px">
  <h4 style="height:30px"><font face="verdana"><%=coupon.getName() %></font></h4>
  <div class="card" style="width:300px;">
    <img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:50%">
    <div class="card-body">
      <h4 class="card-title">$<%=coupon.getDiscount_price() %><span style="margin-left:50px"></span>20 left</h4>
      <p class="card-text">Some coupon is really good</p>
      <button name="btn" id="btn" class="btn btn-primary" onclick="getcoupon(this)">Get One</button>
      <input type="hidden" name="coupon_id" id="coupon_id" value=<%=coupon.getCoupon_id() %>>
    </div>
  </div>
  </div>
<%} %></form>
	 </div>
</body>
</html> 