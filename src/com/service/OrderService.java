package com.service;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDao;
import com.DAO.RemarkDAO;
import com.DAO.ShoppingCartDAO;
import com.DAO.ShoppingOrderDAO;
import com.model.Code;
import com.model.Member;
import com.model.Remark;
import com.model.ShoppingCart;
import com.model.ShoppingOrder;

public class OrderService {

	public void showCode(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		ShoppingOrderDAO codao=new ShoppingOrderDAO();
		/*获得到 所有的订单列表*/
		List<Code> all_order_code=codao.getCode();
		
		HttpSession session=req.getSession();
	    session.setAttribute("all_order_code", all_order_code);
	    resp.sendRedirect("/SXWD/admin/Order/showAllorder.jsp");
	
		
	}
	
	public void showSingleOrder(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		String or_id=req.getParameter("or_id");
		int   co_co=Integer.parseInt(req.getParameter("co_co"));
		
		ShoppingOrderDAO soDao=new ShoppingOrderDAO();
		
		System.out.println(or_id);
		System.out.println(co_co);
		
		
		/*传进来两个参数   一个是 mem_id  有可能是 管理员 有可能是前台 的用户    或者订单 的编号       第二个是*/
		List<ShoppingOrder> single_order=soDao.get(or_id, co_co);
		
		HttpSession session=req.getSession();
	    session.setAttribute("single_order", single_order);
	    RequestDispatcher dispatcher=req.getRequestDispatcher("showSingleOrder.jsp");
		dispatcher.forward(req, resp);		
	}
	public void showMemberOrder(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		String mem_id=req.getParameter("mem_id");
		
		
		ShoppingOrderDAO soDao=new ShoppingOrderDAO();
		/*传进来两个参数   一个是 mem_id  有可能是 管理员 有可能是前台 的用户    或者订单 的编号       第二个是*/
		List<ShoppingOrder> single_member_ordered_list0=soDao.get(mem_id, 0);
		List<ShoppingOrder> single_member_ordered_list1=soDao.get(mem_id, 1);
		
		HttpSession session=req.getSession();
		
		/*封装好 两个  一个是历史订单  一个是正在进行中的订单*/
	    session.setAttribute("single_member_ordered_list0", single_member_ordered_list0);
	    session.setAttribute("single_member_ordered_list1", single_member_ordered_list1);
	    
	    
	
	    RequestDispatcher dispatcher=req.getRequestDispatcher("memberordered.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
	
	
	public void PayOrder(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		/*得到当前的ID */
		String mem_id=req.getParameter("mem_id");
		
		ShoppingCartDAO scDao=new ShoppingCartDAO();
		ShoppingOrderDAO soDao2=new ShoppingOrderDAO();	
		
		/*我们通过用户的ID将      其自己的单个用户的  购物车记录封装成列表  我们进行下面一系列的操作 */
		List<ShoppingCart> single_cart=scDao.get(mem_id);	
		
		/*计算价格*/
		float  sum_price=0.0f;		  
		/*  Iterator<ShoppingCart> it1 = single_cart.iterator();			
			while(it1.hasNext()){				
				ShoppingCart so = it1.next();
				sum_price+=so.getFood_price()*so.getOrder_number();
			}*/
		
		HttpSession session=req.getSession();
		sum_price=(Float)session.getAttribute("sum_price");
			
			
		/*第一个动作  ：    我们首先要在用户的界面进行判断他的余额 是不是大于这个 当前所需要的 价钱 然后  成功的话要写入到数据库中的哦*/	
		
					MemberDao meDao=new MemberDao();
					
					Member member=new Member();
					member=meDao.get(mem_id);
					
					
					
					
					System.out.println("当前会员积分："+member.getMember_points());
					
					System.out.println("当前应付钱："+sum_price);
					
					
					if(member.getMember_points()>sum_price){
						
						
						
						float yue=member.getMember_points()-sum_price;
						
						member.setMember_points(yue);
						
						Boolean bool=meDao.update(member);
						
						if (bool) {
							System.out.println("余额写入成功"+yue);
						}
			
			/*第二个动作 ：我们要计算价格   那么  购物车中的数据  有用的是  5条   然后    我们需要加上的是：order_state   order_date  sum_price  order_code*/
				
				  Iterator<ShoppingCart> it2 = single_cart.iterator();
				  long currentTime=System.currentTimeMillis();
					while(it2.hasNext()){				
						ShoppingCart sc = it2.next();					
						ShoppingOrder so=new ShoppingOrder();
						
					//	so.setOrder_id(order_id);自动生成
						so.setFood_id(sc.getFood_id());
						so.setFood_name(sc.getFood_name());
						so.setFood_price(sc.getFood_price());
						so.setOrder_number(sc.getOrder_number());
						so.setMember_phone(sc.getMember_phone());
						
						so.setSum_price(sum_price);			
						so.setOrder_state(0);
					//	so.setOrder_date(order_date); 日期是自动 设置
						
						so.setOrder_code(String.valueOf(currentTime));					
						
						
						/*这个是写入操作    将新的订单记录 写进数据库*/				
						Boolean bool2=soDao2.save(so);
						
						if (bool2) {
							System.out.println("订单信息写入数据库成功:"+so.getFood_id());
						}
						
						
					}
				
					
			/*第三个动作  ：  我们需要清空购物车  */	
					 
					
					
					
					ShoppingCartDAO scDao3=new ShoppingCartDAO();
					
					  Iterator<ShoppingCart> it3 = single_cart.iterator();					
						while(it2.hasNext()){						
						/*通过遍历   这个   列表集合中的数据  将购物车记录   清空*/
							
						ShoppingCart sc = it2.next();
						
						//scDao3.delete(sc.getCart_id());
						System.out.println("删除购物车信息中...ID:"+sc.getCart_id());
						
						}
					
						req.getSession().setAttribute("succmsg","订单生产成功！！！");
						
						
					    RequestDispatcher dispatcher=req.getRequestDispatcher("succeed.jsp");
						dispatcher.forward(req, resp);
						return;
					}else {
						req.getSession().setAttribute("errormsg","您的余额已经不足，请及时充值！");
												
					    RequestDispatcher dispatcher=req.getRequestDispatcher("error.jsp");
						dispatcher.forward(req, resp);
					}
				
					
			
			
	}
	public void agreeOrder(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		/*首先：我们需要获得到  请求发货的订单编号*/
		String code=req.getParameter("co_id");
		System.out.println("审核通过发货"+code);
		
		ShoppingOrderDAO sodao=new ShoppingOrderDAO();
		
		boolean bool=sodao.update(code);   
		
		if (bool) {	
			
			  List<Code> rs = (List<Code>)req.getSession().getAttribute("all_order_code");
					  
					  Iterator<Code> it = rs.iterator();
						//it.hasNext�ж��Ƿ�����һ��Ԫ��
						while(it.hasNext()){
							//it.nextȡ��Ԫ��
							Code re = it.next();
							if(re.getOrder_code().equals(code)){
							
								re.setOrder_state(1);
								break;//����while
							}
						}
						req.getSession().setAttribute("all_order_code", rs);
			
			
			
			
			System.out.println("通过！");
			RequestDispatcher dispatcher=req.getRequestDispatcher("showAllorder.jsp");
			dispatcher.forward(req, resp);
			
		}else{
			System.out.println("修改通过失败");
		}
		
	}
	public void deleteOrder(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		String code=req.getParameter("co_id");
		System.out.println("删除"+code);
		
		ShoppingOrderDAO sodao=new ShoppingOrderDAO();
		
		boolean bool=sodao.delete(code);   
		
		if (bool) {	
			
			  List<Code> rs = (List<Code>)req.getSession().getAttribute("all_order_code");
					  
					  Iterator<Code> it = rs.iterator();
						//it.hasNext�ж��Ƿ�����һ��Ԫ��
						while(it.hasNext()){
							//it.nextȡ��Ԫ��
							Code re = it.next();
							if(re.getOrder_code().equals(code)){
							
								it.remove();
								break;//����while
							}
						}
						req.getSession().setAttribute("all_order_code", rs);
			
			
			
			
			System.out.println("删除成功！");
			RequestDispatcher dispatcher=req.getRequestDispatcher("showAllorder.jsp");
			dispatcher.forward(req, resp);
			
		}else{
			System.out.println("删除成功失败");
		}
		
	}
	}
	
	

