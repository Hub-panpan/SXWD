<%@ page language="java" import="java.util.*,com.model.*"	pageEncoding="utf8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<!--这是导航-->
	<%@ include file="header.jsp"%>




		<div class="jumbotron">
			<h2>投票名称       :    ${single_Vote.vote_name}</h1>
			<p class="lead">投票截止时间:${single_Vote.vote_date}</p>
			
		</div>




			<div style="width:60%;background:#b8e3a5;padding-top:20px;">
			
			  
			  
			  
				<form class="form-horizontal" action="member-iwanttovote.do" method="post">
				
				        <input type="hidden" name="mem_phone" value="${active_user.member_phone}" >
					    <input type="hidden" name="vo_id" value="${single_Vote.vote_id}" >
						<input type="hidden" name="vo_name" value=" ${single_Vote.vote_name}" >
				
					<div class="radio col-sm-offset-2 col-lg-6">
					
					 <c:forEach items="${oplist}" var="item">
						<label> 
						
						<input type="radio" name="op_value" id="optionsRadios1" value="${item.option_value}">
						
						 &nbsp;&nbsp;${item.option_value}
						 
						${item.option_content} 
						
						
						
						</label>			
				    </c:forEach>
					</div>


					<div class="form-group">
						<div class="col-lg-5"  style="margin-left:70px;padding-top:30px;">
						
						  <c:if test="${count_vote==null}">
						  		  <c:if test="${active_user.member_rights==2}">
						 				 <button type="submit" class="btn btn-lg btn-success">提交</button>
						 		 </c:if>
						 		 
						 		  <c:if test="${active_user.member_rights!=2}">
						 				 累计消费100元才会有投票权哦！目前您没投票权限！！
						 		 </c:if>
								     
					      </c:if>
							
							
							
						</div>
					</div>
					
					
					<div class="form-group" style="margin-left:20px;">
					 <c:if test="${count_vote!=null}">
								       <c:forEach items="${count_vote}" var="item">
										<div class="radio  col-lg-12"> ${item.option_value} &nbsp;&nbsp;${item.count} </div>
									    </c:forEach>
									    
									    亲，您已经投票！
					 </c:if>
					 
					  <c:if test="${count_vote==null}">
								      <p> 亲！投票之后才可以 查看结果哟！！ </p>
					 </c:if>
					
					
					</div>
				</form>
					
			
			
		
		</div>


		<footer class="footer">
			<p>&copy; 2016 Company, Inc.</p>
		</footer>

	</div>
	<!-- /container -->

	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>