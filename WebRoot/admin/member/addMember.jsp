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
                    <ul class="am-icon-users">增加新会员</ul>

                    <dl class="am-icon-home" style="float: right;">当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>> <a href="#">修改会员信息</a></dl>

             
                </div>

               <form action="admin-addMember.do" method="post" class="am-form am-g">
                            <div class="tm-form-inner">
                                <div class="form-group ">
                                    <label for="tel">联系电话</label>
                                    <p><small>* 联系电话用于接收送餐通知、短信验证、修改密码等，请务必填写真实联系电话。</small></p>
                                    <input name="tel" type="text" class="form-control" onblur="ischeckNum()" id="tel" >
                                    <p id="phoneInfo"></p>
                                </div>

                                <div class="form-group ">
                                    <label for="password">密码</label>
                                    <input name="password" type="password" class="form-control"  id="password" placeholder="密码（6~12位)">
                                    <p id=""></p>
                                </div>
                                <div class="form-group ">
                                    <label for="repassword">重复密码</label>
                                    <input name="repassword" type="password" class="form-control" onblur="checkPassword()" id="repassword" placeholder="密码（6~12位）">
                                    <p id="repasswordInfo"></p>
                                </div>

                                <div class="form-group ">
                                    <label for="usrname">用户名</label>
                                    <input name="username" type="text" class="form-control" onblur="checkName()" id="username">
                                    <p id="userInfo"></p>
                                </div>

                                <div class="form-group ">
                                        <label for="address">地址</label>
                                        <input name="address" type="text" class="form-control" id="address" onblur="checkAddr()" placeholder="例如：科大4#425">
                                        <p id="addrInfo"></p>
                                 </div>
              
                            </div>
                            
                            <div class="form-group ">
                                <label for="points">积分:</label>
                                <input name="points" type="text" class="form-control" id="points" value="" placeholder="谨慎修改">
                            </div>
                            
                              <div class="form-group ">
                                <label for="rights">权限:</label>
                                <input name="rights" type="text" class="form-control" id="rights" value="" placeholder="谨慎修改 ">
                            </div>
                            
                            <div class="form-group  text-center">
                                <button type="submit" name="submit" class="btn btn-success">点我提交</button>
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