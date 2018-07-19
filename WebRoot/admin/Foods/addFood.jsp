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
                    <ul class="am-icon-users">增加新菜品</ul>

                    <dl class="am-icon-home" style="float: right;">当前位置：<a href="${pageContext.request.contextPath}/admin/adminindex.jsp"> 首页 </a>> <a href="#">修改增加新菜品</a></dl>

             
                </div>

     <form action="food-addFood.do" method="post" class="am-form am-g"  id="add_food_info" enctype="multipart/form-data">
                         
        <div class="am-form-group am-cf">
          <lable>菜品ID</lable>
          <div class="you">
            <input type="text" class="am-input-sm" id="food_id" name="food_id" placeholder="请输入菜品">
          </div>
        </div> 
        <div class="am-form-group am-cf">
          <lable>菜品名称</lable>
          <div class="you">
            <input type="text" class="am-input-sm" id="food_name" name="food_name" placeholder="请输入标题">
          </div>
        </div> 
        
          <div class="am-form-group am-cf">
          <lable>菜品价格</lable>
          <div class="you">
            <input type="text" class="am-input-sm" id="food_price" name="food_price" placeholder="请输入标题" />
          </div>
        </div> 
     
        <div class="am-form-group am-cf">
          <div class="zuo">描述信息：</div>
          <div class="you">
            <textarea class="" rows="2" id="food_info" name="food_info"></textarea>
          </div>
        </div>
        <div class="am-form-group am-cf">
        
	          <lable>缩略图：</lable>
	       <div class="you">
	             <input type="file" name="uploadFile"  />
	       </div>
       
        </div>
        <!--div class="am-form-group am-cf">
          <div class="zuo">产品图片：</div>
          <div class="you" style="height: 45px;">
            <input type="file" id="doc-ipt-file-1">
            <p class="am-form-help">请选择要上传的文件...</p>
          </div>
        </div-->
        
         
        <div class="am-form-group am-cf">
        <div class="zuo">所属窗口：</div>
       			<select name="menu_id" style="width:250px;padding:0.125em">
							<option name="remark" value="A">A</option>
							<option name="remark" value="B">B</option>
							<option name="remark" value="C">C</option>
							<option name="remark" value="D">D</option>
							<option name="remark" value="E">E</option>
							<option name="remark" value="D">F</option>
							<option name="remark" value="E">G</option>
							
				</select>
        </div>
        
        
        <div class="am-form-group am-cf">
        <div class="zuo">推荐：</div>
       			<select name="remark_value" style="width:250px;padding:0.125em">
							<option name="remark" value="1">允许评论</option>
							<option name="remark" value="0">禁止评论</option>
							
				</select>
        </div>
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
           <button type="submit" class="am-btn am-btn-success am-radius">发布</button>
          </div>
        </div>
      </form>

<!--  script type="text/javascript">
    var flag=false;
    $(document).ready(function(e) {
        $("#add_food_info").submit(function(){
            if($("#img_file").val()==""){
                alert("请选择图片！");
                return false;
            }
            
            if(!flag){
                alert("上传的必须是图片");
                return false;
            }
        });
        
       $("#img_file").change(function(){
            var value=$(this).val();
            var hou=value.substring(value.lastIndexOf("."));
            if(hou==".jpg" || hou==".png"|| hou==".gif"|| hou==".bmp"){
                flag=true;
            }else{
                alert("必须是图片!");
                flag=false;
            }
        });
    });
    
    
</script>-->

                
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