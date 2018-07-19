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
                    <ul class="am-icon-users">增加选项按钮</ul>

                    <dl class="am-icon-home" style="float: right;">当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>><a href="#">增加选项按钮</a></dl>

             
                </div>

               <form action="menu-addMenu.do" method="post" class="am-form am-g">
                          
                                <div class="form-group ">
                                    <label for="menu_id">新投票ID</label><br>
                                    <label for="menu_name">新投票名称</label><br>
                                    <label for="menu_name">投票截止时间</label><br>
                                    <p><small>* 窗口编号  例如：vote01</small></p>                        
                                </div>
<hr>
                                 <div class="form-group ">
                                    <label for="menu_name">已有选项：</label>
                                    
                                    <p id="">asdfadfadfads</p>
                                </div>        
                                
                             
                              <hr>
                              
                              <div class="">
                            
										

							            	 <select class="form-control"  style="display:inline-block;width:80px;float：left;">
							            	 	<option value="">选项ID</option>
							            	 	<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
											</select>			 
							          
                                
                               
							               <input class="form-control"  type="text" style="display:inline-block;width:200px;float：left;">
							              <button type="submit" name="submit" class="btn btn-success">点我增加</button>
							            
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

<script>

   function ischeckNum()
        {
            var num = document.getElementById("tel").value;
            if( num )
            {
                if( /^1[34578]\d{9}$/.test(num) )
                {
                   document.getElementById("phoneInfo").innerHTML="手机号有效";
                    return false;
                }
                else
                {
                    document.getElementById("phoneInfo").innerHTML="请输入有效手机号";
                    document.getElementById('tel').value="";
                    document.getElementById('tel').focus();
                    return false;
                }
            }
            else
            {
              document.getElementById("phoneInfo").innerHTML="请输入有效手机号";
                document.getElementById('tel').focus();
            }
        }
    


    function checkPassword(){
       
        var password=document.getElementById("password").value;
        var repassword=document.getElementById("repassword").value;
        
		if(password==""){
		            document.getElementById("repasswordInfo").innerHTML="密码不能为空!";
		            document.getElementById("password").focus();
		            return false;
		        }
        if(password==repassword){
            document.getElementById("repasswordInfo").innerHTML="密码一致";
          
        }else{
         document.getElementById("repasswordInfo").innerHTML="密码不一致";
        }
         
        
    }
 
</script>
</body>
</html>