package com.service;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MenuDAO;
import com.DAO.RemarkDAO;
import com.model.Menu;
import com.model.Remark;
import com.sun.crypto.provider.RSACipher;

public class RemarkService {
	
	@SuppressWarnings("unchecked")
	public void addRemark(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		String food_id = req.getParameter("food_id");
		String member_phone = req.getParameter("member_phone");
		String info = req.getParameter("info");
		System.out.println(food_id);
		System.out.println(member_phone);
		System.out.println(info);
		
		
		Remark rem=new Remark();
		
		rem.setFood_id(food_id);
		rem.setMember_id(member_phone);
		rem.setRemark_content(info);
		
		
		RemarkDAO reDao=new RemarkDAO();
        boolean bool=		reDao.save(rem);
		
        
        if(bool){
        	
        	//如果添加成功的话 就要更新 范围信息
        	HttpSession session = req.getSession();//防止创建Session
    		/*if(session.getAttribute("all_remark_list") == null){
    		       resp.sendRedirect("/SXWD/admin/adminindex.jsp");
    		return;
    		}*/
    		session.removeAttribute("all_remark_list");
    		 
        	  List<Remark> all_remark_list =reDao.getAll();		
				session.setAttribute("all_remark_list", all_remark_list);
        	
				session.setAttribute("succmsg", "您已经成功提交评论！等待审核通过就能显示您的评论啦！");

				
				RequestDispatcher dispatcher=req.getRequestDispatcher("succeed.jsp");
				dispatcher.forward(req, resp);
				
        	
        	
        }else{
        	
        	System.out.println("评论失败");     		
        }
		
		
		
		
	}
	
	@SuppressWarnings("unchecked")
	public void deleteRemark(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		int rem_id=Integer.parseInt(req.getParameter("rem_id")); //  首先从页面上  获取 提交的     remArk  id
		System.out.println("获取到当前请求的 评论的id"+rem_id);
		RemarkDAO remdao=new RemarkDAO();
		
		boolean bool=remdao.delete(rem_id);   
		
		if(bool==true){
			
			  List<Remark> rs = (List<Remark>)req.getSession().getAttribute("all_remark_list");
			  
			  
				Iterator<Remark> it = rs.iterator();			
				while(it.hasNext()){			
					Remark u = it.next();
					if(u.getRemark_id()==(rem_id)){
				
						it.remove();
						break;
					}
				}
				req.getSession().setAttribute("all_remark_list", rs);
		
	  }
			 
				
				RequestDispatcher dispatcher=req.getRequestDispatcher("showRemark.jsp");
				dispatcher.forward(req, resp);
				
	}
	

	@SuppressWarnings("unchecked")
	public void passRemark(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		int rem_id=Integer.parseInt(req.getParameter("rem_id"));
		
		RemarkDAO remdao=new RemarkDAO();
		
		boolean bool=remdao.update(rem_id);   
		
		if (bool) {	
			
			  List<Remark> rs = (List<Remark>)req.getSession().getAttribute("all_remark_list");
					  
					  Iterator<Remark> it = rs.iterator();
						//it.hasNext�ж��Ƿ�����һ��Ԫ��
						while(it.hasNext()){
							//it.nextȡ��Ԫ��
							Remark re = it.next();
							if(re.getRemark_id()==rem_id){
							
								re.setIsPass(1);
								break;//����while
							}
						}
						req.getSession().setAttribute("all_remark_list", rs);
			
			
			
			
			System.out.println("通过！");
			RequestDispatcher dispatcher=req.getRequestDispatcher("showRemark.jsp");
			dispatcher.forward(req, resp);
			
		}else{
			System.out.println("修改通过失败");
		}
		
		
		
	}
	
	
	/**public void getSingleRemark(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		int rem_id=Integer.parseInt(req.getParameter("rem_id"));  首先从页面上  获取 提交的     remArk  id
		System.out.println("获取到当前请求的 评论的id"+rem_id);
		RemarkDAO remdao=new RemarkDAO();
		List<Remark> single_remark_list=remdao.getSingleAll(rem_id);
		
		HttpSession session=req.getSession();
		session.setAttribute("single_remark_list", single_remark_list);
		
	
		RequestDispatcher dispatcher=req.getRequestDispatcher("showdetail.jsp");
		dispatcher.forward(req, resp);
		
		
	}*/
	
    
	
	public void getAllRemark(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		RemarkDAO redao=new RemarkDAO();
		List<Remark> all_remark_list=redao.getAll();
		HttpSession session=req.getSession();
	    session.setAttribute("all_remark_list", all_remark_list);
	    RequestDispatcher dispatcher=req.getRequestDispatcher("showRemark.jsp");
		dispatcher.forward(req, resp);
	}
}
