<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Bootstrap 实例 - 响应式的列重置</title>

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="js/jquery.raty.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('#star').raty(
			{
            path:"image/img",
            number: 5, 
            starOff: 'star-off-big.png',
            starOn: 'star-on-big.png',
            hints: ['1', '2', '3', '4', '5'],
            size:24,
           
			target: '#result',
            targetKeep : true
				        });
	});
 </script>
</head>
<body>
<div id="star"></div>
<div id="result"></div>
</body>

</html>

