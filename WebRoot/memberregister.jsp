 `<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>欢迎来到会员注册页面</title>

    <!-- Bootstrap -->
   	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        .row-self{
            padding-top: 50px;
        }
        .navbar-inverse {
        }
    </style>
    <style type="text/css">
        .drag{position: relative;width: 300px;height: 34px;background-color: #e8e8e8;line-height: 34px;}
        .bg{position: absolute;width: 40px;height: 100%;background-color: #7ac23c;}
        .text{position: absolute;width: 100%;margin: 0;text-align: center;}
        .btn1{align: center; position: absolute;width: 40px;height: 34px;background: #fff url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTEyNTVEMURGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTEyNTVEMUNGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2MTc5NzNmZS02OTQxLTQyOTYtYTIwNi02NDI2YTNkOWU5YmUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+YiRG4AAAALFJREFUeNpi/P//PwMlgImBQkA9A+bOnfsIiBOxKcInh+yCaCDuByoswaIOpxwjciACFegBqZ1AvBSIS5OTk/8TkmNEjwWgQiUgtQuIjwAxUF3yX3xyGIEIFLwHpKyAWB+I1xGSwxULIGf9A7mQkBwTlhBXAFLHgPgqEAcTkmNCU6AL9d8WII4HOvk3ITkWJAXWUMlOoGQHmsE45ViQ2KuBuASoYC4Wf+OUYxz6mQkgwAAN9mIrUReCXgAAAABJRU5ErkJggg==) center no-repeat;border: 1px solid #ccc;cursor: pointer;}
    </style>

</head>
<body role="document">

<!-- gray bg -->

<!-- Fixed navbar  导航条-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
        
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a href="${pageContext.request.contextPath}/memberlogin.jsp">
                <button type="button" class="navbar-toggle collapsed">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="glyphicon glyphicon-user"></span>
                </button></a>
            <a class="navbar-brand" href="#">书香味道</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li ><a href="${pageContext.request.contextPath}/index.jsp">首  页</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/memberregister.jsp">注 册</a></li>
                <li><a href="${pageContext.request.contextPath}/memberlogin.jsp">登 录</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container" id="more">
    <div class="row row-self">

        <div class="page-header">

        </div>
            <!-- 设置 个人和企业 列偏移是4 -->
        <div class="col-md-4 col-md-offset-4">

            <ul class="nav nav-tabs nav-justified" role="tablist" id="hotelCarTabs">
                <li role="presentation" class="active">
                    <a href="#person" aria-controls="person" role="tab" data-toggle="tab">个人注册</a>
                </li>
                <li role="presentation" >
                    <a href="#third" aria-controls="third" role="tab" data-toggle="tab">第三方登录</a>
                </li>
            </ul>

            <!-- Tab和个人注册 和 第三方登录界面开始 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="person">
                        <form action="" method="post" class="hotel-search-form" name="register">
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
                        <input id="repassword"name="repassword" type="password" class="form-control" id="repassword" onblur="checkPassword()"  placeholder="重复密码">
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
	                             <div class="drag">
	       						 <div class="bg"></div>
								 <p class="text">拖动滑块验证</p>
								 <div class="btn1"></div>
	    					     </div>
	    					     <hr>
                            </div>
                            <div class="form-group  text-center">
                            	<input type="button" class="btn btn-succsess" onclick="buttonClick()" value="点我提交">
                            </div>
                        </form>

                </div>
                
                <div role="tabpanel" class="tab-pane fade" id="third">
                    <div class="form-group  text-center">
                        <br>
                        <br>
                        <button type="submit" name="submit" class="btn btn-success">微信</button>
                        <button type="submit" name="submit" class="btn btn-success">QQ</button>
                        <button type="submit" name="submit" class="btn btn-success">支付宝</button>
                     </div>

                        <!--/form-->
                        
                     </div>
            </div>
            <!--企业和个人注册界面结束 -->
       </div>
       
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized-init.js"></script>
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
      var $ = function(selector){	
          return document.querySelector(selector);
      },
      box = $('.drag'),//容器
      bg = $('.bg'),//绿色背景
      text = $('.text'),//文字
      btn1 = $('.btn1'),//拖动按钮
      done = false;//是否通过验证

      btn1.onmousedown = function(e){
          var e = e || window.event;
          var posX = e.clientX - this.offsetLeft;
          btn1.onmousemove = function(e){
              var e = e || event;
              var x = e.clientX - posX;
              this.style.left = x + 'px';
              bg.style.width = this.offsetLeft + 'px';
              // 通过验证
              if(x >= box.offsetWidth - btn1.offsetWidth){
                  done = true;
                  btn1.onmousedown = null;
                  btn1.onmousemove = null;
                  text.innerHTML = '通过验证';
              }
          };

          document.onmouseup = function(){
              btn1.onmousemove = null;
              btn1.onmouseup = null;

              if(done)return true;
              btn1.style.left = 0;
              bg.style.width = 0;
          }
      };

      text.onmousedown = function(){
          return false;
      }
      
      function buttonClick(){
    	  var url = "member-add.do"+"?"+"isTrue"+"="+done;
    	  document.register.action = url;
    	  document.register.submit();
    	}
</script>
</body>
</html>