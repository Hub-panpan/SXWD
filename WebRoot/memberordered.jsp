<%@ page language="java" import="java.util.*,com.model.*" pageEncoding="utf8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="header.jsp"%>



   
    <!-- 这里是导航界面完毕 -->

    </div>
    <section class="oder_content" style="margin-top: 60px;">
       
        
        	<c:if test="${single_member_ordered_list0!=null}">

 
							<%   
								String code1="kong";
								String code2=null;
							  HttpSession session2=request.getSession();
							  session2.setAttribute("co1", code1);
							
							 List<ShoppingOrder> rs = (List<ShoppingOrder>)session.getAttribute("single_member_ordered_list0");      
                     			  for(ShoppingOrder x : rs){
                     				 code2=x.getOrder_code();
                     				 session2.setAttribute("co2", code2);
                     				 System.out.print(code1);
                     				  System.out.print(code2);
                     				 
                 		     %>
                 		     
                 		      <div class="container" id="J_order_list">
                 		    
                 		    <c:if test="${co1  ne co2}">  
						            <div class="row" id="J_order_Manager">
							                <div class="col-xs-12 clearfix board_content">
							                	<div class="col-xs-4 title_contain">
							                        <p class="menu_title ">进行订单 </p>
							                    </div>
							
							                    <div class="col-xs-4 title_contain">
							                       <button class="button button-rounded button-flat-action" id="addOrder">ID:<%=x.getOrder_code() %></button>
							                    </div>
							                    <div class="col-xs-4 title_contain">
							                        <button id="clearOder" class="button button-rounded button-flat">总价：<%=x.getSum_price() %>元</button>
							                    </div>
							                 </div>					          
							          </div>  
							            <%
								          code1=x.getOrder_code();
								            session2.setAttribute("co1", code1);
								              %>  
							          </c:if>
								         
							        <div class="row gray_line">
							            <div class="col-md-12 clearfix board_content">
							                <div class="col-xs-6">
							                    <div class="col-md-6 clearfix order_item_name">
							                        <label><%=x.getFood_id() %></label>
							                    </div>
							                    <div class="col-md-6 clearfix order_price">
							                      <%=x.getFood_name() %>
							                    </div>
							                </div>
							                 <div class="col-xs-6">
							                    <div class="col-md-6 clearfix order_item_name">
							                        <label> <%=x.getFood_price() %></label>
							                    </div>
							                    <div class="col-md-6 clearfix order_price">
							                        <%=x.getOrder_number() %>
							                    </div>
							                </div>
							            </div>
							        </div>
							                 		     
                 		      </div>
								<%} %>
					</c:if>
        

</section>
	<hr>

        <section class="oder_content" style="margin-top: 60px;">
       
        
        	<c:if test="${single_member_ordered_list1!=null}">

 
							<%   
								String code3="kong";
								String code4=null;
							  HttpSession session2=request.getSession();
							  session2.setAttribute("co3", code3);
							
							 List<ShoppingOrder> rs = (List<ShoppingOrder>)session.getAttribute("single_member_ordered_list1");      
                     			  for(ShoppingOrder x : rs){
                     				 code4=x.getOrder_code();
                     				 session2.setAttribute("co4", code4);
                     				 System.out.print(code3);
                     				  System.out.print(code4);
                     				 
                 		     %>
                 		     
                 		      <div class="container" id="J_order_list">
                 		    
                 		    <c:if test="${co3  ne co4}">  
						            <div class="row" id="J_order_Manager">
							                <div class="col-xs-12 clearfix board_content">
							                	<div class="col-xs-4 title_contain">
							                        <p class="menu_title ">历史订单 </p>
							                    </div>
							
							                    <div class="col-xs-4 title_contain">
							                       <button class="button button-rounded button-flat-action" id="addOrder">ID:<%=x.getOrder_code() %></button>
							                    </div>
							                    <div class="col-xs-4 title_contain">
							                        <button id="clearOder" class="button button-rounded button-flat">总价：<%=x.getSum_price() %>元</button>
							                    </div>
							                 </div>					          
							          </div>  
							            <%
								          code3=x.getOrder_code();
								            session2.setAttribute("co3", code3);
								              %>  
							          </c:if>
							          
								        
							         
							            
							        <div class="row gray_line">
							            <div class="col-md-12 clearfix board_content">
							                <div class="col-xs-6">
							                    <div class="col-md-6 clearfix order_item_name">
							                        <label><%=x.getFood_id() %></label>
							                    </div>
							                    <div class="col-md-6 clearfix order_price">
							                      <%=x.getFood_name() %>
							                    </div>
							                </div>
							                 <div class="col-xs-6">
							                    <div class="col-md-6 clearfix order_item_name">
							                        <label> <%=x.getFood_price() %></label>
							                    </div>
							                    <div class="col-md-6 clearfix order_price">
							                        <%=x.getOrder_number() %>
							                    </div>
							                </div>
							            </div>
							        </div>
							                 		     
                 		      </div>
								<%} %>
						

					</c:if>
        

</section>




<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>