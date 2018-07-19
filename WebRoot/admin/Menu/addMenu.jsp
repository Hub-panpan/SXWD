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
                    <ul class="am-icon-users">增加窗口</ul>

                    <dl class="am-icon-home" style="float: right;">当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>> <a href="#">增加窗口</a></dl>

             
                </div>

               <form action="menu-addMenu.do" method="post" class="am-form am-g">
                            <div class="tm-form-inner">
                                <div class="form-group ">
                                    <label for="menu_id">新增窗口编号</label>
                                    <p><small>* 窗口编号  例如：A</small></p>
                                    <input name="menu_id" type="text" class="form-control"  id="menu_id" placeholder="示例：A" >
                                    <p id="phoneInfo"></p>
                                </div>

                                <div class="form-group ">
                                    <label for="menu_name">新增窗口名称</label>
                                    <input name="menu_name" type="text" class="form-control"  id="menu_name" >
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