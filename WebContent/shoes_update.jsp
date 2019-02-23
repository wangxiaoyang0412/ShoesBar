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
<title>Shoes Update</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="page-header">
				<h1>
					Update What You Have <small></small>
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
			<form role="form" action = "./shoes_do_update.jsp" method = "post">
				<div class="form-group">
					 <label for="exampleInputEmail1">Amount：</label>  <input type="text" class="form-control" id="exampleInputEmail1" name = "amount" value = <%=request.getParameter("amount") %> >
				</div>			
				
				<div class="form-group">
					 <label for="disabledTextInput">Size：</label><input type="text" class="form-control" id="disabledTextInput" name = "size" value = <%=request.getParameter("size") %> readonly>
				</div>
				<div class="form-group">
					 <label for="disabledTextInput">Color：</label><input type="text" class="form-control" id="disabledTextInput" name = "color" value = <%=request.getParameter("color") %> readonly>
				</div>
				
				<input type="hidden" class="btn btn-lg btn-primary" name="store_id" value = <%=request.getParameter("store_id") %> >	
				<input type="hidden" class="btn btn-lg btn-primary" name="shoes_id" value = <%=request.getParameter("shoes_id") %> >			
				</p>
				</p>
				<input type="submit" class="btn btn-lg btn-primary" value = "Submit" >				
				<a href="./show_stock.jsp" name="reg" class="btn btn-lg btn-primary" >Cancel</a>			
			</form>
		</div>
	</div>
</div>

</body>
</html>