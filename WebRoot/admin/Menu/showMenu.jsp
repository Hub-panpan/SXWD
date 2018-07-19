<%@ page language="java" import="java.util.*,com.model.*"
	pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../header.jsp"%>

		<div class="admin-biaogelist">

			<div class="listbiaoti am-cf">
				<ul class="am-icon-users">窗口管理
				</ul>

				<dl class="am-icon-home" style="float: right;">
					当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>>
					<a href="#">窗口列表</a>
				</dl>

				<dl>
				
			     	<a href="menu-showAllMenu.do"><button type="button"
							class="am-btn am-btn-success am-round am-btn-xs am-icon-plus">
							显示所有窗口</button>
					</a>
					
					
					<a href="addMenu.jsp"><button type="button"
							class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus">
							开辟新窗口</button>
					</a>
				</dl>
				<!--这里打开的是新页面-->


			</div>

			<!-- 这里是   显示直接显示窗口  menu-showMenu.do 实际上不需要 这个.do 的的界面 -->
			<!-- 实际上加载 数据 例如  ： 加载 栏目信息  或者说 加载 内容信息的时候  或者  加载首页的时候  我 们是在  监听器中 进行数据初始化操作 的 -->

			<form class="am-form am-g" action="" method="post">
				<table width="100%"
					class="am-table am-table-bordered am-table-radius am-table-striped">
					<thead>
						<tr class="am-success">
							<th class="table-check"><input type="checkbox" />
							</th>
							<th class="">ID</th>
							<th class="">窗口id</th>
							<th class="">窗口名称</th>
							<th width="100px" class="table-set">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${melist!=null}">

 
							<%    List<Menu> rs = (List<Menu>)application.getAttribute("melist");      
                     			  for(Menu x : rs){
                 		     %>
							<tr>
								<td><input type="checkbox" /></td>
								<td>1</td>
								<td><%=x.getMenu_id() %></td>
								<td><a href="food-showsingleMenu.do?me_id=<%=x.getMenu_id() %>">
									<%=x.getMenu_name() %>
									</a>
								</td>
								<td>

									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<a href="menu-update01.do?me_id=<%=x.getMenu_id() %>"
												class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
												title="修改订单"><span class="am-icon-pencil-square-o"></span>
											</a> 
											<a href="menu-delete01.do?me_id=<%=x.getMenu_id() %>"
												class="am-btn am-btn-default am-btn-xs am-text-danger am-round"
												title="删除订单"><span class="am-icon-trash-o"></span>
											</a>
										</div>
									</div>
								</td>
							</tr>
							<%
                            }
                            %>
						</c:if>
					</tbody>
				</table>

				<div class="am-btn-group am-btn-group-xs">
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-plus"></span> 删除
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 上架
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 下架
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 移动
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-plus"></span> 新增
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-save"></span> 保存
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-archive"></span> 移动
					</button>
					<button type="button" class="am-btn am-btn-default">
						<span class="am-icon-trash-o"></span> 删除
					</button>
				</div>

				<ul class="am-pagination am-fr">
					<li class="am-disabled"><a href="#">«</a></li>
					<li class="am-active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">»</a></li>
				</ul>
				<hr />

			</form>



			<div class="foods">

				<p>
					版权所有@2017 书香味道 <a href="http://www.lvgaopan.com/" target="_blank"
						title="书香味道">书香味道</a>

				</p>

			</div>
		</div>

	</div>

	<!--[if lt IE 9]>
<script src="../js/jquery.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/amazeui.min.js"></script>
	<!--<![endif]-->


</body>
</html>