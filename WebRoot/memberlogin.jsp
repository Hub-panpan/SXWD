<%@ page language="java" import="java.util.*" pageEncoding="UTF8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"\n";
System.out.print("登录页面的basePATH"+basePath+"\n");
System.out.print("登录页面的PATH"+path);
%>

<!DOCTYPE html>
<html lang="zh-CN">
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
        .row-self{
            padding-top: 50px;
        }
        .navbar-inverse{

        }
    </style>
</head>

<body role="document">


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
                <li><a  href="${pageContext.request.contextPath}/memberregister.jsp">注 册</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/memberlogin.jsp">登 录</a></li>
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
                <form name="" id="" action="member-login.do" method="post">
                    <div class="form-group ">
                        <label>用户名</label>
                        <input id="tel" name="tel" type="text" class="form-control" onblur="ischeckNum()" placeholder="手机号">
                         <p id="phoneInfo"></p>
                    </div>
                      <div class="form-group ">
                        <label for="password">密码</label>
                        <input  id="password" name="password" type="password" class="form-control" onblur="checkPassword()"  id="password" placeholder="密码">
                        
                    </div>
                  
                        
                    <div class="form-group ">
                        <label for="admin_password">验证码：</label>
     					<input type="text" class="form-control"name="vcode">
     					<br>
                        <img src="CreateVilateCode.do"><a href="memberlogin.jsp">换一张</a> 
                      
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
                    <a href="memberregister.jsp" class="btn btn-info" role="button">注册</a>
                </form>
        </div>
     </div>
</div>






<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized-init.js"></script>


<script>

   function ischeckNum()
        {
            var num = document.getElementById("tel").value;
            if( num )
            {
                if( /^1[34578]\d{9}$/.test(num) )
                {
                   document.getElementById("phoneInfo").innerHTML="手机号有效";
                    return false;
                }
                else
                {
                    document.getElementById("phoneInfo").innerHTML="请输入有效手机号";
                    document.getElementById('tel').value="";
                    document.getElementById('tel').focus();
                    return false;
                }
            }
            else
            {
              document.getElementById("phoneInfo").innerHTML="请输入有效手机号";
                document.getElementById('tel').focus();
            }
        }
    


    function checkPassword(){
       
        var password=document.getElementById("password").value;
        var repassword=document.getElementById("repassword").value;
        
		if(password==""){
		            document.getElementById("repasswordInfo").innerHTML="密码不能为空!";
		            document.getElementById("password").focus();
		            return false;
		        }
        if(password==repassword){
            document.getElementById("repasswordInfo").innerHTML="密码一致";
          
        }else{
         document.getElementById("repasswordInfo").innerHTML="密码不一致";
        }
         
        
    }
 
</script>
    </body>


</html>
