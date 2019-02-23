<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Welcom</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style type="text/css">
      
      .choose {
       width:fit-content;
       height:30px;
       color:black;
       margin-left:50px;
       margin-top:8px;
       margin-bottom:8px;
       float:left;
       display:none;
      }
 	   .choosebrand {
       width:fit-content;
       height:30px;
       color:black;
       margin-left:50px;
       margin-top:8px;
       margin-bottom:8px;
       border:1px dotted grey;
       float:left;
      }
       .choosestyle {
       width:fit-content;
       height:30px;
       color:black;
       margin-left:50px;
       margin-top:8px;
       margin-bottom:8px;
       border:1px dotted grey;
       float:left;
      }
       .choosecolor {
       width:fit-content;
       height:30px;
       color:black;
       margin-left:50px;
       margin-top:8px;
       margin-bottom:8px;
       border:1px dotted grey;
       float:left;
      }
       .chooseprice {
       width:fit-content;
       height:30px;
       color:black;
       margin-left:50px;
       margin-top:8px;
       margin-bottom:8px;
       border:1px dotted grey;
       float:left;
      }
    </style>
<script type="text/javascript">
function search_shoes(){
	var shoes=document.getElementById("search").value;
	if(shoes==""){
		window.alert("please insert some key words of what you want");
		return false;
	}
	else{
		document.getElementById("fm").action="./search";
		document.getElementById("fm").submit();
	}
}

function showsearch(){
	document.getElementById("search").value="";
	document.getElementById("select_result").style.display="block";
}

function addsearch(obj){
	showsearch();
	var oldDiv = document.getElementById("accordion");
	var ooClass = oldDiv.getElementsByClassName("choosebrand");
	var text=$(obj).text();
	if(ooClass.length==0){
	var newDiv = document.createElement("div");
	newDiv.className = "choosebrand";
	newDiv.id="brand_search";
	newDiv.innerHTML = "<h5>Brand:&nbsp;&nbsp;"+text+"&nbsp;&nbsp;<a><span class=\"glyphicon glyphicon-remove\"></span></a></h5> ";
	
	var ooDiv = document.getElementById("select_result");
	    oldDiv.insertBefore(newDiv, ooDiv);
	    }
	else{
		document.getElementById("brand_search").innerHTML = "<h5>Brand:&nbsp;&nbsp;"+text+"&nbsp;&nbsp;<a><span class=\"glyphicon glyphicon-remove\"></span></a></h5> ";
	}
	 $("#brand").val(text);
	sessionStorage.setItem("brand",text);//设置session
}

function stylesearch(obj){
	var oldDiv = document.getElementById("accordion");
	var ooClass = oldDiv.getElementsByClassName("choosestyle");
	var text=$(obj).text();
	if(ooClass.length==0){
	var newDiv = document.createElement("div");
	newDiv.className = "choosestyle";
	newDiv.id="style_search";
	newDiv.innerHTML = "<h5>Style:&nbsp;&nbsp;"+text+"&nbsp;&nbsp;<a><span class=\"glyphicon glyphicon-remove\"></span></a></h5> ";
	
	var ooDiv = document.getElementById("select_result");
	    oldDiv.insertBefore(newDiv, ooDiv);
	}
	else{
		document.getElementById("style_search").innerHTML = "<h5>Style:&nbsp;&nbsp;"+text+"&nbsp;&nbsp;<a><span class=\"glyphicon glyphicon-remove\"></span></a></h5> ";
	}
	 $("#style").val(text);
}

function colorsearch(obj){
	var oldDiv = document.getElementById("accordion");
	var ooClass = oldDiv.getElementsByClassName("choosecolor");
	var text=$(obj).text();
	if(ooClass.length==0){
	var newDiv = document.createElement("div");
	newDiv.className = "choosecolor";
	newDiv.id="color_search";
	newDiv.innerHTML = "<h5>Color:&nbsp;&nbsp;"+text+"&nbsp;&nbsp;<a><span class=\"glyphicon glyphicon-remove\"></span></a></h5> ";
	
	var ooDiv = document.getElementById("select_result");
	    oldDiv.insertBefore(newDiv, ooDiv);
	}
	else{
		document.getElementById("color_search").innerHTML = "<h5>Color:&nbsp;&nbsp;"+text+"&nbsp;&nbsp;<a><span class=\"glyphicon glyphicon-remove\"></span></a></h5> ";
	}
	 $("#color").val(text);
}

function pricesearch(obj){
	var oldDiv = document.getElementById("accordion");
	var ooClass = oldDiv.getElementsByClassName("chooseprice");
	var text=$(obj).text();
	if(ooClass.length==0){
	var newDiv = document.createElement("div");
	newDiv.className = "chooseprice";
	newDiv.id="price_search";
	newDiv.innerHTML = "<h5>Price:&nbsp;&nbsp;"+text+"&nbsp;&nbsp;<a><span class=\"glyphicon glyphicon-remove\"></span></a></h5> ";
	
	var ooDiv = document.getElementById("select_result");
	    oldDiv.insertBefore(newDiv, ooDiv);
	}
	else{
		document.getElementById("price_search").innerHTML = "<h5>Price:&nbsp;&nbsp;"+text+"&nbsp;&nbsp;<a><span class=\"glyphicon glyphicon-remove\"></span></a></h5> ";
	}
	 $("#price").val(text);
}

function searchnow(){
	var fm=document.getElementById("searchfm");
	fm.submit();
	  //$('#mainContent').load("advance_search");
}
</script>
</head>

<body>
<nav class="navbar navbar-default" role="navigation" style="margin-bottom:0px">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Sneaker Bar</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="./my_information.jsp"><span class="glyphicon glyphicon-user"></span> Hello,<%=session.getAttribute("uid").toString()%></a></li>
      <li><a href="./login.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
    <ul class="nav nav-pills">
    <li class="active"><a href="./home.jsp">Home</a></li>
    <li><a href="./search?search=">Products</a></li>
    <li><a href="./cart.jsp">Cart</a></li>
    <li><a href="./deals.jsp">Deals</a></li>

    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        My Account <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
        <li><a href="./cart.jsp">Cart</a></li>
        <li><a href="#">Saves</a></li>
        <li><a href="./my_order.jsp">Orders</a></li>
        <li class="divider"></li>
        <li><a href="./my_information.jsp">Account Information</a></li>
        <li><a href="./my_information.jsp">Message<span class="badge" style="margin-left:10px">3</span></a></li>
      </ul>
    </li>
    <li><a href="./show_coupon">Coupon</a></li>
  </ul>
  </div>

  
     <div class="container-fluid" style="margin-bottom:20px">
    <form  method="get" class="bs-example bs-example-form" role="form" name="fm" id="fm" style="margin-left:20%">
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="serch what you want" name="search" id="search">
                   <span class="input-group-btn">
                        <button class="btn btn-default" onclick="search_shoes()" >Go!</button>
                    </span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div><!-- /.row -->
    </form>
     </div> 
     
     <div class="panel-group" id="accordion" style="border:none;color:#337ab7;margin-bottom:0px">
      <div class="panel panel-default">
             <div class="panel-heading" >
                   <h4 class="panel-title" style="margin-left:50px">Advanced Search ---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <a data-toggle="collapse" data-parent="#accordion"
                             href="#collapseOne">
                               Brands
                          </a>
                           <a data-toggle="collapse" data-parent="#accordion"
                             href="#collapseTwo" style="margin-left:50px">
                                Styles
                          </a>
                          <!--
                          <a data-toggle="collapse" data-parent="#accordion"
                             href="#collapseThree" style="margin-left:50px">
                               Colors
                          </a>
                          -->
                            <a data-toggle="collapse" data-parent="#accordion"
                             href="#collapseFour" style="margin-left:50px">
                               Price
                          </a>
                   </h4>
             </div>
           
             <div id="collapseOne" class="panel-collapse collapse">
                  <div class="panel-body" style="margin-left:50px;height:60px;">
                          <ul class="nav nav-pills">
  							<li><a href="#" onclick="addsearch(this)">Nike</a></li>
  							<li><a href="#" onclick="addsearch(this)">Adidas</a></li>
 						    <li><a href="#" onclick="addsearch(this)">Puma</a></li>
 						    <li><a href="#" onclick="addsearch(this)">UnderArmour</a></li>
 						    <li><a href="#" onclick="addsearch(this)">NewBalance</a></li>
  							<li><a href="#" onclick="addsearch(this)">Asics</a></li>
  							<li><a href="#" onclick="addsearch(this)">NorthFace</a></li>
  							<li><a href="#" onclick="addsearch(this)">Timberland</a></li>
  							<li><a href="#" onclick="addsearch(this)">Columbia</a></li>
  							<li><a href="#" onclick="addsearch(this)">Fila</a></li>
  							<li><a href="#" onclick="addsearch(this)">Levis</a></li>
  							<li><a href="#" onclick="addsearch(this)">Converse</a></li>
  							<li><a href="#" onclick="addsearch(this)">Skechers</a></li>
  							<li><a href="#" onclick="addsearch(this)">Reebok</a></li>
  							<li><a href="#" onclick="addsearch(this)">Champion</a></li>
  							<li><a href="#" onclick="addsearch(this)">Others</a></li>
						 </ul>
                   </div>
             </div>
             
             <div id="collapseTwo" class="panel-collapse collapse">
                   <div class="panel-body" style="margin-left:50px">
                          <ul class="nav nav-pills">
  							<li><a href="#" onclick="stylesearch(this)">Sports</a></li>
  							<li><a href="#" onclick="stylesearch(this)">Popular</a></li>
  							<li><a href="#" onclick="stylesearch(this)">Outdoor</a></li>
 						    <li><a href="#" onclick="stylesearch(this)">Gym</a></li>
 						    <li><a href="#" onclick="stylesearch(this)">Sandals</a></li>
  							
						 </ul>
                   </div>
             </div>
             
             <!--  
             <div id="collapseThree" class="panel-collapse collapse">
                   <div class="panel-body" style="margin-left:50px">
                          <ul class="nav nav-pills">
  							<li><a href="#" onclick="colorsearch(this)">White</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Black</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Red</a></li>
 						    <li><a href="#" onclick="colorsearch(this)">Yellow</a></li>
 						    <li><a href="#" onclick="colorsearch(this)">Pink</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Brown</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Grey</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Blue</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Green</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Gold</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Purple</a></li>
  							<li><a href="#" onclick="colorsearch(this)">Others</a></li>
						 </ul>
                   </div>
             </div>
             -->
             <div id="collapseFour" class="panel-collapse collapse">
                    <div class="panel-body" style="margin-left:50px">
                          <ul class="nav nav-pills">
  							<li><a href="#" onclick="pricesearch(this)">Under $30</a></li>
  							<li><a href="#" onclick="pricesearch(this)">$30-$50</a></li>
  							<li><a href="#" onclick="pricesearch(this)">$50-$70</a></li>
  							<li><a href="#" onclick="pricesearch(this)">$70-$90</a></li>
  							<li><a href="#" onclick="pricesearch(this)">Over $90</a></li>
						 </ul>
                   </div>
             </div>     
      </div>
 			<div id="select_result" class="choose">
 						<button class="btn btn-info" onclick="searchnow()">Search Now</button>
             </div>
             
     <form action="./advance_search" method="post" id="searchfm">
     <input id="brand" name="brand" type="hidden" value="">
      <input id="style" name="style" type="hidden" value="">
      <input id="color" name="color" type="hidden" value="">
      <input id="price" name="price" type="hidden" value="">
     </form>
</div>
     
</nav>




</body>

</html> 