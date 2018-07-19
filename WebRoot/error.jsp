<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>会员登录界面</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/supersized.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9] 用来解决IE8不支持的问题 不用管-->
    <![endif]-->
    <style>
        .jumbotron{
            margin-top: 50px;
        }
        .navbar-inverse{

        }
    </style>
</head>



<body onload="countDown()">

    <div class="container">

      <!-- Static navbar -->
     <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a href="/SXWD/memberlogin.jsp">
                <button type="button" class="navbar-toggle collapsed">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="glyphicon glyphicon-user"></span>
                </button></a>
                <a class="navbar-brand" href="#">书香味道</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">主页</a></li>
                    <li><a href="#">我要点餐</a></li>
                    <li><a href="#">已选餐点</a></li>
                    <li><a href="#">订单管理</a></li>
                    <li><a href="#">最新活动</a></li>
                    <li><a href="#">联系我们</a></li>
                    
		            <li><a href="memberlogin.jsp">
		            <span class="glyphicon glyphicon-user" style="background-color: black;"></span></a></li>
             
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h2><%=session.getAttribute("errormsg") %></h2>
      
        <p>
          <a id="time" class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/index.jsp" role="button">返回首頁 &raquo;</a>
        </p>
      </div>

    </div> <!-- /container -->






<script type="text/javascript"> 
var t = 5; 
function countDown(){ 
var time = document.getElementById("time"); 
t--; 
time.innerHTML=t+"秒后 返回首頁 &raquo;"; 
if (t<=0) { 


location.href="/SXWD/index.jsp"; 

clearInterval(inter); 
}; 
} 
var inter = setInterval("countDown()",1000); 
//window.onload=countDown; 
</script> 



<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized-init.js"></script>


</body>

</html>