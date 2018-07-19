<%@page import="com.model.ShoppingCart"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../header.jsp"%>

    <div class="admin-biaogelist">

			<div class="listbiaoti am-cf">
				<ul class="am-icon-users">购物车管理
				</ul>

				<dl class="am-icon-home" style="float: right;">
					当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>>
					<a href="#">购物车管理</a>
				</dl>

				<dl>
				   <a href="cart-showAllCart.do"><button type="button"
							class="am-btn am-btn-success am-round am-btn-xs am-icon-plus">
						    购物车管理</button>
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
							<th class="table-check"><input type="checkbox" /></th>
							<th class="">购物车ID</th>
							<th class="">食物ID</th>
							<th class="">食物名称</th>
							<th class="">食物价格</th>
							<th class="">订购数量</th>
							<th class="">订购人ID</th>
							
							<th width="100px" class="table-set">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${searchAll!=null}">

 
							<%    List<ShoppingCart> rs = (List<ShoppingCart>)session.getAttribute("searchAll");      
                     			  for(ShoppingCart x : rs){
                 		     %>
							<tr>
								<td><input type="checkbox" /></td>
							
								<td><%=x.getCart_id() %></td>
								<td><%=x.getFood_id() %></td>
								<td><%=x.getFood_name() %></td>
								<td><%=x.getFood_price()     %></td>
								<td><%=x.getOrder_number()   %></td>
								<td><%=x.getMember_phone()      %></td>			
								<td>

									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
						
											<a href="remark-delete.do?rem_id=<%=x.getCart_id() %>"
												class="am-btn am-btn-default am-btn-xs am-text-danger am-round"
												title="删除此购物车记录"><span class="am-icon-trash-o"></span>
											</a>
										</div>
									</div>
								</td>
							</tr>
						
						<%
						} %>
					
						
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
                <p>版权所有@2017 书香味道 <a href="http://www.lvgaopan.com/"
						target="_blank" title="书香味道">书香味道</a>            
                </p>
            </div>


        </div>


<script src="${pageContext.request.contextPath}/admin/assets/js/amazeui.min.js">


</body>
</html>