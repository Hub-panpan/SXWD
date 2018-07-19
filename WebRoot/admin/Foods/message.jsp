<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传结果</title>
</head>


<body onload="countDown()"> 
<input type="text" readonly="true" value="5" id="time"/> 
    <center>
        <h2>${message}</h2>
    </center>
</body>

<script type="text/javascript"> 
var t = 5; 
function countDown(){ 
var time = document.getElementById("time"); 
t--; 
time.value=t; 
if (t<=0) { 


location.href="/SXWD/admin/adminindex.jsp"; 

clearInterval(inter); 
}; 
} 
var inter = setInterval("countDown()",1000); 
//window.onload=countDown; 
</script> 
</html>