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
				<ul class="am-icon-users">订单管理
				</ul>

				<dl class="am-icon-home" style="float: right;">
					当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>>
					<a href="#">订单列表</a>
				</dl>

				<dl>
				
			     	<a href="order-showAllOrder.do"><button type="button"
							class="am-btn am-btn-success am-round am-btn-xs am-icon-plus">
							更新订单</button>
					</a>
					
				</dl>
				<!--这里打开的是新页面-->
			</div>
				<form class="am-form am-g" action="" method="post">
				<table width="100%"
					class="am-table am-table-bordered am-table-radius am-table-striped">
					<thead>
						<tr class="am-success">
							<th class="table-check"><input type="checkbox" />
							</th>
							<th class="">ID</th>						
							<th class="">会员ID</th>
							<th class="">订单id</th>
							<th class="">订单状态</th>
							<th width="100px" class="table-set">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${all_order_code!=null}">
							<%    List<Code> rs = (List<Code>)session.getAttribute("all_order_code");      
                     			  for(Code x : rs){
                 		     %>
							<tr>
								<td><input type="checkbox" /></td>
								
								<td><%=x.getCode_id() %></td>
								<td><%=x.getMember_phone()%></td>
								<td><a href="order-showsingleOrder.do?or_id=<%=x.getOrder_code() %>&co_co=<%=x.getOrder_state() %>">
									<%=x.getOrder_code() %>
									</a>
								</td>
									<td><%=x.getOrder_state() %></td>
								<td>

									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<a href="order-update.do?co_id=<%=x.getOrder_code() %>"
												class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
												title="点我发货"><span class="am-icon-pencil-square-o"></span>
											</a> 
											<a href="order-delete.do?co_id=<%=x.getOrder_code() %>"
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