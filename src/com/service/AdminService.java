package com.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAO;
import com.DAO.MemberDao;
import com.basefunction.Regex;
import com.model.Admin;
import com.model.Member;




public class AdminService {

public void login(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		String adname= req.getParameter("admin_name");
		String adpwd =  req.getParameter("admin_password");
		System.out.println("adpwd");
		String advcode = req.getParameter("vcode");
		HttpSession session=req.getSession();
		String adyzm=(String)session.getAttribute("vcode");
		System.out.println("验证码"+advcode+"  "+adyzm);
		Admin adm = new AdminDAO().get(adname);//通过输入的 名字 来查询相应的 管理员是否 存在
		
		if(adm!=null){
			System.out.println("验证登录时 是够从数据库中获取到 用户信息"+adm.getAdmin_name());
           //管理员 目前只验证    用户名和密码 也验证码 
			if(adm.getAdmin_name().equals(adname)&&
					
			   adm.getAdmin_password().equals(adpwd)&&
			   
			   advcode.equals(adyzm)		
					){
				session.setAttribute("active_admin",adm);
				
				RequestDispatcher dispatcher=req.getRequestDispatcher("admin/adminindex.jsp");
				dispatcher.forward(req, resp);
			}
			
			else{
				req.getSession().setAttribute("errormsg", "登录失败!请仔细检查用户名和密码！");
				RequestDispatcher dispatcher=req.getRequestDispatcher("error.jsp");
				dispatcher.forward(req, resp);

			}
			
		}else{
			req.getSession().setAttribute("errormsg", "登录失败!用户不存在！");
			RequestDispatcher dispatcher=req.getRequestDispatcher("error.jsp");
			dispatcher.forward(req, resp);
			
		}
		
		
}

public void logoff(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
HttpSession session = req.getSession(false);//防止创建Session
		if(session == null){
			
		resp.sendRedirect("/SXWD/admin/adminindex.jsp");
			
		return;
	
		}else{
			session.removeAttribute("active_admin");		
			resp.sendRedirect("/SXWD/admin/adminindex.jsp");
			return;
		}
		
		
		
}

@SuppressWarnings("null")
public void showUser(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
	  
	
	String find_value=req.getParameter("find_value");
	String input_value=req.getParameter("search_input");
	
	MemberDao dao=new MemberDao();
	List<Member> members=new ArrayList<Member>();
	HttpSession session=req.getSession();
	session.removeAttribute("mlist");
	if(find_value.endsWith("All")){
		
		System.out.println("获取到表单的值："+find_value);
		System.out.println("获取到输入字段："+input_value);
		
		members=dao.getAll();
		session.setAttribute("mlist", members);
		RequestDispatcher dispatcher=req.getRequestDispatcher("showMember.jsp");
		dispatcher.forward(req, resp);
		return;
		
	}else if(!input_value.equals(null)){
		
		System.out.println("获取到表单的值："+find_value);
		System.out.println("获取到输入字段："+input_value);
		
			members=dao.getAllLike(find_value, input_value);//通过 手机号获得单一用户
			session.setAttribute("mlist", members);	
			RequestDispatcher dispatcher=req.getRequestDispatcher("showMember.jsp");
			dispatcher.forward(req, resp);
			return;
	}else{
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("showMember.jsp");
		dispatcher.forward(req, resp);
	}
}
      
/*使用来 转发到更新页面的*/
public void updateUserInfo01(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
	String updateUser=req.getParameter("mem_id");
	System.out.println("测试是否能在showuser.jsp页面获得到 mem_id值："+updateUser);
	
	Member mem=new Member();
	MemberDao dao=new MemberDao();
	mem=dao.get(updateUser);
	
	HttpSession session=req.getSession();
	session.setAttribute("updateUser", mem);
	RequestDispatcher dispatcher=req.getRequestDispatcher("updateUserInfo.jsp");
	dispatcher.forward(req, resp);
	
  }

/* 提交信息  修改到数据库*/
public void updateUserInfo02(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
	
	    String uphone=req.getParameter("tel");
		String uname = req.getParameter("username");
		String upwd = req.getParameter("password");
		//String reupwd=req.getParameter("repassword"); 
	    String uaddrs=req.getParameter("address");
	    
	    Float upoints=Float.parseFloat(req.getParameter("points"));
	    int urights=Integer.parseInt(req.getParameter("rights"));
	    
	    
	    System.out.println("updateUserInfo02()能够在提交的更新用户的页面得到：用户名"+uname);
	    System.out.println("updateUserInfo02()能够在提交的更新用户的页面得到：手机号"+uphone);
	    System.out.println("updateUserInfo02()能够在提交的更新用户的页面得到：用户名"+upwd);
	    System.out.println("updateUserInfo02()能够在提交的更新用户的页面得到：手机号"+uaddrs);
	    System.out.println("updateUserInfo02()能够在提交的更新用户的页面得到：用户名"+upoints);
	    System.out.println("updateUserInfo02()能够在提交的更新用户的页面得到：手机号"+urights);
	    
	    
	    
	    HttpSession session=req.getSession();
	    Member mx = new Member();
		mx.setMember_phone(uphone);
		mx.setMember_name(uname);
		mx.setMember_password(upwd);
		mx.setMember_address(uaddrs);
		mx.setMember_points(upoints);
		mx.setMember_rights(urights);
		MemberDao dao=new MemberDao();
		
		boolean x=dao.update(mx);
		
		List<Member> members=( List<Member>)session.getAttribute("mlist");
		
		if(x&&members!=null){
			
			
			
			Iterator<Member> it = members.iterator();
			// it.hasNext判断是否有下一个元素
			while (it.hasNext()) {
				// it.next取出元素
				Member u = it.next();
				if (u.getMember_phone().equals(uphone)) {
					it.remove();
					break;// 结束while
				}
			}
			members.add(mx);
			session.setAttribute("mlist", members);
		}
		
		Member  mem=(Member)session.getAttribute("active_user");
	//	Admin  adm=(Admin)session.getAttribute("active_admin");
		if(mem==null){
			RequestDispatcher dispatcher=req.getRequestDispatcher("showMember.jsp");
			dispatcher.forward(req, resp);
		}else{
			
			session.setAttribute("active_user",mx);
			RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, resp);
		}
		
	
  }

/*删除用户*/
public void deleteUserInfo(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
	String updateUser=req.getParameter("mem_id");
	System.out.println("测试是否能在showuser.jsp页面获得到 mem_id值："+updateUser);
	
	MemberDao dao=new MemberDao();
	boolean bool=dao.delete(updateUser);
	if(bool==true){
		
		HttpSession session=req.getSession();
		List<Member> members=( List<Member>)session.getAttribute("mlist");
		
		Iterator<Member> it = members.iterator();
		// it.hasNext判断是否有下一个元素
		while (it.hasNext()) {
			// it.next取出元素
			Member u = it.next();
			if (u.getMember_phone().equals(updateUser)) {
				it.remove();
				break;// 结束while
			}
		}
		
		session.setAttribute("mlist", members);
		
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("showMember.jsp");
		dispatcher.forward(req, resp);
		/*这个地方  写的不是很完善  等  补上 错误页面 和成功页面*/
	}
	
	
}


public void addMember(HttpServletRequest req,HttpServletResponse resp) throws IOException,ServletException{
    req.setCharacterEncoding("UTF-8");
    
    String uphone=req.getParameter("tel");
	String uname = req.getParameter("username");
	String upwd = req.getParameter("password");
	String reupwd=req.getParameter("repassword");
    String uaddrs=req.getParameter("address");
    int upoints=Integer.parseInt(req.getParameter("points"));
    int urights=Integer.parseInt(req.getParameter("rights"));
 
 
    
	MemberDao dao=new MemberDao();
	Member m = dao.get(uphone);
	Regex re=new Regex();

	
	
	
	
	if(m!=null){
		try {
		req.getSession().setAttribute("errormsg", m.getMember_phone()+m.getMember_name()+"当前手机号已经被注册");
		RequestDispatcher dispatcher=req.getRequestDispatcher("adminError.jsp");
		
			dispatcher.forward(req, resp);
		} catch (ServletException e) {
			
			e.printStackTrace();
		}

	}else
	            //判断 是否是合法的手机号码
	if(!re.isMobileN02(uphone)){
		
		req.getSession().setAttribute("errormsg", "正则匹配之后-请输入有效手机号");
		RequestDispatcher dispatcher=req.getRequestDispatcher("adminError.jsp");
		try {
			dispatcher.forward(req, resp);
		} catch (ServletException e) {
			
			e.printStackTrace();
		}
	}else
	          //判断两次输入密码是否一致
	if(!upwd.equals(reupwd)){
		System.out.println("控制台："+!upwd.equals(reupwd));
		System.out.println("控制台："+upwd+"  "+reupwd);
		req.getSession().setAttribute("errormsg", "两次输入密码不一致");
		RequestDispatcher dispatcher=req.getRequestDispatcher("adminError.jsp");
		try {
			dispatcher.forward(req, resp);
		} catch (ServletException e) {
			
			e.printStackTrace();
		}
	}else 
		//判断是否是有效的用户名 
		if(re.isValidName(uname)){
			req.getSession().setAttribute("errormsg", "用户名包涵非法字符");
			RequestDispatcher dispatcher=req.getRequestDispatcher("adminError.jsp");
			try {
				dispatcher.forward(req, resp);
			} catch (ServletException e) {
				
				e.printStackTrace();
			}
		}
	
		else 
			//判断是否是有效的地址 
			if(!re.isValidAddr(uaddrs)){
				req.getSession().setAttribute("errormsg", "地址长度应大于6并不能包涵除#以外其他字符");
				RequestDispatcher dispatcher=req.getRequestDispatcher("adminError.jsp");
				try {
					dispatcher.forward(req, resp);
				} catch (ServletException e) {
					
					e.printStackTrace();
				}
			}

	else{
		
		 
		Member mx = new Member();
		mx.setMember_phone(uphone);
		mx.setMember_name(uname);
		mx.setMember_password(upwd);
		mx.setMember_address(uaddrs);
		mx.setMember_points(upoints);
		mx.setMember_rights(urights);
		
	
		if(dao.save(mx)){
			
			
			HttpSession session=req.getSession();
			List<Member> members=( List<Member>)session.getAttribute("mlist");
			members.add(mx);
			session.setAttribute("mlist", members);
		
			
			
			resp.sendRedirect("showMember.jsp");
		}else{
			req.getSession().setAttribute("errormsg", "会员注册失败");
			resp.sendRedirect("error.jsp");
		}
	}
	
}

}








