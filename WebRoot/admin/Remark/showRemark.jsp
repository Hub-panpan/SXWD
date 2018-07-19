<%@page import="com.model.Remark"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				   <a href="remark-showAllRemark.do"><button type="button"
							class="am-btn am-btn-success am-round am-btn-xs am-icon-plus">
						     查看当前评论</button>
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
							<th class="">评论ID</th>
							<th class="">评论内容</th>
							<th class="">评论时间</th>
							<th class="">所属菜品</th>
							<th class="">评论人</th>
							<th class="">审核状态</th>
							<th width="100px" class="table-set">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${all_remark_list!=null}">

 
							<%    List<Remark> rs = (List<Remark>)session.getAttribute("all_remark_list");      
                     			  for(Remark x : rs){
                 		     %>
							<tr>
								<td><input type="checkbox" /></td>
							
								<td><%=x.getRemark_id() %></td>
								<td><a href="food-showsingleMenu.do?me_id=<%=x.getRemark_id() %>">
									<%=x.getRemark_content() %>
									</a>
								</td>
								<td><%=x.getRemark_date() %></td>
								<td><%=x.getFood_id()     %></td>
								<td><%=x.getMember_id()   %></td>
								<td><%=x.getIsPass()      %></td>			
								<td>

									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
										
										<%
										if(x.getIsPass()==0){
										
										}
										 
										 %>
										 
										 
										 
										 
										<c:if test="<%=x.getIsPass()==0 %>">
											<a href="remark-pass.do?rem_id=<%=x.getRemark_id() %>"
												class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
												title="点我通过审核"><span class="am-icon-pencil-square-o"></span>
											</a> 
										
										</c:if>
										
										
										
										<c:if test="<%=x.getIsPass()==1 %>">
											<a href="#"
												class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
												title="已经通过审核"><span class="am-icon-check-square"></span>
											</a> 
										
										</c:if>
											
											
											<a href="remark-delete.do?rem_id=<%=x.getRemark_id() %>"
												class="am-btn am-btn-default am-btn-xs am-text-danger am-round"
												title="删除此评论"><span class="am-icon-trash-o"></span>
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