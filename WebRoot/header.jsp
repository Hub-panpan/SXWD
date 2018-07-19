<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>书香味道点餐页面</title>
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta name="author" content="" />
        <!--外部样式表 -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/buttons.css" rel="stylesheet" />
        <link href="css/flat.css" rel="stylesheet" />
        <link href="css/font-awesome.css" rel="stylesheet" />
          <link href="css/bootstrop.min.css" rel="stylesheet" />
		<!-- link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" -->
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
                          <!--<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>-->
        <!--[endif]->
      <!-- Le fav and touch icons -->
        <style>

            .me{
                margin-top: 50px;padding: 0 200px;/*距离上导航条的距离*/
            }
            #me{
                margin-top: 50px;/*距离上导航条的距离*/
            }
        </style>
    </head>


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
                    <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">主页</a></li>
                    <li><a href="${pageContext.request.contextPath}/order_breakfast.jsp">我要点餐</a></li>
                    <li><a href="cart-showSingalcart.do?mem_id=${active_user.member_phone}">已选餐点</a></li>
                    <li><a href="order-order.do?mem_id=${active_user.member_phone}">订单管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/jionInVote.jsp">最新活动</a></li>
                    <li><a href="#">联系我们</a></li>


                    <c:if test="${active_user.getMember_name()==null}">
                        <li><a href="${pageContext.request.contextPath}/memberlogin.jsp">
                            <span class="glyphicon glyphicon-user" style="background-color: black;"></span></a></li>
                    </c:if>

                    <c:if test="${active_user.getMember_name()!=null}">

                        <li><a href="#"><span class="glyphicon glyphicon-user" style="background-color: black;"></span>
                                ${active_user.getMember_name()}</a></li>
                        <li><a href="member-logoff.do">注销</a></li>

                    </c:if>


                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

</div>
</html>
