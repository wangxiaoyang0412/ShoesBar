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

</head> 
 <div id="loading"></div>
<body>
  
<div id="content">
 <jsp:include page="/menu.html" />
 
 
</div>

</body> 

</html> 