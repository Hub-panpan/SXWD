<%@ page language="java" import="java.util.*,com.model.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="header.jsp"%>
   

    最新活动！！

<div id="" class="viewer me">
    <div id="">
<form class="member-showSingleVote" action="" method="post">
				<table width="100%"	class="table">
					<thead>
						<tr class="am-success">
							<th class="table-check"><input type="checkbox" />
							</th>
							<th class="success">投票ID</th>
							<th class="">投票名字</th>
							<th class="">投票有效时间</th>
							<th class="">投票日期</th>
							<th width="100px" class="table-set">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${all_Vote_list!=null}">

							<%    List<Vote> rs = (List<Vote>)application.getAttribute("all_Vote_list");      
                     			  for(Vote x : rs){
                 		     %>
							<tr>
								<td><input type="checkbox" /></td>
								
								<td><%=x.getVote_id() %></td>
								<td><a href="member-showSingleVote.do?vo_id=<%=x.getVote_id() %>">
									<%=x.getVote_name() %>
									</a>
								</td>
								<td><%=x.getVote_mesl() %></td>
								<td><%=x.getVote_date() %></td>
								
								<td>

									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
										
										<a href="vote-showSingleVote.do?vo_id=<%=x.getVote_id() %>"
												 class="am-btn am-btn-default am-btn-xs am-text-success am-round"
												title="查看投票详情"><span class="am-icon-search"></span>
											</a> 
										
										
											<a href="vote-deleteVote.do?vo_id=<%=x.getVote_id() %>"
												class="am-btn am-btn-default am-btn-xs am-text-danger am-round"
												title="删除投票"><span class="am-icon-trash-o"></span>
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
				<hr />

			</form>
</div>
</div>
  </body>
  
  
  
  
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>
</html>



