<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ceshi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="${pageContext.request.contextPath}/stylesheet" href="css/supersized.css">
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <style>
        .row-self{
            padding-top: 50px;
        }
        .navbar-inverse{

        }
    </style>
  </head>
  
  <body>
  
                    

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a href="memberlogin.jsp">
                <button type="button" class="navbar-toggle collapsed">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="glyphicon glyphicon-user"></span>
                </button></a>
            <a class="navbar-brand" href="#">书香味道</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li ><a href="${pageContext.request.contextPath}/index.jsp">首  页</a></li>
                <!--  li><a  href="${pageContext.request.contextPath}/memberregister.jsp">注 册</a></li-->
                <li class="active"><a href="${pageContext.request.contextPath}/admin/Adminlogin.jsp">登 录</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container theme-showcase" role="main">

    <div class="row row-self page-container">
        <div class="col-md-4 col-md-offset-4">
                <div class="page-header">
           
                    <h2>请登录</h2>
                   
                  
                </div>
                <form name="" id="" action="admin-login.do" method="post">
                    <div class="form-group ">
                        <label>管理员户名</label>
                        <input id="admin_name" name="admin_name" type="text" class="form-control"  placeholder="管理员账号">
                         <p id="phoneInfo"></p>
                    </div>
                    <div class="form-group ">
                        <label for="admin_password">密码</label>
                        <input  id="admin_password" name="admin_password" type="password" class="form-control"   placeholder="管理员密码">
                        
                    </div>
                    
                    
                    <div class="form-group ">
                        <label for="admin_password">验证码：</label>
     					<input type="text" class="form-control" name="vcode">
     					<br>
                        <img src="CreateVilateCode.do"><a href="${pageContext.request.contextPath}/admin/Adminlogin.jsp">换一张</a> 
                       
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <p><input type="checkbox"> 记住我</p>
                        </div>
                        <div class="col-md-8">
                            <p class="text-right"><a href="">忘记密码?</a></p>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" >登录</button>
                 
                </form>
        </div>
     </div>
</div>

                    
                    
                    
                    
                    
  

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


    </body>


</html>
