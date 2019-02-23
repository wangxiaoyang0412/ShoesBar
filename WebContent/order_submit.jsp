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
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function submit_order(){
	document.getElementById("fm").submit();
}

function usecoupon(){
	var coupon=document.getElementById("coupon").value;
	 $.ajax({
			         type: "GET",                           
			         url: "./use_coupon?coupon="+coupon,
			         success: function(result){       
			 $("#dis_price").val(result);           
			var af_price=Number($("#tot_price").val())-Number($("#dis_price").val());
			 $("#after_price").val(af_price);
			         }
			     });
}
</script>
</head> 
<body> 
  <div class="container">
  <div class="row">

  <div class="col-sm-12 col-md-12 col-lg-12">
 <form class="form-horizontal" id="fm" role="form" method="get" action="./ordersubmit">
 <h3>Confirm Your Orders</h3>
 <% 
 	int numberi=Integer.parseInt(request.getAttribute("number").toString());
 int num=1;
 while(num<numberi){
 Orders order=(Orders)request.getAttribute("orders"+String.valueOf(num)); %>
                    <fieldset>
                        <legend>Shoes Detail</legend>
                       <div class="form-group">
                       <div class="col-sm-2">
                        <img class="card-img-top" src="https://static.runoob.com/images/mix/img_avatar.png" alt="Card image" style="width:100px;height:100px">
                        <%Shoes shoe=Factory.getIEmpDAOInstance().findByShoesId(order.getShoes_id());%>
                        <h5><%=shoe.getBrand() %>&nbsp;<%=shoe.getName() %>&nbsp;<%=shoe.getStyle() %></h5>
                       </div>
                        <div class="col-sm-5">
                          <label class="col-sm-4 control-label" for="ds_host">Unit Price</label>
                          <div class="col-sm-8">
                             <input class="form-control" id="ds_host" name="unit_price" type="text" value=<%=order.getUnit_price() %>>
                             <br>
                          </div>
                        
                          <label class="col-sm-4 control-label" for="ds_name">Size</label>
                          <div class="col-sm-8">
                             <input class="form-control" id="ds_name" type="text" value=<%=order.getSize() %>>
                          </div>
                       </div>
                       <div class="col-sm-5">
                          <label class="col-sm-4 control-label" for="ds_host">Amount</label>
                          <div class="col-sm-8">
                             <input class="form-control" id="ds_host" name="amount" type="text" value=<%=order.getItem_amount() %>>
                             <br>
                          </div>
                           <br>
                          <label class="col-sm-4 control-label" for="ds_name">Color</label>
                          <div class="col-sm-8">
                             <input class="form-control" id="ds_name" type="text" value=<%=order.getColor() %>>
                          </div>
                       </div>
                       </div>
                    </fieldset>   
            <%session.setAttribute("order"+String.valueOf(num), order);
                        		  session.setAttribute("num", num);
            num++;
               } 
 %>
                    
                     <fieldset>
                         <legend>Use Your Coupon</legend>
                        <div class="form-group">
                           <label for="disabledSelect"  class="col-sm-2 control-label">Coupon</label>
                           <div class="col-sm-8">
                              <select id="coupon" name="coupon" class="form-control" onchange="usecoupon()">
                               <option value="0">no</option>
                                <%List<String> coupon_ids=Factory.getIEmpDAOInstance().find_AllMyCoupon(session.getAttribute("uid").toString());
                        		   Iterator<String> iter1=coupon_ids.iterator();
                        		   while(iter1.hasNext()){
                        			   String coupon_id=iter1.next();
                        			   Coupon coupon=Factory.getIEmpDAOInstance().find_CouponById(coupon_id);
                        		   %>
                                 <option value=<%=coupon.getCoupon_id() %>><%=coupon.getName() %>;&nbsp;discount price:<%=coupon.getDiscount_price() %></option>
                                  <%} %>
                              </select>
                           </div>
                        </div>
                    </fieldset>
                    
                    <fieldset>
                         <legend>Select Your Mailing Address</legend>
                        <div class="form-group">
                           <label for="disabledSelect"  class="col-sm-2 control-label">Address</label>
                           <div class="col-sm-8">
                              <select id="address" name="address" class="form-control">
                               <%List<Address> addresses=Factory.getIEmpDAOInstance().find_AllMyAddress(session.getAttribute("uid").toString());
                        		   Iterator<Address> iter=addresses.iterator();
                        		   while(iter.hasNext()){
                        			   Address address=iter.next();
                        		   %>
                                 <option value=<%=address.address_num %>><%=address.getState() %>&nbsp;<%=address.getCity() %>&nbsp;<%=address.getStreet() %></option>
                                 <%} %>
                              </select>
                                
                           </div>
                        </div>
                    </fieldset>
                    
                       <fieldset>
                         <legend>Order  Information</legend>
                        <div class="form-group">
                           <div class="col-sm-6" style="float:right">
                             <label class="col-sm-4 control-label" for="ds_host">Total Price</label>
                          <div class="col-sm-8">
                             <input class="form-control" id="tot_price" type="text" value=<%=request.getAttribute("totmoney") %>>
                             <br>
                          </div>
                         
                            <label class="col-sm-4 control-label" for="ds_host">Discounted Price</label>
                          <div class="col-sm-8">
                             <input type="text" class="form-control" id="dis_price" name="dis_price" value="0">
                             <br>
                          </div>
                          
                          <label class="col-sm-4 control-label" for="ds_host" >Need to Pay</label>
                          <div class="col-sm-8">
                             <input class="form-control" id="after_price" name="after_price" type="text" value=<%=request.getAttribute("totmoney") %>>
                             <br>
                          </div>
                           </div>
                        </div>
                    </fieldset>
                    <div style="border-top:1px solid gray;padding:4px 10px;right-margin:30px;top-margin:20px">
                    <input type="hidden" name="uid" id="uid" value=<%=session.getAttribute("uid") %>>
                    <input type="button" class="btn btn-primary pull-right" value="Go to the Payment" onclick="submit_order()">
                    </div>
                </form>
  </div>
  </div>
  </div>
</body> 
</html> 