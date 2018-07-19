<%@ page language="java" import="java.util.*,com.model.*"   pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="header.jsp"%>
<div class="container theme-showcase" role="main">
    <div class="row row-self page-container">
        <div class="col-md-4 col-md-offset-4">
                <div class="page-header">
                <br>
                    <h2>会员信息修改页面</h2>                                   
                </div>
                <form name="" id="" action="member-updateselfinfo.do" method="post">                   
                             <div class="form-group ">
                                    <label for="tel">联系电话</label>
                                    <p><small>* 联系电话用于接收送餐通知、短信验证、修改密码等，请务必填写真实联系电话。</small></p>
                                    <input name="tel" type="text" class="form-control" onblur="ischeckNum()" id="tel"  value="${active_user.member_phone}">
                                    <p id="phoneInfo"></p>
                                </div>
                                <div class="form-group ">
                                    <label for="password">新密码</label>
                                    <input name="password" type="password" class="form-control"  id="password" value="${active_user.member_password}">
                                    <p id=""></p>
                                </div>                           
                                <div class="form-group ">
                                    <label for="usrname">用户名</label>
                                    <input name="username" type="text" class="form-control" onblur="checkName()" id="username" value="${active_user.member_name}">
                                    <p id="userInfo"></p>
                                </div>

                                <div class="form-group ">
                                        <label for="address">地址</label>
                                        <input name="address" type="text" class="form-control" id="address" onblur="checkAddr()" value="${active_user.member_address}">
                                        <p id="addrInfo"></p>
                                 </div>
                                 
                                 <div class="form-group ">
                                        <label for="points">余额(不可修改)</label>
                                        <input name="points" readonly="readonly" id="points" value="${active_user.member_points }" >
                                        <p id="addrInfo"></p>
                                 </div>
                                 
                               

                               <input name="rights" type="hidden"  id="rights" value="${active_user.member_rights }" >

                                 <hr>
                                        <div class="form-group  text-center">
	                                <button type="submit" name="submit" class="btn btn-success">点我提交</button>
	                            </div>
                            </div>
                         
                </form>
        </div>
     </div>
</div>




<script src="${pageContext.request.contextPath}/js/jquery.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>



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
    
    function checkName(){
       
        var username=document.getElementById("username").value;
        
        if(username==""){
                    document.getElementById("userInfo").innerHTML="用戶名不能为空!";
                    document.getElementById("username").focus();
                    return false;
                }
    }
      function checkAddr(){
       
        var address=document.getElementById("address").value;
        
        if(address==""){
                    document.getElementById("addrInfo").innerHTML="地址不能为空!";
                    document.getElementById("address").focus();
                    return false;
                }
    }
     
      
     
</script>
</body>
</html>