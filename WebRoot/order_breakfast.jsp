<%@ page language="java" import="java.util.*,com.model.*"	pageEncoding="utf8"%>

<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="header.jsp"%>

<%!String current_menu_id;%>

<head>
    <style>
   
}
    </style>
</head>
<div id="wrapper" class="viewer">
	<div id="sidebar-wrapper">
		<div class="well sidebar-nav">
			<nav id="J_menuList" class="nav nav-list">
				<dl>


					<%
						List<Menu> rs = (List<Menu>)application.getAttribute("melist");      
					                     			  for(Menu x : rs){
					%>

					<dd class="active">
						<a href="food-page.do?page=1&me_id=<%=x.getMenu_id()%>"> <%=x.getMenu_name()%></a>

					</dd>
					<%
						}
					%>
				</dl>
			</nav>
		</div>
	</div>
	<div id="page-content-wrapper" class="" style="margin-top:50px">
		<div class="page-content">
			<div class="container">
			<div class="row">
				<%
					List<Foods> fo = (List<Foods>)application.getAttribute("index_foods");      					  
				                     			    for(Foods x : fo){
				                     			   current_menu_id= x.getMenu_id();
				%>
				<div class="col-md-4 column">
					<h2>
						<a style="color:black ;text-decoration:none;"
							href="food-showdetails.do?food_id=<%=x.getFood_id()%>"><%=x.getFood_id()%>套餐
							> </a>
					</h2>
					<img src="upload/food_img/<%=x.getFood_id()%>.jpg"
						class="img-responsive img-rounded" alt="Cinque Terre">
					<p>
						<a class="btn" href="#"> <%=x.getFood_name()%>>»</a><%=x.getFood_price()%>>元
					</p>
					<p style="padding-left: 25px">
						<!--  button type="submit" class="btn btn-primary" >加入购物车</button-->
						<a class="btn" id=<%=x.getFood_id()%> >加入购物车</a>
					</p>
				</div>
				<div class="modal" id="mymodal<%=x.getFood_id() %>">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">是否加入购物车</h4>
							</div>
							<div class="modal-body">
								<p>
									菜品ID:<%=x.getFood_id()%></p>
								<p>
									菜品名字:<%=x.getFood_name()%></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">我再想想</button>
								<a
									href="cart-addmembercart.do?fo_id=<%=x.getFood_id()%>&fo_na=<%=x.getFood_name() %>&fo_pr=<%=x.getFood_price()%>&mem_id=${active_user.member_phone}"><button
										type="button" class="btn btn-primary">是</button>
								</a>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->


				<%
					}
				%>
			</div>

			<c:if test="${pp.currentpage!=1 }">
				<a 
					href="food-page.do?page=${pp.currentpage-1}&me_id=<%=current_menu_id %>" >上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>

			<!-- 这里 做一个简单的判断 ：如果 当前页数   比总页数小 那么    下次 有点击事件时候 才会 出现下一页这个选项 -->
			<c:if test="${pp.currentpage<pp.totalpage}">
				<a
					href="food-page.do?page=${pp.currentpage+1}&me_id=<%=current_menu_id %>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
			一页显示${pp.count}条,当前第${pp.currentpage}页,共${pp.totalpage}页

		</div>

	</div>
</div>


	<footer class="footFix footLeft">
		<button id="myOrder" class="btn_change">
			菜篮子
			<!--span class="num">9</span-->
		</button>
	</footer>
</div>



<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script
	src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-transition.js"></script>
<script
	src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
<script>
	$(function() {
		$(".btn").click(function() {
			var id = $(this).attr("id");		
			$("#mymodal"+id).modal("toggle");				
		});
	});
</script>
</body>
</html>