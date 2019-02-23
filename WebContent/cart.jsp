<%@ page import="model.*" %>
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
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	<style type="text/css">
#loading{z-index:1;padding:5px 0 5px 29px;
background:url(image/load1.gif) no-repeat 10px top;left:50%;top:50%;width:180px;
position:fixed; height:200px}
</style>

	<script type="text/javascript" language="javascript">
	$(document).ready(function(){
		 $("#content").hide();
		 window.setTimeout('$("#loading").fadeOut()',1500);
		 window.setTimeout('$("#content").show()',1500);
	});
	
	function checkall(){
		if(typeof(document.getElementById("cart").ch.length)!="undefined"){
			if(document.getElementById("cart").checkall1.checked){
			for(var i=0;i<document.getElementById("cart").ch.length;i++){
			document.getElementById("cart").ch[i].checked=true;
		}
		}
			else{
				for(var i=0;i<document.getElementById("cart").ch.length;i++){
					document.getElementById("cart").ch[i].checked=false;
			}
		}
		}
			else{
				if(document.getElementById("cart").checkall1.checked) document.getElementById("cart").ch.checked=true;
				else document.getElementById("cart").ch.checked=false;
				}
		check();
	}
	
	function check(){
		var fm=document.getElementById("cart");
		var subnum=0;
		var totnum=0;
		var totprice=0.0;
		if(typeof(fm.ch.length)!="undefined"){
			for(var i=0;i<fm.ch.length;i++){
				if(fm.ch[i].checked==true){
					//parseInt(fm.num[index].value);
					subnum=subnum+1;
					totnum=parseInt(fm.num[i].value)+totnum;
					totprice=parseFloat(fm.subtotal[i].value)+totprice;
				}
			}
			document.getElementById("subnum").value=subnum;
			document.getElementById("totnum").value=totnum;
			document.getElementById("totprice").value=totprice;
		}
		else{
			if(fm.ch.checked==true){
			document.getElementById("subnum").value=1;
			document.getElementById("totnum").value=parseInt(fm.num.value);
			document.getElementById("totprice").value=parseFloat(fm.subtotal.value);
			}
			else{
				document.getElementById("subnum").value=0;
				document.getElementById("totnum").value=0;
				document.getElementById("totprice").value=0.0;
			}
		}
	}
	
	function numminus(a){
		var fm=document.getElementById("cart");
		if(typeof(fm.ch.length)!="undefined"){
		var index=-1;
		for(var i=0;i<fm.minus.length;i++){
			if(fm.minus[i]==a){
				//window.alert(i);
				index=i;
				break;
			}
		}
		fm.num[index].value= parseInt(fm.num[index].value)-1;
		fm.subtotal[index].value=parseFloat(fm.price[index].value)*fm.num[index].value;}
		else{
			fm.num.value=parseInt(fm.num.value)-1;
			fm.subtotal.value=parseFloat(fm.price.value)*fm.num.value;
		}
	}
	
	function numplus(a){
		var fm=document.getElementById("cart");
		if(typeof(fm.ch.length)!="undefined"){
		var index=-1;
		for(var i=0;i<fm.plus.length;i++){
			if(fm.plus[i]==a){
				index=i;
				break;
			}
		}
		fm.num[index].value= parseInt(fm.num[index].value)+1;
		fm.subtotal[index].value=parseFloat(fm.price[index].value)*fm.num[index].value;}
		else{
			fm.num.value=parseInt(fm.num.value)+1;
			fm.subtotal.value=parseFloat(fm.price.value)*fm.num.value;
		}
	}
	
	function removecart(btn){
		if(window.confirm('remove the item？')){
            //alert("Yes");
			var index=-1;
			var fm=document.getElementById("cart");
			for(var i=0;i<fm.btn.length;i++){
				if(fm.btn[i]==btn){
					index=i;
					break;
				}
			}
			shoes_id=fm.shoes_id[index].value;
			size=fm.size[index].value;
			color=fm.color[index].value;
			window.location.href="./cartdelete?uid=<%=session.getAttribute("uid").toString()%>&shoes_id="+shoes_id+"&size="+size+"&color="+color;
         }else{
            //alert("No");
            return;
        }
	}
	
	function validate(){
		var fm=document.getElementById("cart");
		if(typeof(fm.ch.length)!="undefined"){
			var index=-1;
			for(var i=0;i<fm.ch.length;i++){
				if(fm.ch[i].checked){
					index=i;
					break;
				}
			}
			if(index==-1){
			   window.alert("please select at least one product in your cart to proceed to check out");
			   return;
			   }
			fm.action="./orderconfirm";
			fm.submit();
		}
		else{
			if(!fm.ch.checked)
			   {window.alert("please select at least one product in your cart to proceed to check out");
			   return;
			   }
			fm.action="./orderconfirm";
			fm.submit();
		}
	}
	</script>
</head>
 <div id="loading"></div>
<body class="container-fluid">
<div id="content">
<jsp:include page="/menu_login_in.jsp"/>
<form id="cart" method="post" onsubmit="validate()">
	<table id="cartTable"  class="table table-striped">
		<thead>
			<tr>
				<th style="width:60px;"><label><input class="check-all check" type="checkbox" name="checkall1"  onclick="checkall()"/>all</label></th>
				<th><label>Shoes</label></th>
				<th><label>Name</label></th>
				<th style="width:90px;"><label>Size</label></th>
				<th style="width:90px;"><label>Color</label></th>
				<th style="width:120px;"><label style="text-align:right">Price</label></th>
				<th style="width:150px;"><label>Amount</label></th>
				<th style="width:120px;"><label>SubPrice</label></th>
				<th style="width:40px;"><label>Delete</label></th>	
			</tr>
		</thead>
		<tbody>
		<%
List<Cart> carts = Factory.getIEmpDAOInstance().findCartByUid(session.getAttribute("uid").toString());
Iterator<Cart> iter=carts.iterator();
int count_line=0;
while(iter.hasNext()){
	Cart cart=iter.next();
	Shoes shoe=Factory.getIEmpDAOInstance().findByShoesId(cart.getShoes_id());
	int stock=Factory.getIEmpDAOInstance().findShoe_StockBySizeColor(shoe.getShoes_id(), cart.getSize(), cart.getColor());
%>

			<tr >
				<td ><input class="check-one check" type="checkbox" name="ch" id="ch" onclick="check()" value=<%=count_line %>></td>
				<td><a class="btn btn-link" href="./shoes_detail.jsp?shoes_id=<%=shoe.getShoes_id() %>"><img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:50px;height:50px">
				<input type="text" value=<%=shoe.getShoes_id() %> id="shoes_id" name="shoes_id" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;"></a></td>
				
				<td><label><%=shoe.getName() %></label></td>
				<td class="number small-bold-red"><span><input type="text" value=<%=cart.getSize() %> name="size" id="size" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent; width:80px"></span></td>
				<td class="number small-bold-red"><span><input type="text" value=<%=cart.getColor() %> name="color" id="color" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;width:80px"></span></td>
				<td class="number small-bold-red"><span><input type="text" value=<%=shoe.getPrice() %> name="oneprice" id="oneprice" readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;width:80px"></span></td>
				<td class="input-group">
					<span class="input-group-addon minus button"><input type="button" onclick="numminus(this)" id="minus" name="minus" value="-"></span>
					<input type="text" class="number form-control input-sm" id="num" name="num" value="1" />
					<span class="input-group-addon plus" ><input type="button" onclick="numplus(this)" id="plus" name="plus" value="+"></span>
				</td>
				<td class="subtotal number small-bold-red"><input type="text" readonly="readonly" id="subtotal" name="subtotal" value=<%=shoe.getPrice()%> readonly="readonly" style="border:none;BACKGROUND-COLOR: transparent;width:100px"></td>
				<td class="operation"><input type="button" class="delete btn btn-xs btn-primary" value="Remove" name="btn" value="btn" onclick="removecart(this)"></td>
				<td ><input type="hidden" name="price" id="price" value=<%=shoe.getPrice() %>></td>
				<td ><input type="hidden" name="seller_id" id="seller_id" value=<%=shoe.getSeller_id() %>></td>
			</tr>
			<%
count_line++;			
} %>
		</tbody>
	</table>

	<div class="row">
		<div class="col-md-12 col-lg-12 col-sm-12">
			<div style="border-top:1px dotted gray;padding:4px 10px;">
				<div style="margin-left:20px;" class="pull-right total">
					<label>Total Price:$<span class="currency">$</span><span id="priceTotal" class="large-bold-red">
	<input type="text" readonly="readonly" style="border:none;" id="totprice" name="totprice" value="">
	</span></label>
				</div>
				<div class="pull-right">
					<label>You choose<span id="itemCount" class="large-bold-red" style="margin:0 4px;">
					<input type="text" readonly="readonly" style="border:none; width:40px" id="subnum" value="">
					</span>kinds of shoes，In total<span id="qtyCount" class="large-bold-red" style="margin:0 4px;">
					<input type="text" readonly="readonly" style="border:none; width:40px" id="totnum" value="">
					</span>pairs</label>
				</div>
				<div class="pull-right selected" id="selected">
					<span id="selectedTotal"></span>
				</div>
			</div>
		</div>
		<input type="hidden" value=<%=session.getAttribute("uid") %> name="uid">
		<input type="submit" class="btn btn-primary pull-right" value="Proceed to Check Out">
	</div>
	 </form>
	 </div>
</body>
</html>