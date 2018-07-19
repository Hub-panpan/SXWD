<%@ page language="java" import="java.util.*,com.model.*" pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>书香味道</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta name="author" content="" />
    <!--外部样式表 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/buttons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/flat.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />
  
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
                      <!--<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>-->
    <!--[endif]->
  <!-- Le fav and touch icons -->
  
  
  
  <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
    <style>

        #wrapper{
            margin-top: 50px;/*距离上导航条的距离*/
        }
        #wrapper2{
            margin-top: 50px;/*距离上导航条的距离*/
        }
    </style>
</head>
<body>


<!--这是导航-->
<div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                </button>

                <a href="${pageContext.request.contextPath}//memberlogin.jsp">
                <button type="button" class="navbar-toggle collapsed">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="glyphicon glyphicon-user"></span>
                </button></a>
                <a class="navbar-brand" href="#">书香味道</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">主页</a></li>
                    <li><a href="${pageContext.request.contextPath}/order_breakfast.jsp">我要点餐</a></li>
                    <li><a href="">已选餐点</a></li>
                    <li><a href="">订单管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/jionInVote.jsp">最新活动</a></li>
                    <li><a href="#">联系我们</a></li>
                  
                    
                    <c:if test="${active_user.getMember_name()==null}">
		                    <li><a href="${pageContext.request.contextPath}/memberlogin.jsp">
		                    <span class="glyphicon glyphicon-user" style="background-color: black;"></span>&nbsp;&nbsp;吃货点我</a></li>
			                     <li><a href="${pageContext.request.contextPath}/admin/Adminlogin.jsp">
		                    <span class="glyphicon glyphicon-record" style="background-color: black;"></span>&nbsp;&nbsp;管理点我</a></li>
		                    
                    </c:if>
                    
                     <c:if test="${active_user.getMember_name()!=null}">
	                      
	                      <li><a href="#"><span class="glyphicon glyphicon-user" style="background-color: black;"></span>
	                      ${active_user.getMember_name()}</a></li>
	                       <li><a href="member-logoff.do">注销</a></li>

                     </c:if>
                    
                   
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

</div>

<div>
    <div style="margin-top: 50px;">
          <div class="container">

     
      

      <div class="row">

        <div class="col-sm-8 blog-main">
          <div class="blog-post">
            <h1 class="blog-title">${food_detail.food_name}</h1>   
            <h2 class="blog-post-title">${food_detail.food_id}</h2>
            <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>

          <hr>
         <img src="upload/food_img/${food_detail.food_id}.jpg" class="img-responsive img-rounded" alt="Cinque Terre">
            <p>${food_detail.food_info}</p>
           
           
          	
          </div>



					<c:if test="${single_remark_list.size()!=0}">

 
							<%    List<Remark> rs = (List<Remark>)session.getAttribute("single_remark_list");      
                     			  for(Remark x : rs){
                 		     %>
  							    <pre><code><%=x.getRemark_id() %>  用户：<%=x.getMember_id() %> </code></pre>
								<pre><code><%=x.getRemark_content() %></code></pre>
								<pre><code><%=x.getRemark_date() %></code></pre>
								
								<hr>
							<%} %>

					</c:if>


        </div>
        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div class="sidebar-module sidebar-module-inset">
            <h4>了解更多书香味道</h4>
            <p>红酥手，黄縢酒，满城春色宫墙柳。</p>
            <p>载酒买花年少事，浑不似，旧心情。</p>
            <p>东篱把酒黄昏后，有暗香盈袖。</p>
          </div>
          <div class="sidebar-module">
            <h4></h4>
            <ol class="list-unstyled">
              <li><a href="#">March 2014</a></li>
              <li><a href="#">February 2014</a></li>
              
             
            </ol>
          </div>
          <div class="sidebar-module">
            <h4>Elsewhere</h4>
            <ol class="list-unstyled">
              <li><a href="#">QQ631039758</a></li>
            
              <li><a href="#">微信panpan668706</a></li>
            </ol>
          </div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->

<!-- 这里是评论区域 -->
 <c:if test="${active_user.member_rights>0 }">
<div>
    <form action="remark-addremark.do" method="post">
    
    
    
	<input type="text" name="food_id" value="${food_detail.food_id}"><br>
	<input type="text" name="member_phone" value="${active_user.member_phone}"><br>
	我也要评论！！
	 <c:if test="${active_user.member_rights>0 }">
	<script id="editor" name="info" type="text/plain" style="width:800px;height:200px;"></script>	
	<input type="submit"> 
</c:if>
</form>
    
</div>
</c:if>


 <c:if test="${active_user.member_rights==0}">

  目前您的积分太少！！请多购买我们的餐品获得，评论权限哦！！

</c:if>






    </div><!-- /.container -->

    <footer class="blog-footer">
      <p><a href="http://lvgaopan.com">书香味道</a></p>
      <p>
        <a href="#">点我返回顶部</a>
      </p>
    </footer>
    </div>

</div>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>