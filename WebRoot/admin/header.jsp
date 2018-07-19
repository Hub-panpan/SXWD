<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js">


<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>书香味道后台管理系统</title>
    <meta name="description" content="这是一个通用的导航页面">
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
            
             <h3 class="am-icon-cart-plus"><em></em> <a href="#">购物车管理</a></h3>
            <ul>
                <li><a href="cart-showAllcart.do">购物车记录</a></li>             
            </ul>
                
             <h3 class="am-icon-cart-plus"><em></em> <a href="#">订单管理</a></h3>
            <ul>
                <li><a href="order-showAllOrder.do">全部列表</a></li>
                <li><a href="#">历史订单</a></li>
                <li><a href="#">未发货订单</a></li>
            </ul>
            
            
            
            
            <h3 class="am-icon-volume-up"><em></em> <a href="#">评论管理</a></h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/Remark/showRemark.jsp">评论列表</a></li> 
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
</div>

</body>
</html>
