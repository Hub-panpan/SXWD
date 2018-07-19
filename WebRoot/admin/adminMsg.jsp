<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>书香味道后台管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/admin/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/admin/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/app.js"></script>
    <style>
        .sideMenu li  {          font-size: 16px;             }
        .sideMenu a   {          font-size: 16px;             }
        .admin-header {          background-color: #2a3542;   }
    </style>
</head>


<body onload="countDown()">

<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="${pageContext.request.contextPath}/admin/assets/i/logo.png"></div>
    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">
            <li class="soso">
                <p>
                    <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
                        <option value="b">全部</option>
                        <option value="o">产品</option>
                        <option value="o">会员</option>
                    </select>
                </p>
                <p class="ycfg"><input type="text" class="am-form-field am-input-sm" placeholder="圆角表单域"/></p>
                <p>
                    <button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button>
                </p>
            </li>
            <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen">
               <span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a>
            </li>
        </ul>
    </div>
</header>


<div class="am-cf admin-main">

    <div class="nav-navicon admin-main admin-sidebar">

		<!--  -->

	    <c:if test="${active_admin.getAdmin_name()==null}">
				<a href="/SXWD/admin/Adminlogin.jsp">登录</a>
		</c:if>
		<c:if test="${active_admin.getAdmin_name()!=null}">
		        <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;">
		        		欢迎系统管理员：${active_admin.getAdmin_name()}<a href="admin-logoff.do">注销</a>
		        </div>
       </c:if>
        <!--左边导航条开始的地方-->

        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">会员管理</a></h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/member/showMember.jsp">会员列表</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/member/addMember.jsp">添加新会员</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/member/showMember.jsp">修改会员信息</a></li>
            </ul>
            <h3 class="am-icon-cart-plus"><em></em> <a href="#">窗口管理</a></h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/Menu/showMenu.jsp">窗口列表</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/Menu/addMenu.jsp">添加新窗口</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/Menu/showMenu.jsp">修改窗口信息</a></li>
            </ul>
           <h3 class="am-icon-users"><em></em> <a href="#">菜品管理</a></h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/Menu/showMenu.jsp">菜品列表</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/Foods/addFood.jsp">添加新菜品</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/Foods/showFood.jsp">修改菜品信息</a></li>
            </ul>
             <h3 class="am-icon-volume-up"><em></em> <a href="#">评论管理</a></h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/Remark/showRemark.jsp">评论列表</a></li>

                <!-- <a href="${pageContext.request.contextPath}/admin/Remark/deleteRemark.jsp">删除评论</a></li-->
            </ul>
             <h3 class="am-icon-gears"><em></em> <a href="#">投票管理</a></h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/Vote/showAllvote.jsp">已有投票文章</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/Vote/newVote.jsp">发起新投票</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/Vote/showAllvote.jsp">查看当前投票结果</a></li>

            </ul>
        </div>
        <!-- sideMenu End -->


        <script type="text/javascript">
            jQuery(".sideMenu").slide({
                titCell: "h3", //鼠标触发对象
                targetCell: "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
                effect: "slideDown", //targetCell下拉效果
                delayTime: 300, //效果时间
                triggerTime: 150, //鼠标延迟触发时间（默认150）
                defaultPlay: false,//默认是否执行效果（默认true）
                returnDefault: true //鼠标从.sideMen移走后返回默认状态（默认false）
            });
        </script>

    </div>



    <div class=" admin-content">
        <div class="admin">
            <!--这里是4个 是用来 显示-->
           

            <div class="jumbotron" style="padding-left:250px;">
		        <h2>${msg}</h2>
		      
		        <p>
		          <a id="time" class="btn btn-lg btn-primary" href="javascript:history.back(-1)"  role="button">秒后 返回管理首页</a>
		        </p>
            </div>

            <div class="foods">
                 
                <p>版权所有@2017 书香味道 <a href="http://www.lvgaopan.com/" target="_blank" title="书香味道">书香味道</a>
               
               </p>
                    
            </div>


        </div>

    </div>


</div>


<script type="text/javascript"> 
var t = 4; 
function countDown(){ 
var time = document.getElementById("time"); 
t--; 
time.innerHTML=t+"秒后 返回管理首页 &raquo;"; 
if (t<=0) { 


location.href="/SXWD/admin/adminindex.jsp"; 

clearInterval(inter); 
}; 
} 
var inter = setInterval("countDown()",1000); 
//window.onload=countDown; 
</script> 
<script src="admin/assets/js/amazeui.min.js"></script>

</body>
</html>