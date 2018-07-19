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
                    <ul class="am-icon-users">修改会员信息</ul>

                    <dl class="am-icon-home" style="float: right;">当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>> <a href="#">修改会员信息</a></dl>

             
                </div>

                <form class="am-form am-g" action="admin-update02.do" method="post">

                
						<%
                      			  Member m= (Member)session.getAttribute("updateUser");
                        	
                        %>
                        
                        
                            <div class="form-group">
                                <label>会员手机号(不可更改)：</label>
                                <input  id="tel" name="tel" type="tel"  onblur="ischeckNum()" class="form-control" value="<%=m.getMember_phone() %>"  readonly="readonly" placeholder="密码">
                             
                            </div>
                            
                            <div class="form-group ">
                                <label for="password">修改新密码:</label>
                                <input  id="password" name="password" type="password" class="form-control" id="password" value="<%=m.getMember_password() %>" placeholder="密码">
                            </div>
                            <div class="form-group ">
                                <label for="password">重复密码:</label>
                                <input id="repassword"name="repassword" type="password" class="form-control" id="repassword" placeholder="重复密码">
                            </div>
                            <div class="form-group ">
                                <label for="usrname">用户名:</label>
                                <input name="username" type="text" class="form-control" value="<%=m.getMember_name() %>" id="name">
                            </div>

                            <div class="form-group ">
                                <label for="address">地址:</label>
                                <input name="address" type="text" class="form-control" id="address" value="<%=m.getMember_address() %>" placeholder="例如：科大4#425">
                            </div>
                            
                              <div class="form-group ">
                                <label for="points">积分:</label>
                                <input name="points" type="text" class="form-control" id="points" value="<%=m.getMember_points() %>" placeholder="谨慎修稿">
                            </div>
                            
                              <div class="form-group ">
                                <label for="rights">权限:</label>
                                <input name="rights" type="text" class="form-control" id="rights" value="<%=m.getMember_rights() %>" placeholder="谨慎修稿 ">
                            </div>
                            
                            <div class="am-form-group am-cf">
                                <div class="you">
                                    <p>
                                        <button type="submit" class="am-btn am-btn-success am-radius">
                                        	提交
                                        </button>
                                    </p>
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