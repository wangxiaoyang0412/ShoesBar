<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="service.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Insert title here</title> 
	<style type="text/css">
#loading{z-index:1;padding:5px 0 5px 29px;
background:url(image/load1.gif) no-repeat 10px top;left:50%;top:50%;width:180px;
position:fixed; height:200px}
</style>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="js/load.js"></script>
<script src="js/jquery.raty.js" type="text/javascript"></script>
<script type="text/javascript">
function selectbtn(btn){
	var index=-1;
	var fm=document.getElementById("orders");
	if(typeof(fm.detail.length)!="undefined"){
	for(var i=0;i<fm.detail.length;i++){
		if(fm.detail[i]==btn){
			index=i;
			break;
		}
	}
	var order_id=fm.order_id[index].value;
	}
	else{
		var order_id=fm.order_id.value;
	}
	  $.ajax({
		         type: "GET",                           //传数据的方式
		         url: "./order_detail?order_id="+order_id,
		        
		       //data: $('#fm').serialize(),      //传的数据  form表单 里面的数据
		         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
			var parsedJson = jQuery.parseJSON(result); 
			 $("#order_number").val(parsedJson.order_id);           //找到输入框 并且将result的值 传进去
			 $("#seller").val(parsedJson.seller_id);
			 $("#pay_time").val(parsedJson.time);
			 $("#shoes_amount").val(parsedJson.item_amount);
			 $("#tprice").val(parsedJson.total_price);
			 $("#shoes_size").val(parsedJson.size);
			 $("#shoes_color").val(parsedJson.color);
			 $("#shoes_name").val(parsedJson.shoes_name);
			 $("#shoes_brand").val(parsedJson.shoes_brand);
		         }
		     });
}

function removecart(btn){
	var index=-1;
	var fm=document.getElementById("orders");
	if(typeof(fm.detail.length)!="undefined"){
	for(var i=0;i<fm.contact.length;i++){
		if(fm.contact[i]==btn){
			index=i;
			break;
		}
	}
	var order_id=fm.order_id[index].value;
	}
	else{
		var order_id=fm.order_id.value;
	}
	
	var r=confirm("Are you sure to return this item?");
	if (r==true)
	  {
		 $.ajax({
				         type: "GET",                           //传数据的方式
				         url: "./order_return?order_id="+order_id+"&cmd=return",
				        
				       //data: $('#fm').serialize(),      //传的数据  form表单 里面的数据
				         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
							window.alert("success! return wait to be confirmed by the seller")
				         }
				     });
	  }
	else
	  {
	  return;
	  }
}

function removecart2(btn){
	var index=-1;
	var fm=document.getElementById("orders");
	if(typeof(fm.detail.length)!="undefined"){
	for(var i=0;i<fm.review.length;i++){
		if(fm.review[i]==btn){
			index=i;
			break;
		}
	}
	var order_id=fm.order_id[index].value;
	}
	else{
		var order_id=fm.order_id.value;
	}
	
	var r=confirm("Are you sure to confirm this item?");
	if (r==true)
	  {
		 $.ajax({
				         type: "GET",                           //传数据的方式
				         url: "./order_return?order_id="+order_id+"&cmd=confirm",
				        
				       //data: $('#fm').serialize(),      //传的数据  form表单 里面的数据
				         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
							window.alert("success!")
				         }
				     });
	  }
	else
	  {
	  return;
	  }
}


$(function() {
	$('#star').raty(
			{
            path:"image/img",
            number: 5, 
            starOff: 'star-off-big.png',
            starOn: 'star-on-big.png',
            hints: ['bad', 'fair', 'good', 'great', 'perfect'],
            size:24,
           
			target: '#result',
            targetKeep : true
				        });
	});
</script>
</head> 
<div id="loading"></div>
<body class="container-fluid">
<div id="content"> 
 <jsp:include page="/menu_login_in.jsp" />
<form id="orders" method="post" action="./orderconfirm">
	<table id="cartTable"  class="table table-striped">
		<thead>
			<tr>
				
				<th><label>Shoes</label></th>
				<th><label>Order_Id</label></th>
				<th><label>Name</label></th>
				<th style="width:90px;"><label>Size</label></th>
				<th style="width:90px;"><label>Color</label></th>
				<th style="width:120px;"><label style="text-align:right">Price</label></th>
				<th style="width:150px;"><label>status</label></th>
				<th style="width:120px;"><label>SubPrice</label></th>	
				<th style="width:40px;"><label>Apply Return</label></th>	
				<th style="width:40px;"><label>Order Detail</label></th>
				<th style="width:40px;"><label>Write Review</label></th>
			</tr>
		</thead>
		<tbody>
		<%
List<Orders> orders = Factory.getIEmpDAOInstance().find_MyOrders(session.getAttribute("uid").toString());
Iterator<Orders> iter=orders.iterator();
int count_line=0;
while(iter.hasNext()){
	Orders order=iter.next();
	Shoes shoe=Factory.getIEmpDAOInstance().findByShoesId(order.getShoes_id());
%>

			<tr >
				
				<td><label><a href="./shoes_detail.jsp?shoes_id=<%=shoe.getShoes_id() %>"><img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:50px;height:50px"><input type="text" value=<%=shoe.getShoes_id() %> id="shoes_id" name="shoes_id" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;"></a></label></td>
				<td><label><input type="text" value=<%=order.getOrder_id() %> name="order_id" id="order_id" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;"></label></td>
				<td><label><%=shoe.getName() %></label></td>
				<td class="number small-bold-red"><span><input type="text" value=<%=order.getSize() %> name="size" id="size" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent; width:80px"></span></td>
				<td class="number small-bold-red"><span><input type="text" value=<%=order.getColor() %> name="color" id="color" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;width:80px"></span></td>
				<td class="number small-bold-red"><span><input type="text" value=<%=shoe.getPrice() %> name="oneprice" id="oneprice" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;width:80px"></span></td>
				<td class="number small-bold-red"><span><input type="text" value=<%=StatusUtil.order_Status(order.getStatus()) %> name="status" id="status" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;width:80px"></span></td>
				<td class="subtotal number small-bold-red"><input type="text" readonly="readonly" id="subtotal" name="subtotal" value=<%=order.getTotal_price()%> readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;width:100px"></td>
				<td class="operation"><input type="button" class="delete btn btn-xs btn-primary" value="Return" name="contact" value="contack" onclick="removecart(this)"></td>
				<td class="operation"><input type="button" class="delete btn btn-xs btn-primary" value="Detail" name="detail" value="detail" onclick="selectbtn(this)" data-target="#myModal" data-toggle="modal"></td>
				<td class="operation"><input type="button" class="delete btn btn-xs btn-primary" value="Confirm" name="review" value="review" onclick="removecart2(this)" ></td>
				<td ><input type="hidden" name="price" id="price" value=<%=shoe.getPrice() %>></td>
				<td ><input type="hidden" name="seller_id" id="seller_id" value=<%=shoe.getSeller_id() %>></td>
			</tr>
			<%
count_line++;			
} %>
		</tbody>
	</table>
	</form>
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="myModalLabel">
                   Order Details
                </h3>
            </div>
     <div class="modal-body">
    <div class="row">
    <div class="col-md-6 col-lg-6">
    <h4>order number:<input type="text" id="order_number" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
     <h4>pay time:<input type="text" id="pay_time" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
     <h4>discount:&nbsp;$<input type="text" id="discount" value="0" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
      <h4>total price:&nbsp;$<input type="text" id="tprice" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"> </h4>
       <h4>seller:<input type="text" id="seller" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
    </div>
     <div class="col-md-6 col-lg-6">
    <h4>shoes name:<input type="text" id="shoes_name" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
     <h4>brand:<input type="text" id="shoes_brand" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
      <h4>size:<input type="text" id="shoes_size" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
       <h4>color:<input type="text" id="shoes_color" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
        <h4>amount:<input type="text" id="shoes_amount" value="" style="border:none;BACKGROUND-COLOR: transparent;margin-left:10px"></h4>
    </div>
     </div>   
        </div><!-- /.modal-body -->
        <!--  
        <div class="modal-body">
         <h4>address:</h4>
    	 <h4>name:</h4>
     	 <h4>phone:</h4>
        </div>-->
        <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">close
                </button>
                <button type="button" class="btn btn-primary" onclick="submitnew()">
                   Contact the seller
                </button>
            </div>
    </div><!-- /.modal -->
</div>
	</div>
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="myModalLabel">
                   Write a Review
                </h3>
            </div>
     <div class="modal-body">
    <div class="row">
    <form name="review">
    <div class="col-md-12 col-lg-12">
    
   <div id="star"></div>
<div id="result"></div>
    
    <textarea class="form-control" rows="3" placeholder="write your review"></textarea>
    </div>
    </form>
     </div>   
        </div><!-- /.modal-body -->
        
        <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">close
                </button>
                <button type="button" class="btn btn-primary" onclick="submitreview()">
                   Submit
                </button>
            </div>
    </div><!-- /.modal -->
</div>
	</div>
	</div>
</body> 
</html> 