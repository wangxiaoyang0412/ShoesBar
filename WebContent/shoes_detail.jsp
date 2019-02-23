<%@ page import="model.Shoes" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="util.*" %>
<%@ page import="service.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function chechbtn(button){
		 
		var fm=document.getElementById('fm');
		if(typeof(fm.colors.length)!="undefined"){
		var index=-1;
		for(var i=0;i<fm.colors.length;i++){
			if(fm.colors[i]==button){
				//window.alert(i);
				index=i;
				break;
			}
		}
		var amount=document.getElementById('left_amount');
		document.getElementById('color').value=fm.colors[index].value;
		 $.ajax({
				         type: "GET",                           //传数据的方式
				         url: "./findstock",
				        
				        data: $('#fm').serialize(),      //传的数据  form表单 里面的数据
				         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
				         $("#left_amount").val(result);           //找到输入框 并且将result的值 传进去
				//alert(result);
				
				         }
				     });
		 document.getElementById('amount').style.display='';
		}
		
		else{
			var amount=document.getElementById('left_amount');
			document.getElementById('color').value=fm.colors.value;
			 $.ajax({
					         type: "GET",                           //传数据的方式
					         url: "./findstock",
					        
					        data: $('#fm').serialize(),      //传的数据  form表单 里面的数据
					         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
					         $("#left_amount").val(result);           //找到输入框 并且将result的值 传进去
					//alert(result);
					
					         }
					     });
			 document.getElementById('amount').style.display='';
			}
	}
	
	
	function addcart(){
		if(document.getElementById("fm").size.value==""){
			window.alert("please choose a size first");
			return;
		}
		if(document.getElementById("fm").color.value==""){
			window.alert("please choose a color first");
			return;
		}
		if(document.getElementById("left_amount").value==0){
		window.alert("Sorry, the stock of your choosed shoes is 0, choose other size or color!");
		return;
		}
		
		  $.ajax({
		         type: "GET",                           //传数据的方式
		         url: "./cart",
		        
		       data: $('#fm').serialize(),      //传的数据  form表单 里面的数据
		         success: function(result){       //传数据成功之后的操作   result是servlet传过来的数据  这个函数对result进行处理，让它显示在 输入框中
		        // $("#result").val(result);           //找到输入框 并且将result的值 传进去
				
		         }
		     });
		  }
	
	function validate(){
		if(document.getElementById("fm").size.value==""){
			window.alert("please choose a size first");
			return;
		}
		if(document.getElementById("fm").color.value==""){
			window.alert("please choose a color first");
			return;
		}
		if(document.getElementById("left_amount").value==0){
		window.alert("Sorry, the stock of your choosed shoes is 0, choose other size or color!");
		return;
		}
		
		document.getElementById("fm").action="./orderconfirm";
		document.getElementById("fm").submit();
	}
	</script>
</head>
<body>

<div class="container" >
<div class="row" >
<h2 style="margin-top:75px">Shoes Detail</h2>
<% 
Shoes shoe = Factory.getIEmpDAOInstance().findByShoesId(request.getParameter("shoes_id"));
%>
<div class="col-lg-6 col-sm-6">
  <h3 style="color:#337ab7"><%=shoe.getBrand() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=shoe.getName() %></h3>
  <div class="card" style="width:400px">
    <img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">$ <%=shoe.getPrice() %></h4>
      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
    </div>
  </div>
  </div>
  
  <div class="col-lg-6 col-sm-6">
  
 <h1>Blockquotes</h1>
  <p>The blockquote element is used to present content from another source:</p>
  <blockquote class="blockquote">
    <p>For 50 years, WWF has been protecting the future of nature. The world's leading conservation organization, WWF works in 100 countries and is supported by 1.2 million members in the United States and close to 5 million globally.</p>
    <footer class="blockquote-footer">From WWF's website</footer>
  </blockquote>
  <form class="form-inline" id="fm" method="get"  onsubmit="validate()">
   <div class="form-group">
   <label class="div-left">choose a size:&nbsp;</label>
    <select class="form-control" id="size" name="size" >
      <option value=""></option>
      <%
      HashMap<String, Integer> stocks=Factory.getIEmpDAOInstance().findShoes_Stock(shoe.getShoes_id(), shoe.getSeller_id());
		for (Entry<String, Integer> entry : stocks.entrySet()) {		
      %>
      <option value=<%=entry.getKey() %>><%=entry.getKey()%></option>
    <%} %>
    </select>
  
    <br>
    <br>
    
    <label>choose a color:&nbsp;</label>
    <%
    List<String> colors= Factory.getIEmpDAOInstance().getStockColor(shoe.getShoes_id(), shoe.getSeller_id());
    Iterator<String> iter=colors.iterator();
    while(iter.hasNext()){
    	String color=iter.next();
    %>
    <input type="button" class="btn btn-info" id="colors" name="colors" onclick="chechbtn(this)" value=<%=color %>>
    <%} %>
    <input type="text" id="color" name="color" value="" style="border:none">
     <input type="hidden" id="shoes_id" name="shoes_id" value=<%=request.getParameter("shoes_id") %>>
      <input type="hidden" id="uid" name="uid" value=<%=session.getAttribute("uid") %>>
    </div>
 
 <br><br>
 <div id="amount" style="display:none;">
 <label>left in stock:&nbsp;</label>
  <input type="text" id="left_amount" style="border:none;" value=""></input>
</div>
 <br>
<p><button type="submit" class="btn btn-primary">Buy it Now</button>&nbsp;
    <button type="button" class="btn btn-primary" onclick="addcart()" data-target="#myModal" data-toggle="modal">Add to Cart</button></p>
  <a type="button" class="btn btn-link">save</a>
    <button type="button" class="btn btn-link" data-target="#myModal" data-toggle="modal">review</button>
    </form>
    <p> <br> <br><a href="./store_shoe?storeid=<%=shoe.getSeller_id() %>" class="btn btn-link">seller:<%=shoe.getSeller_id() %>&nbsp;&nbsp;&nbsp;&nbsp;watch the seller more products</a></p>
 </div>
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Buy it now!
                </h4>
            </div>
            <div class="modal-body">
                You selected shoes have been added to your cart
                            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">close
                </button>
                <a type="button" class="btn btn-primary" href="./cart.jsp">
                   Go to my cart
                </a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</div>
  
</div>
</body>
</html>