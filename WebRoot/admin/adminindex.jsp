<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="header.jsp"%>

    <div class=" admin-content">
        <div class="admin">
            <!--这里是4个 是用来 显示-->     
            <div class="jumbotron" style="height: 90%;">
            <hr>
                <h2 style="text-align: center">${active_admin.getAdmin_name()} :欢迎回来</h2>
            </div>
            <div class="foods">              
                <p>版权所有@2017 书香味道 <a href="http://www.lvgaopan.com/"
						target="_blank" title="书香味道">书香味道</a>            
                </p>
            </div>


        </div>

    </div>


</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/admin/assets/js/amazeui.min.js"></script>
<!--<![endif]-->


</body>
</html>