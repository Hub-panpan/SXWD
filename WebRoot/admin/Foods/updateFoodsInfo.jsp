<%@ page language="java" import="java.util.*,com.model.*" pageEncoding="utf8"%>
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
                    <ul class="am-icon-users">修改菜品信息</ul>

                    <dl class="am-icon-home" style="float: right;">当前位置：<a href="${pageContext.request.contextPath}/admin/Foods/adminindex.jsp"> 首页 </a>> <a href="#">修改菜品信息</a></dl>

             
                </div>

                <form action="food-update02.do" method="post" class="am-form am-g">

                
						<%
                      			  Foods m= (Foods)session.getAttribute("updateFood");
                        	
                        %>
                        
                       
                            <div class="tm-form-inner">
                                <div class="form-group ">
                                    <label for="food_id">修改食物ID</label>
                                    <input name="old_food_id" value="<%=m.getFood_id() %>" type="hidden">
                                    <input name="food_id" type="text" class="form-control"  value="<%=m.getFood_id() %>" id="food_id" placeholder="示例：A01" >
                                    <p id="phoneInfo"></p>
                                </div>
                               

                                <div class="form-group ">
                                    <label for="food_name">修改食物名称</label>
                                    <input name="food_name" type="text" class="form-control" value="<%=m.getFood_name() %>"  id="food_name" >
                                    <p id=""></p>
                                </div>  
                                <div class="form-group ">
                                    <label for="food_price">修改价格</label>
                                    <input name="food_price" type="text" class="form-control" value="<%=m.getFood_price() %>"  id="food_price" >
                                    <p id=""></p>
                                </div>
                                  <div class="form-group ">
                                    <label for="food_info">修改食物描述</label>
                                    <input name="food_info" type="text" class="form-control" value="<%=m.getFood_info() %>"  id="food_info" >
                                    <p id=""></p>
                                </div>  
                                 <div class="form-group ">
                                    <label for="isRemark">修改是否可评论</label>
                                    <input name="isRemark" type="text" class="form-control" value="<%=m.getIsremark() %>"  id="isRemark" >
                                    <p id=""></p>
                                </div>   
                                 <div class="form-group ">
                                    <label for="menu_id">修改所属窗口</label>
                                    <input name="menu_id" type="text" class="form-control" value="<%=m.getMenu_id() %>"  id="menu_id" >
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