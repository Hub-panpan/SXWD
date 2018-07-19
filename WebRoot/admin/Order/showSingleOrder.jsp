<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@page import="com.model.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../header.jsp"%>

<div class=" admin-content">
	<div class="admin">

		<div class="admin-biaogelist">

			<div class="listbiaoti am-cf">
				<ul class="am-icon-users">显示订单信息
				</ul>

				<dl class="am-icon-home" style="float: right;">
					当前位置：
					<a href="${pageContext.request.contextPath}/admin/adminindex.jsp">
						首页 </a>>
					<a href="#">显示订单详情</a>
				</dl>


			</div>

			<form action="" method="" class="am-form am-g">

				<div class="form-group ">
					<%
                                  List<ShoppingOrder> rs = (List<ShoppingOrder>)session.getAttribute("single_order");      
                     			  for(ShoppingOrder x : rs){
                                 %>


					<label for="">食物ID : <%=x.getFood_id() %></label><br> <label
						for="">食物名称 : <%=x.getFood_name() %></label><br> <label
						for="">食物价格 ：<%=x.getFood_price() %></label><br> <label
						for="">订单标号 ：<%=x.getOrder_code() %></label><br> <label
						for="">目前状态 ：<%=x.getOrder_state() %></label><br> <label
						for="">下单时间 ：<%=x.getOrder_date() %></label><br>

					<hr>

					<%} %>
				</div>



			</form>

			<div class="foods">

				<p>
					版权所有@2017 书香味道 <a href="http://www.lvgaopan.cn/SXWD/index.jsp"
						target="_blank" title="书香味道">书香味道</a>

				</p>

			</div>
		</div>

	</div>


</div>

</div>

<script src="admin/assets/js/amazeui.min.js"></script>


</body>
</html>