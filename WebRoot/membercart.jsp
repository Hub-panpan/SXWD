<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.model.*"%>
<!-- 这里是导航界面 -->
     <%@ include file="header.jsp"%>
<!-- 这里是导航界面完毕 -->
   <style>
        #wrapper2{
            padding-top: 60px;/*距离上导航条的距离*/
        }
        div.p_num {
            width: 80px;
            height: 25px;
            border: solid 1px #d0d0d0;
            position: relative;
            margin-top: -3px;
        }
        span.sy_minus,span.sy_plus {
            width: 15px;
            height: 24px;
            line-height: 24px;
            text-align: center;
            display: block;
            position: absolute;
            top: 0px;
            font-size: 14px;
            border: solid 1px #d0d0d0;
            background: #ebebeb;
            cursor: pointer;
            border-top: none;
            border-bottom: none;
        }

        span.sy_minus {
            left: 0px;
        }

        span.sy_plus {
            right: 0px;
        }

        input.sy_num {
            width: 44px;
            height: 18px;
            line-height: 24px;
            text-align: center;
            position: absolute;
            top: 0px;
            left: 17px;
            border:0px;
        }

        span.sy_num {
            padding: 5px 8px;
            border: solid 0px #d0d0d0;
            border-left: none;
            border-right: none;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript" src="js/jquery.js"></script>
    <!--  script type="text/javascript">
   
        $(document).ready (function ()
        {
            var pl = $("p:last");
            var reg = /(.*[\:\：]\s*)([\+\d\.]+)(\s*元)/g;
            $ (".sy_minus").click (function ()
            {
                var me = $ (this),
                    txt = me.next (":text"),//当前这个按钮
                    pc = me.closest("div");//最近的p
                var val = parseFloat (txt.val ());// 通这个 加按钮 获得到value值
                val = val < 1 ? 1 : val;  //判断value值是否大于1
                txt.val (val - 1);

                var price = parseFloat (pc.prev("div").text().replace(reg,'$2')) * txt.val ();//往前找  p标记  然后 得到p标记的单价
                pc.next("div").text (pc.next("div").text().replace(reg, "$1" + price + "$3"));
                var sum = 0;
                $(".p_num").next("div").each(function (i, dom)
                {
                    sum += parseFloat ($(this).text().replace(reg, "$2"));
                });
                //pl.text(pl.text().replace(reg, "$1" + sum + "$3"));  //最后输出的总价格  通过正则表达式h值匹配数字  进行替换
                document.getElementById("sum").innerText=( "应支付金额：" + sum + "元"); 
                document.getElementById("price_txt").innerHTML=(  sum + "元");  //最后输出的总价格  通过正则表达式h值匹配数字  进行替换
            });

            $(".sy_plus").click (function ()
            {
                var me = $ (this), txt = me.prev (":text"), pc = me.closest("div");
                var val = parseFloat (txt.val ());
                txt.val (val + 1);
                var price = parseFloat (pc.prev("div").text().replace(reg,'$2')) * txt.val ();
                pc.next("div").text (pc.next("div").text().replace(reg, "$1" + price + "$3"));
                var sum = 0;
                $(".p_num").next("div").each(function (i, dom)
                {
                    sum += parseFloat ($(this).text().replace(reg, "$2"));
                });
                //pl.text(pl.text().replace(reg, "$1" + sum + "$3"));
                document.getElementById("sum").innerText=( "应支付金额："+ sum + "元"); 
                document.getElementById("price_txt").innerHTML=(   sum + "元");  //最后输出的总价格  通过正则表达式h值匹配数字  进行替换
            });
        })[0].onselectstart = new Function ("return false");
    </script-->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


<div id="wrapper2" class="viewer wrapper countpage clearfix" style="">
    <section class="order_title">
        <div class="container" id="">
            <div class="col-md-12 clearfix foot_orderList">
                <div class="row">
                    <div class="col-xs-6">
                        <p class="notice">
                        </p>
                    </div>
                    <div class="col-xs-6">
                        <p class="notice tar">
                            共计
                            <span class="price" id="price_txt">
                                ${sum_price}元
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="oder_content">
        <div class="container" id="J_order_list">
            <div class="row" id="J_order_Manager">
                <div class="col-xs-12 clearfix board_content">
                    <div class="col-xs-4 title_contain">
                        <p class="menu_title ">菜篮子</p>
                    </div>
                    <div class="col-xs-2">
                    </div>
                    <div class="col-xs-3 title_contain">
                        <a class="button button-rounded button-flat-action" id="addOrder" href="order_breakfast.jsp">选菜</a>
                    </div>
                    <div class="col-xs-3 title_contain">
                        <a id="clearOder" class="button button-rounded button-flat" href="cart-removeall.do?mem_id=${active_user.member_phone}">清空</a>
                    </div>
                </div>
            </div>
            <%    List<ShoppingCart> SC = (List<ShoppingCart>)session.getAttribute("searchOne");
                	for(ShoppingCart x : SC){
            %>
            <div class="row gray_line">
                <div class="col-xs-3 clearfix board_content" >
                    <div class=" clearfix order_item_name">
                        <label><%=x.getFood_name()%></label>
                    </div>
                </div>
                <div class="col-xs-7 " style="padding:0px">
                    <div class=" counter "  >
                        <div class="" style="display: inline-block; ">单价：<%=x.getFood_price()%>元</div>
                        <div class="p_num" style="display: inline-block;">
                            <a href="cart-minus.do?num=<%=x.getOrder_number() %>&ca_id=<%=x.getCart_id() %>"><span class="sy_minus" id="sy_minus_gid1">-</span></a>
                            <input class="sy_num" id="sy_num_gid1" style="width: 44px;height: 100%; display: inline-block;" readonly="readonly" type="text" name="number1" value="<%=x.getOrder_number() %>" />
                            <a href="cart-plus.do?num=<%=x.getOrder_number() %>&ca_id=<%=x.getCart_id() %>"><span class="sy_plus" id="sy_plus_gid1">+</span></a>
                        </div>
                        <div class="" style="display: none; float: right">需支付：<%=x.getFood_price()%>元</div>
                        <em class="fixBig  fake"></em>
                    </div>
                </div>
                <div class="col-ms-2 title_contain">
                
                    <a id="clearOder" class="button button-rounded button-flat" href="cart-removesingle.do?ca_id=<%=x.getCart_id() %>">清空</a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </section>
    <section class="oder_submit">
        <div class="container">
            <body>
<button class="btn btn-primary" type="button" style="float:right;">点我支付</button>
			<div class="modal" id="mymodal">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title">支付页面</h4>
						</div>
						<div class="modal-body">
							<p>会员ID：${active_user.member_phone }</p>
							<p>配送地址：${active_user.member_address }</p>
						    
						
							<p >当前余额:${active_user.member_points }</p>
							<p id="sum" style="color:red">支付金额: ${sum_price} </p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">我再想想</button>
							<a href="order-pay.do?mem_id=${active_user.member_phone }"><button type="button" class="btn btn-primary">支付</button></a>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
        </div>
    </section>
</div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-transition.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
<script>
  $(function(){
    $(".btn").click(function(){
      $("#mymodal").modal("toggle");
    });
  });
</script>
</body>
</html>
