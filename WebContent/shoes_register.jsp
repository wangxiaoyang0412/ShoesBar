<%@ page import="model.Shoes" %>
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
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
h1 {text-align:center;}
form {text-align:left;}
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
        margin: 0 auto 20px;
      }
      .form-group {
         margin: 0 auto 20px;
      }
p.sansserif{font-family:Arial,Helvetica,sans-serif;}
      

    </style>
<title>Shoes Register</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="page-header">
				<h1>
					Register What You Have <small></small>
				</h1>
				<grammarly>
					<div class="_1BN1N Kzi1t MoE_1 _2DJZN">
						<div class="_1HjH7">
							<div class="_3qe6h">
							</div>
						</div>
					</div>
				</grammarly>
			</div>
			<form role="form" action = "./insert_shoes" method = "post">
				<div class="form-group">
					 <label for="exampleInputEmail1">Shoes_id：</label><input type="text" class="form-control" id="exampleInputEmail1" name = "shoes_id"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">Name：</label><input type="text" class="form-control" id="exampleInputEmail1" name = "name"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">Size：</label><input type="text" class="form-control" id="exampleInputPassword1" name = "size"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">Amount：</label>  <input type="text" class="form-control" id="exampleInputEmail1" name = "amount"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">Color：</label>  <input type="text" class="form-control" id="exampleInputEmail1" name = "color"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">Brand：</label>  <input type="text" class="form-control" id="exampleInputEmail1" name = "brand"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">Style：</label>  <input type="text" class="form-control" id="exampleInputEmail1" name = "style"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">Gender：</label>  <input type="text" class="form-control" id="exampleInputEmail1" name = "gender"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">Price：</label>  <input type="text" class="form-control" id="exampleInputEmail1" name = "price"/>
				</div>
				</p>
				</p>
				
				<input type="submit" class="btn btn-lg btn-primary" value = "Submit" >
				<input type="hidden" class="btn btn-lg btn-primary" value = <%=session.getAttribute("store_id") %> name = "seller_id" >
				<a href="./Store_total_order.jsp" name="reg" class="btn btn-lg btn-primary" >Cancel</a>
				
			</form>
		</div>
	</div>
</div>

</body>
</html>