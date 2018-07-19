<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@page import="com.model.Member"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../header.jsp"%>

    <div class=" admin-content">
        <div class="admin">

            <div class="admin-biaogelist">

                <div class="listbiaoti am-cf">
                    <ul class="am-icon-users">显示投票详情</ul>

                    <dl class="am-icon-home" style="float: right;">当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>> <a href="#">显示投票详情</a></dl>

             
                </div>

               <form action="" method="" class="am-form am-g">
                          
                                <div class="form-group ">
                                    <label for="">本投票ID  :   ${single_Vote.vote_id}</label><br>
                                    <label for="">新投票名称       :    ${single_Vote.vote_name}</label><br>
                                    <label for="">投票有效毫秒数   ：${single_Vote.vote_mesl}</label><br>
                                    <label for="">投票日期   ：${single_Vote.vote_date}</label><br>     
                                    
                                    <a href="${pageContext.request.contextPath}/admin/Vote/addOption.jsp?id=${single_Vote.vote_id}"><button type="button"		
                                    		class="am-btn am-btn-success am-round am-btn-xs am-icon-plus">
											您还可以再添加新选项：</button>
					</a>
                                              
                                </div>
			<hr>目前投票结果统计如下：
                                 <div class="form-group ">
                                  <table>
                             <tr><td>选项详情显示如下：</td></tr>  
                                <c:forEach items="${oplist}" var="item">
                               
						            <tr><td>&nbsp;${item.option_value}</td><td>&nbsp;${item.option_content}&nbsp;</td>
						             <td>&nbsp;数据库选项id:${item.option_id}&nbsp;</td><td>&nbsp;所属投票：${item.vote_id}号&nbsp;</td></tr>
						          
						        </c:forEach>
						      
						        <c:forEach items="${countinfo}" var="item">
										<div class="radio  col-lg-12"> ${item.option_value} &nbsp;&nbsp;累计${item.count}票</div>
								</c:forEach>
                               
                                
                                
                                
                                
                                
                                   </table>
                                    </div>       
                              <hr>
                                          
	                       
                             
                        </form>

            <div class="foods">
                 
                <p>版权所有@2017 书香味道 <a href="http://www.lvgaopan.com/" target="_blank" title="书香味道">书香味道</a>
               
               </p>
                    
            </div>
  </div>

        </div>


    </div>

</div>

<script src="admin/assets/js/amazeui.min.js"></script>


</body>
</html>