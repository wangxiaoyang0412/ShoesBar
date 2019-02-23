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
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script src="js/load.js"></script>
<script type="text/javascript">
function submitnew(){
	document.fm2.submit();
}

function update(){
	document.fm.submit();
}

function check(btn){
	var fm=document.getElementById("data");
	if(typeof(fm.btn.length)!="undefined"){
		var index=-1;
		for(var i=0;i<fm.btn.length;i++){
			if(fm.btn[i]==btn){
				//window.alert(i);
				index=i;
				break;
			}
		}
		document.getElementById("state").value=fm.state1[index].value;
		document.getElementById("city").value=fm.city1[index].value;
		document.getElementById("street").value=fm.street1[index].value;
		document.getElementById("name").value=fm.name1[index].value;
		document.getElementById("phone").value=fm.phone1[index].value;
		document.getElementById("zipcode").value=fm.zipcode1[index].value;
		document.getElementById("num").value=fm.num1[index].value;
	}
	else{
		document.getElementById("state").value=fm.state1.value;
		document.getElementById("city").value=fm.city1.value;
		document.getElementById("street").value=fm.street1.value;
		document.getElementById("name").value=fm.name1.value;
		document.getElementById("phone").value=fm.phone1.value;
		document.getElementById("zipcode").value=fm.zipcode1.value;
		document.getElementById("num").value=fm.num1.value;
	}
}
</script>
</head> 
<div id="loading"></div>
<body> 
 <div id="content">
 <jsp:include page="/menu_login_in.jsp" />
 <div class="container-fluid">
 <div class="row">
     <div class="col-md-6" style="text-align:center;">
         <h2>Name</h2>
         <img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:150px;height:150px">
           <div class="row">
          <div class="col-md-12" style="text-align:left;">
         <h3>Hello Sneaker Bar Users, Enjoy the Most Preferential Price Now!</h3>
         <h4>You are the  Level VIP</h4>
         <h4>Account Balance:</h4>
         <br>
         <a href="#" class="btn btn-link">Reset your password</a>
         </div>
        </div>
      </div>

      <div class="col-md-6" style="border-left:1px dotted #00CCFF;">
         <h2>Mailing Address</h2>
         <div class="row">
         <form name="data" id="data">
         <%List<Address> all= Factory.getIEmpDAOInstance().find_AllMyAddress(session.getAttribute("uid").toString());
         Iterator<Address> iter=all.iterator();
         while(iter.hasNext()){
        	 Address address=iter.next();
         %>
         <div class="col-md-4 col-md-offset-1" style="text-align:center;margin-bottom: 30px;border:1px dotted gray; height:170px">
  		 <input type="hidden" id="state1" name="state1" value=<%=address.getState() %>>
  		 <input type="hidden" id="city1" name="city1" value=<%=address.getCity() %>>
  		 <input type="hidden" id="street1" name="street1" value=<%=address.getStreet() %>>
  		 <input type="hidden" id="name1" name="name1" value=<%=address.getName() %>>
  		 <input type="hidden" id="phone1" name="phone1" value=<%=address.getPhone() %>>
  		 <input type="hidden" id="zipcode1" name="zipcode1" value=<%=address.getZip_code() %>>
  		 <input type="hidden" id="num1" name="num1" value=<%=String.valueOf(address.getAddress_num()) %>>
         <h3><%=address.getState() %></h3>
         <h4><%=address.getCity() %>&nbsp;<%=address.getStreet() %>&nbsp;<%=address.getZip_code() %></h4>
         <h4><%=address.getName() %></h4>
         <h4><%=address.getPhone() %></h4>
          <input type="button" class="btn btn-link pull-right" name="btn" id="btn" value="edit" onclick="check(this)" data-target="#myModal" data-toggle="modal"  >
      
         <div class="col-md-1">
            </div>
            </div>
             <%} %>
             </form>
             </div>
             <button type="button" class="btn btn-info" data-target="#myModal2" data-toggle="modal">Add new address
              </button>
             </div>
  </div>
  
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   Edit your mailing address
                </h4>
            </div>
            <%Address add=(Address)request.getAttribute("address1"); %>
     <div class="modal-body">
    <form role="form" id="fm" name="fm" method="get" action="./addressinsert">
    <div class="form-group">
    <label for="name">State</label>
    <input type="text" class="form-control" id="state" name="state">
    </div>
	<div class="form-group">
    <label for="name">City</label>
    <input type="text" class="form-control" id="city" name="city">
    </div>
    <div class="form-group">
    <label for="name">Street</label>
    <input type="text" class="form-control" id="street" name="street">
    </div>
    <div class="form-group">
    <label for="name">Name</label>
    <input type="text" class="form-control" id="name" name="name" value=>
    </div>
	<div class="form-group">
    <label for="name">Phone</label>
    <input type="text" class="form-control" id="phone" name="phone">
    </div>
    <div class="form-group">
    <label for="name">Zip Code</label>
    <input type="text" class="form-control" id="zipcode" name="zipcode">
    </div>  
    <input type="hidden" name="uid" id="uid" value=<%=session.getAttribute("uid") %>>  
    <input type="hidden" name="num" id="num">         
     </form>
     </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">close
                </button>
                <a type="button" class="btn btn-primary" onclick="update()">
                   Confirm 
                </a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

  <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   Add your mailing address
                </h4>
            </div>
     <div class="modal-body">
    <form role="form" id="fm2" name="fm2" method="post" action="./addressinsert">
    <div class="form-group">
    <label for="name">State</label>
    <input type="text" class="form-control" id="state2" name="state2">
    </div>
	<div class="form-group">
    <label for="name">City</label>
    <input type="text" class="form-control" id="city2" name="city2">
    </div>
    <div class="form-group">
    <label for="name">Street</label>
    <input type="text" class="form-control" id="street2" name="street2">
    </div>
     <div class="form-group">
    <label for="name">Name</label>
    <input type="text" class="form-control" id="name2" name="name2">
    </div>
	<div class="form-group">
    <label for="name">Phone</label>
    <input type="text" class="form-control" id="phone2" name="phone2">
    </div>
    <div class="form-group">
    <label for="name">Zip Code</label>
    <input type="text" class="form-control" id="zipcode2" name="zipcode2">
    </div>   
    <input type="hidden" name="uid2" id="uid2" value=<%=session.getAttribute("uid") %>>   
     </form>
     </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">close
                </button>
                <button type="button" class="btn btn-primary" onclick="submitnew()">
                   Confirm 
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
  </div>
    </div>
</body> 
</html> 