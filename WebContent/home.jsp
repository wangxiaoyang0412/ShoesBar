<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<title>home</title>
<style type="text/css">
#loading{z-index:1;padding:5px 0 5px 29px;
background:url(image/load1.gif) no-repeat 10px top;left:50%;top:50%;width:180px;
position:fixed; height:200px}
</style>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script src="js/load.js"></script>
</head>
<div id="loading"></div>
<body>
<div id="content">
<jsp:include page="/menu_login_in.jsp" />
<div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="./image/sneaker2.jpg" alt="First slide" style="margin-left:18%; height:600px">
		</div>
		<div class="item">
			<img src="./image/sneaker3.jpeg" alt="Second slide" style="margin-left:18%;height:600px">
		</div>
		<div class="item">
			<img src="./image/sneaker4.jpeg" alt="Third slide" style="margin-left:18%;height:600px">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	</a>
</div> 

<jsp:include page="/bottom.jsp" />
</div>
</body>
</html>