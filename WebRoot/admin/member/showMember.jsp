<%@ page language="java" import="java.util.*,com.model.Member"	pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.print("什么路径这是："+path);
%>
<%@ include file="../header.jsp"%>

		<div class="admin-biaogelist">

			<div class="listbiaoti am-cf">
				<ul class="am-icon-users">会员管理
				</ul>

				<dl class="am-icon-home" style="float: right;">
					当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>>
					<a href="#">会员列表</a>
				</dl>

				<dl>
					<a href="addMember.jsp"><button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus">
						手动添加会员</button></a>
				</dl>
				<!--这里打开的是新页面-->


			</div>

			<!-- 这里是   显示会员的界面 -->

			<div class="soso am-form am-g ">
				<form action="admin-show.do" method="post">
				
					<p>
						<select name="find_value"
							data-am-selected="{btnWidth: 140, btnSize: 'sm', btnStyle: 'default'}">
							<option value="All">显示全部会员</option>
							<option value="member_phone">按照手机号查找</option>
							<option value="member_name">按照用户名查找</option>
							<option value="member_adress">按照用户查找</option>
							<option value="member_points">按照用户名积分查找</option>
							<option value="member_rights">按照会员权限查找</option>
						</select>

					</p>

					<p class="ycfg">
						<input name="search_input" type="text"
							class="am-form-field am-input-sm" placeholder="圆角表单域" />
					</p>
					<p>
						<button type="submit"
							class="am-btn am-btn-xs am-btn-default am-xiao">
							<i class="am-icon-search"></i>
						</button>
					</p>
					<c:if test="${mlist==null}">
					<p style="font-size:18px;padding-top:2px;padding-left:20px;">
				 	> > >  当前查询结果为空 !</p>
					 </c:if>
					 
					 
					 
		    		<c:if test="${mlist.size()!=0}">
			
                    <p style="font-size:18px;padding-top:2px;padding-left:20px;">查询结果如下： </p>
                    </c:if>
				</form>
				
				
			</div>
         

			<c:if test="${mlist!=null}">
	       
                <form class="am-form am-g">
					<table width="100%"
						class="am-table am-table-bordered am-table-radius am-table-striped">
						<thead>
							<tr class="am-success">
								<th class="table-check"><input type="checkbox" />
								</th>

								<th class="">ID</th>
								<th class="">手机号码</th>
								<th class="">密码</th>
								<th class=" ">用户名</th>
								<th class=" ">地址</th>
								<th>积分</th>
								<th class="">权限</th>
								<th width="100px" class="table-set">操作</th>
							</tr>
						</thead>
						<tbody>


                     <%
                     List<Member> rs = (List<Member>)session.getAttribute("mlist");      
                       for(Member m : rs){
                      %>


							<tr>
								<td><input type="checkbox" />
								</td>
                                <td>1</td>
								<td><%=m.getMember_phone() %></td>
								<td><a href="#"><%=m.getMember_password() %></a></td>
								<td><%=m.getMember_name() %></td>
								<td><%=m.getMember_address() %></td>
								<td class=""><%=m.getMember_points() %></td>
								<td class=""><%=m.getMember_rights() %></td>
								
								<td>

									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
										
					
										
											<a href="admin-update01.do?mem_id=<%=m.getMember_phone() %>" 
												class="am-btn am-btn-default am-btn-xs am-text-secondary am-round"
												title="修改订单"><span class="am-icon-pencil-square-o"></span></a>
												
												
											<a href="admin-delete01.do?mem_id=<%=m.getMember_phone() %>" 
												class="am-btn am-btn-default am-btn-xs am-text-danger am-round"
												title="删除订单"><span class="am-icon-trash-o"></span></a>
										</div>
									</div></td>
							</tr>
						<%
                        }
                         %>




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
						<li class="am-disabled"><a href="#">«</a>
						</li>
						<li class="am-active"><a href="#">1</a>
						</li>
						<li><a href="#">2</a>
						</li>
						<li><a href="#">3</a>
						</li>
						<li><a href="#">4</a>
						</li>
						<li><a href="#">5</a>
						</li>
						<li><a href="#">»</a>
						</li>
					</ul>


					<hr />

				</form>

			</c:if>

			
            <div class="foods">
                 
                <p>版权所有@2017 书香味道 <a href="http://www.lvgaopan.com/" target="_blank" title="书香味道">书香味道</a>
               
               </p>
                    
            </div>



		</div>

	</div>


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
	<script src="${pageContext.request.contextPath}/admin/assets/js/amazeui.min.js"></script>
	<!--<![endif]-->


</body>
</html>