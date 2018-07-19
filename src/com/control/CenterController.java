package com.control;
//首先 我们明确一个这个 是干啥用的 

//通过提交的 url 请求 来做相应的servlet请求
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.RemarkDAO;
import com.service.AdminService;
import com.service.FoodsService;
import com.service.MemberService;
import com.service.MenuService;
import com.service.RemarkService;
import com.service.VoteService;
import com.service.CartService;
import com.service.OrderService;

public class CenterController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CenterController() {
		super();
	}
	
	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void init() throws ServletException {
		// Put your code here
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();// 模块/功能.do emp/add.do
		System.out.print("控制中心验证获取到当前的绝对路径"+uri+"\n");
		
		
		MemberService memservice = new MemberService();
		AdminService admservice=new AdminService();
		RemarkService remservice=new RemarkService();
		MenuService meservice=new MenuService();
		FoodsService foservice=new FoodsService();
		VoteService voservice=new VoteService();
		//CartService cartService=new CartService();
		OrderService orderService=new OrderService();
		
        CartService caservice = new CartService();

        if (uri.indexOf("cart") != -1) {

            if (uri.indexOf("showAllcart.do") != -1) {
                caservice.searchAll(req, resp);
            }
            if (uri.indexOf("showSingalcart.do") != -1) {
				caservice.searchOne(req, resp);
			}
            
            if (uri.indexOf("addmembercart.do") != -1) {
     			caservice.addcart(req, resp);
     			}
            if (uri.indexOf("removeall.do") != -1) {
     			caservice.removeall(req, resp);
     			}
            if (uri.indexOf("removesingle.do") != -1) {
     			caservice.removesingle(req, resp);
     			}
            if (uri.indexOf("plus.do") != -1) {
     			caservice.plus(req, resp);
     			}
            
            if (uri.indexOf("minus.do") != -1) {
     			caservice.minus(req, resp);
     			}
        }
		if(uri.indexOf("order")!=-1){
			
			if(uri.indexOf("update.do")!=-1){
				orderService.agreeOrder(req, resp);
			}
			if(uri.indexOf("delete.do")!=-1){
				orderService.deleteOrder(req, resp);
			}
			if(uri.indexOf("showAllOrder.do")!=-1){
				orderService.showCode(req, resp);
			}
			if(uri.indexOf("showsingleOrder.do")!=-1){
				orderService.showSingleOrder(req, resp);
			}
			
			/*前台 查询订单信息*/
			if(uri.indexOf("order-order.do")!=-1){
				orderService.showMemberOrder(req, resp);
			}
			
			if(uri.indexOf("order-pay.do")!=-1){
				orderService.PayOrder(req, resp);
			}
		}
		
		
		if(uri.indexOf("member")!=-1){
			
			if(uri.indexOf("add.do")!=-1){
				memservice.save(req, resp);
			}
			if(uri.indexOf("login.do")!=-1){
				memservice.login(req, resp);
			}
			if(uri.indexOf("logoff.do")!=-1){
				memservice.logoff(req, resp);
			}
			
		
			if(uri.indexOf("showSingleVote.do")!=-1){
				memservice.getSingleVote(req, resp);
			}
			
			if(uri.indexOf("iwanttovote.do")!=-1){
		    	memservice.iwanttovote(req, resp);
			}
			if(uri.indexOf("updateselfinfo.do")!=-1){
				admservice.updateUserInfo02(req, resp);
			}
		
		}
		
		if(uri.indexOf("admin-")!=-1){
			
		
			if(uri.indexOf("login.do")!=-1){
				admservice.login(req, resp);
			}
			if(uri.indexOf("logoff.do")!=-1){
				admservice.logoff(req, resp);
			}
			if(uri.indexOf("show.do")!=-1){
				admservice.showUser(req, resp);
			}
			/*这是用来点击 编辑跳转的*/
			if(uri.indexOf("update01.do")!=-1){
				admservice.updateUserInfo01(req, resp);
			}
			/*修稿信息之后 提交*/
			if(uri.indexOf("update02.do")!=-1){
				admservice.updateUserInfo02(req, resp);
			}
			if(uri.indexOf("delete01.do")!=-1){
				admservice.deleteUserInfo(req, resp);
			}
			if(uri.indexOf("addMember.do")!=-1){
				admservice.addMember(req, resp);
			}
		}

	
		
		if(uri.indexOf("menu-")!=-1){
			
		    
			if(uri.indexOf("addMenu.do")!=-1){
				meservice.addMenu(req, resp);
			}
			if(uri.indexOf("update01.do")!=-1){
				meservice.updateMenuInfo01(req, resp);
			}

			if(uri.indexOf("update02.do")!=-1){
				meservice.updateMenuInfo02(req, resp);
			}

			if(uri.indexOf("delete01.do")!=-1){
				meservice.deleteMenu(req, resp);
			}

			if(uri.indexOf("showAllMenu.do")!=-1){
				meservice.getAllMenu(req, resp);
			}
		

		}
		
		if(uri.indexOf("food-")!=-1){
			
		  
		     
		    if(uri.indexOf("addFood.do")!=-1){
			   foservice.addFood(req, resp);
			}
		     
			if(uri.indexOf("showsingleMenu.do")!=-1){
				foservice.showsingleMenu(req, resp);
			}
			if(uri.indexOf("update01.do")!=-1){
				foservice.updateFoodInfo01(req, resp);
			}

			if(uri.indexOf("update02.do")!=-1){
				foservice.updateFoodInfo02(req, resp);
			}
			if(uri.indexOf("page.do")!=-1){
				foservice.fenye(req, resp);
			}
			
			if(uri.indexOf("showdetails.do")!=-1){
				foservice.showdetails(req, resp);
				//remservice.
				
			}	
			 if(uri.indexOf("delete01.do")!=-1){
				   foservice.deleteFood(req, resp);
				}
			     
	    }
	
		if(uri.indexOf("remark-")!=-1){
			
			
		     
		    if(uri.indexOf("pass.do")!=-1){
		    	remservice.passRemark(req, resp);
			}
		    if(uri.indexOf("delete.do")!=-1){
		    	remservice.deleteRemark(req, resp);
			}
		    if(uri.indexOf("addremark.do")!=-1){
		    	remservice.addRemark(req, resp);
			}
		    if(uri.indexOf("showAllRemark.do")!=-1){
		    	remservice.getAllRemark(req, resp);
		    }
		    
		    
		    
		
		}
	
		

			if(uri.indexOf("vote-")!=-1){
			
			    if(uri.indexOf("showAllVote.do")!=-1){
			    	voservice.getAllVote(req, resp);
				}
				if(uri.indexOf("showSingleVote.do")!=-1){
			    	voservice.getSingleVote(req, resp);
				}
				if(uri.indexOf("addvote.do")!=-1){
			    	voservice.addVote(req, resp);
				}
				if(uri.indexOf("deleteVote.do")!=-1){
			    	voservice.deleteVote(req, resp);
				}
				if(uri.indexOf("addVoteOption.do")!=-1){
					voservice.addVoteOption(req, resp);
					
				}
		
			}
   }
	
}
