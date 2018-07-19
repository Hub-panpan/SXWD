<%@ page language="java" import="java.util.*" pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>书香味道</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta name="author" content="" />
    <!--外部样式表 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/buttons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/flat.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css">
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
                      <!--<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>-->
    <!--[endif]->
  <!-- Le fav and touch icons -->
    <style>

        #wrapper{
            margin-top: 50px;/*距离上导航条的距离*/
        }
        #wrapper2{
            margin-top: 50px;/*距离上导航条的距离*/
        }
    </style>
</head>
<body>


<!--这是导航-->
<div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                </button>

                <a href="${pageContext.request.contextPath}/memberupdateinfo.jsp">
                <button type="button" class="navbar-toggle collapsed">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="glyphicon glyphicon-user"></span>
                </button></a>
                <a class="navbar-brand" href="#">书香味道</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                 <c:if test="${active_user.getMember_name()==null}">
                    <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">主页</a></li>
                    <li><a href="#">我要点餐</a></li>
                    <li><a href="#">已选餐点</a></li>
                    <li><a href="#">订单管理</a></li>
                    <li><a href="#">最新活动</a></li>
                    <li><a href="#">联系我们</a></li>
                  
                    
                   
		                    <li><a href="${pageContext.request.contextPath}/memberlogin.jsp">
		                    <span class="glyphicon glyphicon-user" style="background-color: black;"></span>&nbsp;&nbsp;吃货点我</a></li>
			                     <li><a href="${pageContext.request.contextPath}/admin/Adminlogin.jsp">
		                    <span class="glyphicon glyphicon-record" style="background-color: black;"></span>&nbsp;&nbsp;管理点我</a></li>
		                    
                    </c:if>
                    
                     <c:if test="${active_user.getMember_name()!=null}">
	                      
	                       <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">主页</a></li>
		                    <li><a href="${pageContext.request.contextPath}/order_breakfast.jsp">我要点餐</a></li>
		                     <li><a href="cart-showSingalcart.do?mem_id=${active_user.member_phone}">已选餐点</a></li>
		                    <li><a href="order-order.do?mem_id=${active_user.member_phone}">订单管理</a></li>
		                    <li><a href="${pageContext.request.contextPath}/jionInVote.jsp">最新活动</a></li>
		                    <li><a href="#">联系我们</a></li>
	                      
	                      
	                      
	                      <li> <a href="${pageContext.request.contextPath}/memberupdateinfo.jsp"><span class="glyphicon glyphicon-user" style="background-color: black;"></span>
	                      ${active_user.getMember_name()}</a></li>
	                       <li><a href="member-logoff.do">注销</a></li>

                     </c:if>
                    
                   
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

</div>


<div>
    <div style="margin-top: 200px;">
    <small>
    		 
	<embed width="100%" height="100%" name="plugin" 
	src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_tr.swf" 
	type="application/x-shockwave-flash">
    </small>
    

  

	<!-- cript charset="Shift_JIS" src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_tr.js"></script-->
        <p class="text-center" style="text-align: center;font-size: 30px;
           z-index: 100000"><strong>专属你的书香味道</strong></p>
    </div>

</div>


<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized-init.js"></script>
</body>
</html>