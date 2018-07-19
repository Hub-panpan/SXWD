<%@page import="com.model.Menu"%>
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
                    <ul class="am-icon-users">修改窗口信息</ul>

                    <dl class="am-icon-home" style="float: right;">
             当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>> <a href="#">修改窗口信息</a></dl>

             
                </div>

               <form action="menu-update02.do" method="post" class="am-form am-g">

                
						<%
                      			  Menu m= (Menu)session.getAttribute("updateMenu");
   	
                        %>
                        
                       
                            <div class="tm-form-inner">
                                <div class="form-group ">
                                    <label for="menu_id">修改窗口编号</label>
                                    <input name="old_menu_id" value="<%=m.getMenu_id() %>" type="hidden">
                                    <input name="menu_id" type="text" class="form-control"  value="<%=m.getMenu_id() %>" id="menu_id" placeholder="示例：A01" >
                                    <p id="phoneInfo"></p>
                                </div>

                                <div class="form-group ">
                                    <label for="menu_name">修改窗口名称</label>
                                    <input name="menu_name" type="text" class="form-control" value="<%=m.getMenu_name() %>"  id="menu_name" >
                                    <p id=""></p>
                                </div>                     
	                           
	                            <div class="form-group  text-center">
	                                <button type="submit" name="submit" class="btn btn-success">点我提交</button>
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


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="admin/assets/js/amazeui.min.js"></script>
<!--<![endif]-->


</body>
</html>