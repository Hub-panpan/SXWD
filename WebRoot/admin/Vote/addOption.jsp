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
                    <ul class="am-icon-users">添加新选项</ul>

                    <dl class="am-icon-home" style="float: right;">
                    
                   当前位置：<a href="${pageContext.request.contextPath}/admin/Vote/adminindex.jsp"> 首页 </a>> <a href="#">添加新选项</a></dl>

             
                </div>

               <form action="vote-addVoteOption.do" method="post" class="am-form am-g">
                            <div class="tm-form-inner">
                            
                              <div class="form-group "> 
                                    <label for="vote_id">投票ID</label>
                                    <input name="vote_id" type="text" class="form-control" readonly="readonly" value=" ${single_Vote.vote_id}" id="vote_id" >
                                    
                                </div>        
                                
                                <div class="form-group ">
                                    <label for="option_value">选项编号</label>
                                    <p><small>* 选项编号 例如：A B  a b</small></p>
                                   
                                    <input name="option_value" type="text" class="form-control"  id="option_value" >
                                    
                                </div>

                                <div class="form-group "> 
                                    <label for="option_content">新选项内容</label>
                                    <input name="option_content" type="text" class="form-control"  id="option_content" >
                                    
                                </div>        
                                
                               
	                           
	                            <div class="form-group  text-center">
	                                <button type="submit" name="submit" class="btn btn-success">点我提交 </button>
	                            </div>
                              </div>
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