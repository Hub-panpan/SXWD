
package com.service;

import com.DAO.ShoppingCartDAO;
import com.model.ShoppingCart;
import com.sun.jndi.url.corbaname.corbanameURLContextFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CartService {
	/*这个是 前台 用来  查找自己的  购物车信息的*/
    public void searchOne(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String member_id=req.getParameter("mem_id");

      
        ShoppingCartDAO SCD=new ShoppingCartDAO();
        List<ShoppingCart> SC=SCD.get(member_id);
        
     
		
		/*计算价格*/
		float  sum_price=countprice(req, resp, SC);
		 
			
        
        HttpSession session = req.getSession();
        session.setAttribute("searchOne", SC);
        session.setAttribute("sum_price", sum_price);
        resp.sendRedirect("membercart.jsp");
        
    }

    public void searchAll(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String member_id= "All";

        System.out.println(123);
        List<ShoppingCart> SC=new ArrayList<ShoppingCart>();
        ShoppingCartDAO SCD=new ShoppingCartDAO();
        SC=SCD.get(member_id);
        HttpSession session = req.getSession();
        session.setAttribute("searchAll", SC);
        resp.sendRedirect("/SXWD/admin/Cart/showCart.jsp");
    }
    /*用户增加一条     购物车记录        这个不用更新sesssion数据的  因为  我们在查看  购物车信息的时候会  重新请求*/
    public void addcart(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    	
    	String food_id=req.getParameter("fo_id");
    	String food_name=new String(req.getParameter("fo_na").getBytes("iso-8859-1"),"utf-8");
    	String food_price=req.getParameter("fo_pr");
    	String member_phone=req.getParameter("mem_id");
    	
    	ShoppingCart sCart =new ShoppingCart();
    	ShoppingCartDAO scCartDAO=new ShoppingCartDAO();
    	//sCart.setCart_id(null);
    	sCart.setFood_id(food_id);
    	sCart.setFood_name(food_name);
    	System.out.println("CARTservice层："+food_name);
    	
    	sCart.setFood_price(Float.parseFloat(food_price));
    	sCart.setOrder_number(1);
    	sCart.setMember_phone(member_phone);
    	
    	scCartDAO.save(sCart);
    	
    	 resp.sendRedirect("order_breakfast.jsp");
    	
    	
    }
    /*清空购物车    首先通过 获得的的会员ID  直接删除  session  */
    public void removeall(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    	
    	String mem_id=req.getParameter("mem_id");
    	
    	ShoppingCartDAO scDao=new ShoppingCartDAO();
    	  List<ShoppingCart> SC=scDao.get(mem_id);
    	
    	  
    	  Iterator<ShoppingCart> it1 = SC.iterator();			
			while(it1.hasNext()){				
				ShoppingCart so = it1.next();
				scDao.delete(so.getCart_id());
			}
			
		HttpSession session=req.getSession();
		session.removeAttribute("searchOne");
		session.setAttribute("searchOne",null);
		
		 resp.sendRedirect("membercart.jsp");
    	
    }
    
    
    /*两个动作   ：首先  从数据库中 删除 数据记录  然后  删除session中的  一条数据 */
   public void removesingle(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    	
	   int cart_id=Integer.parseInt(req.getParameter("ca_id"));	   
		ShoppingCartDAO scDao=new ShoppingCartDAO();
		scDao.delete(cart_id);		
		HttpSession session=req.getSession();
		
		List<ShoppingCart> SC= (List<ShoppingCart>)session.getAttribute("searchOne");
		
		 Iterator<ShoppingCart> it1 = SC.iterator();			
			while(it1.hasNext()){				
				ShoppingCart so = it1.next();
				if (so.getCart_id()==cart_id) {
					it1.remove();
				}
			}
			
			float  sum_price=countprice(req, resp, SC);
			
			
			/*删除完一条数据以后  我们 重新加载session*/
		
			 session.setAttribute("searchOne", SC);
			 session.setAttribute("sum_price", sum_price);
			
		 resp.sendRedirect("membercart.jsp");
	   }
    
   public void  plus(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{

	  
	   
	   
       int  num=Integer.parseInt(req.getParameter("num"));
       int  cart_id=Integer.parseInt(req.getParameter("ca_id"));
       System.out.println("后台得到数据："+num);
       System.out.println("后台得到数据："+cart_id);
       
       num=num+1;
       System.out.println("数量加1得到："+num);
       ShoppingCartDAO scDao=new ShoppingCartDAO();
      /*首先  更新数据库信息*/
       scDao.jiajian(num,cart_id);

		/*然后更新session 信息 */
		HttpSession session=req.getSession();

		List<ShoppingCart> SC= (List<ShoppingCart>)session.getAttribute("searchOne");
		
		 Iterator<ShoppingCart> it1 = SC.iterator();			
			while(it1.hasNext()){				
				ShoppingCart so = it1.next();
				if (so.getCart_id()==cart_id) {
					so.setOrder_number(num);  
					System.out.println("更新session"+so.getOrder_number());
				}
			}
       
			float  sum_price=countprice(req, resp, SC);
			 session.setAttribute("searchOne", SC);
			 session.setAttribute("sum_price", sum_price);
       
       resp.sendRedirect("membercart.jsp");

   }
   public void  minus(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
      
	
	   
		HttpSession session=req.getSession();
	   int  num=Integer.parseInt(req.getParameter("num"));
       int  cart_id=Integer.parseInt(req.getParameter("ca_id"));
       System.out.println("后台得到数据："+num);
       System.out.println("后台得到数据："+cart_id);
       /*数量必须大于1*/
       if(num>1){
           num=num-1;
           System.out.println("数量减1得到："+num);
   
       ShoppingCartDAO scDao=new ShoppingCartDAO();
      /*首先  更新数据库信息*/
       scDao.jiajian(num,cart_id);

		/*然后更新session 信息 */
	

		List<ShoppingCart> SC= (List<ShoppingCart>)session.getAttribute("searchOne");
		
		 Iterator<ShoppingCart> it1 = SC.iterator();			
			while(it1.hasNext()){				
				ShoppingCart so = it1.next();
				if (so.getCart_id()==cart_id) {
					so.setOrder_number(num);  
					System.out.println("更新session"+so.getOrder_number());
				}
			}
			/*更新之后   再重新计算一下价格*/
			float  sum_price=countprice(req, resp, SC);
			 session.setAttribute("searchOne", SC);
			 session.setAttribute("sum_price", sum_price);
			
			
       }else {
		
    	   session.setAttribute("succmsg", "数量必须大于1");
    	   resp.sendRedirect("error.jsp");
    	   return;
	}
       
       
       resp.sendRedirect("membercart.jsp");

   }
    
    
   public Float   countprice(HttpServletRequest req, HttpServletResponse resp,List<ShoppingCart> pSC) throws IOException, ServletException{
	  
		float  sum_price=0.0f;		  
		  Iterator<ShoppingCart> it1 = pSC.iterator();			
			while(it1.hasNext()){				
				ShoppingCart so = it1.next();
				sum_price+=so.getFood_price()*so.getOrder_number();
			}
			System.out.println("调用计算价成功！");
		return sum_price;
   }
}
