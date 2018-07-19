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
                    <ul class="am-icon-users">发起新投票</ul>

                    <dl class="am-icon-home" style="float: right;">
               当前位置：<a href="${pageContext.request.contextPath}/admin/Vote/adminindex.jsp"> 首页 </a>><a href="#">
                    
                    发起新投票</a></dl>

             
                </div>

               <form action="vote-addvote.do" method="post" class="am-form am-g">
                            <div class="tm-form-inner">
                                <div class="form-group ">
                                    <label for="vote_id">新投票ID</label>
                                    <p><small>* 窗口编号  例如：vote01</small></p>
                                    <input name="vote_id" type="text" class="form-control"  id="menu_id" placeholder="可以不写 系统自动生成" >
                                    <p id="phoneInfo"></p>
                                </div>

                                <div class="form-group "> 
                                    <label for="vote_name">新投票名称</label>
                                    <input name="vote_name" type="text" class="form-control"  id="vote_name" >
                                    <p id=""></p>
                                </div>        
                                
                                <div class="form-group "> 
                                    <label for="vote_mesl">有效时间</label>
                                    <input name="vote_mesl" type="text" class="form-control"  id="vote_mesl" >
                                    <p><small>* 有效毫秒数</small></p>
                                    <p id=""></p>
                                </div>   
                                           
                                <div class="form-group">
							                <div class='input-group date-time' id='datetimepicker3'>
							                      <label for="vote_date">投票有效时间</label>
							                      
							                    <input  name="vote_date" type='date' class="form-control" placeholder="Pickup Date" />
					                   
							                </div>
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