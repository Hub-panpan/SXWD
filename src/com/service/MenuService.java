package com.service;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDao;
import com.DAO.MenuDAO;
import com.model.Member;
import com.model.Menu;

public class MenuService {

	
	
	
	public void addMenu(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		String me_id=req.getParameter("menu_id");
		String me_name=req.getParameter("menu_name");
		
		System.out.println("�?����"+me_id);
		System.out.println("�?����"+me_name);
		MenuDAO meDao=new MenuDAO();
		Menu me=meDao.get(me_id);
		
		if(me!=null){
			try {
				req.getSession().setAttribute("errormsg", me.getMenu_id()+"��ǰ������ʹ����");
				RequestDispatcher dispatcher=req.getRequestDispatcher("adminerror.jsp");
				
					dispatcher.forward(req, resp);
				} catch (ServletException e) {
					
					e.printStackTrace();
				}

			}else{
				
				Menu mx=new Menu();
				mx.setMenu_id(me_id);
				mx.setMenu_name(me_name);
				boolean x=meDao.save(mx);
				
				if(x==true){
					System.out.println("");

			    List<Menu> rs = (List<Menu>)req.getServletContext().getAttribute("melist");					  
		    	rs.add(mx);
				req.getServletContext().setAttribute("melist", rs);
				RequestDispatcher dispatcher=req.getRequestDispatcher("showMenu.jsp");
					dispatcher.forward(req, resp);
				}
				
			}
			
		
  }
    
	public void updateMenuInfo01(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		String updateMenu=req.getParameter("me_id");
		System.out.println("showMenu.jspҳ���õ� me_idֵ��"+updateMenu);
		
		Menu me=new Menu();
		MenuDAO medao=new MenuDAO();
		
		me=medao.get(updateMenu);
		
		HttpSession session=req.getSession();
		session.setAttribute("updateMenu", me);
		RequestDispatcher dispatcher=req.getRequestDispatcher("updateMenuInfo.jsp");
		dispatcher.forward(req, resp);
		
	  }


	public void updateMenuInfo02(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
        String old_id=req.getParameter("old_menu_id");
		
		String me_id=req.getParameter("menu_id");
		String me_name=req.getParameter("menu_name");
		    System.out.println("updateMenuInfo02()请求修改的窗口:"+old_id);
		    System.out.println("updateMenuInfo02()修改窗口ID为:"+me_id);
		    System.out.println("updateMenuInfo02()修改窗口名称:"+me_name);
		  
			MenuDAO meDao=new MenuDAO();
			Menu me=new Menu();
			
			me.setMenu_id(me_id);
			me.setMenu_name(me_name);
		    
		    Boolean bool=meDao.update(me, old_id);
		    
		    
		    if(bool==true){
				
				  List<Menu> rs = (List<Menu>)req.getServletContext().getAttribute("melist");
				  
				  Iterator<Menu> it = rs.iterator();
				
					while(it.hasNext()){
						
						Menu u = it.next();
						if(u.getMenu_id().equals(old_id)){
							u.setMenu_id(me_id);
							u.setMenu_name(me_name);
					
							break;
						}
					}
					req.getServletContext().setAttribute("melist", rs);
					
					RequestDispatcher dispatcher=req.getRequestDispatcher("showMenu.jsp");
					dispatcher.forward(req, resp);
			
		  }else {
			  
			  System.out.println("�޸�ʧ��");
			
			  
		}
				 
		}
	 
 
	public void deleteMenu(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		String me_id=req.getParameter("me_id");
		System.out.println("�����Ƿ�����showuser.jspҳ���õ� me_idֵ��"+me_id);
		
		MenuDAO dao=new MenuDAO();
		boolean bool=dao.delete(me_id);
		if(bool==true){
			/*��Ȼ�������ֲ�������*/
			
			  List<Menu> rs = (List<Menu>)req.getServletContext().getAttribute("melist");
			
		//	List<Menu> melist= (List<Menu>)sce.getServletContext().getAttribute("melist");
			
			 /*for(Menu u:rs){
			    	if(u.getMenu_id().equals(me_id)){
			    		rs.remove(u);
			    	}*/
			  
			  Iterator<Menu> it = rs.iterator();
				//it.hasNext�ж��Ƿ�����һ��Ԫ��
				while(it.hasNext()){
					//it.nextȡ��Ԫ��
					Menu u = it.next();
					if(u.getMenu_id().equals(me_id)){
						//it.remove����ǰ���ڵ��Ķ���ɾ��
						it.remove();
						break;//����while
					}
				}
				req.getServletContext().setAttribute("melist", rs);
		
	  }
			 
				
				RequestDispatcher dispatcher=req.getRequestDispatcher("showMenu.jsp");
				dispatcher.forward(req, resp);
				/*����ط�  д�Ĳ��Ǻ�����  ��  ���� ����ҳ�� �ͳɹ�ҳ��*/
	}

	
	
	public void getAllMenu(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		MenuDAO meDao=new MenuDAO();
		List<Menu> melist=meDao.getAll();
		
		HttpSession session=req.getSession();
		
		session.setAttribute("melist", melist);
		
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("showMenu.jsp");
		dispatcher.forward(req, resp);
		
	}
	
 }
	

