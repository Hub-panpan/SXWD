package com.service;



import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MenuDAO;
import com.DAO.OptionDAO;
import com.DAO.VoteDAO;
import com.DAO.VoteInfoDAO;
import com.model.Count;
import com.model.Menu;
import com.model.Option;
import com.model.Vote;
import com.model.VoteInfo;
import com.sun.crypto.provider.RSACipher;

public class VoteService {


	@SuppressWarnings("unchecked")
	public void addVote(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		String vote_id = req.getParameter("vote_id");
		String vote_name = req.getParameter("vote_name");
		String vote_mesl=req.getParameter("vote_mesl");
		String vote_date=req.getParameter("vote_date");
		
		// String vote_deadline=req.getParameter("vote_deadline");
		//String vote_deadline="2017-07-23 12:25:32 12";
		//System.out.println("显示一个  截至日期"+vote_deadline);
		
			
		// SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ms");
		// Date date = null; 
		// try { 
		// date = format.parse(vote_deadline);
		// System.out.println(date);
		// }
		// catch (ParseException e) { 
		 // TODO Auto-generated catch block 
		// e.printStackTrace();
		//  }
		 //  Date  datez=new Date();
			//System.out.print(datez);
		//	
		//	java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
		//	System.out.print(currentDate);
		
	
		
		
		Vote vo=new Vote();
		
		vo.setVote_id(Integer.parseInt(vote_id));        // 强制转型一下
		vo.setVote_name(vote_name);
		vo.setVote_mesl(Long.parseLong(vote_mesl));
		vo.setVote_date(vote_date);              //默认为一	
		
		VoteDAO reDao=new VoteDAO();
        boolean bool=reDao.save(vo);
		
        HttpSession session=req.getSession();
        
        if(bool){
        	
        	//如果添加成功的话 就要更新 范围信息
        	
        	
        	  List<Vote> rs = (List<Vote>)req.getServletContext().getAttribute("all_Vote_list");
        	  
        	  
        	  rs.add(vo);
			  session.setAttribute("all_Vote_list", rs);
   			  RequestDispatcher dispatcher=req.getRequestDispatcher("showAllvote.jsp");
			  dispatcher.forward(req, resp);
        }else{
        	
        	 System.out.println("voteService增加新窗口失败");   
        	 req.getServletContext().setAttribute("voteService增加新窗口失败", "msg");
        	 RequestDispatcher dispatcher=req.getRequestDispatcher("showAllvote.jsp");
			  dispatcher.forward(req, resp);
        }
		
		
		
		
	}
	
	@SuppressWarnings("unchecked")
	public void deleteVote(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		int vo_id=Integer.parseInt(req.getParameter("vo_id")); //  首先从页面上  获取 提交的     Vote  id
		System.out.println("获取到当前请求的   删除vote 投票体的的id"+vo_id);
		VoteDAO remdao=new VoteDAO();
		
		boolean bool=remdao.delete(vo_id);   
		 
		if(bool==true){
			
			  List<Vote> all_Vote_list= (List<Vote>)req.getServletContext().getAttribute("all_Vote_list");
			  
			  
				Iterator<Vote> it = all_Vote_list.iterator();			
				while(it.hasNext()){			
					Vote u = it.next();
					if(u.getVote_id()==vo_id){
				
						it.remove();
						break;
					}
				}
				req.getServletContext().setAttribute("all_Vote_list", all_Vote_list);
		
	  }
			 
				
				RequestDispatcher dispatcher=req.getRequestDispatcher("showVote.jsp");
				dispatcher.forward(req, resp);
				
	}
	

	@SuppressWarnings("unchecked")
	/*public void passVote(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		int rem_id=Integer.parseInt(req.getParameter("rem_id"));
		
		VoteDAO vomdao=new VoteDAO();
		
		boolean bool=vomdao.update(rem_id);   
		
		if (bool) {	
			
			  List<Vote> rs = (List<Vote>)req.getSession().getAttribute("all_Vote_list");
					  
					  Iterator<Vote> it = rs.iterator();
						//it.hasNext�ж��Ƿ�����һ��Ԫ��
						while(it.hasNext()){
							//it.nextȡ��Ԫ��
							Vote re = it.next();
							if(re.getVote_id()==rem_id){
							
								re.setIsPass(1);
								break;//����while
							}
						}
						req.getSession().setAttribute("all_Vote_list", rs);
			
			
			
			
			System.out.println("通过！");
			RequestDispatcher dispatcher=req.getRequestDispatcher("showVote.jsp");
			dispatcher.forward(req, resp);
			
		}else{
			System.out.println("修改通过失败");
		}
		
		
		
	}*/
	
	
	 /*  这个 请求的是 显示现在  存在的   投票的 文章 的 详细内容 都有啥*/
	
	public void getSingleVote(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		int vo_id=Integer.parseInt(req.getParameter("vo_id"));//  首先从页面上  获取 提交的     Vote  id
		System.out.println("获取到当前请求的 投票的id"+vo_id);
		VoteDAO vodao=new VoteDAO();
		OptionDAO opDao=new OptionDAO();
		
		Vote single_Vote=vodao.get(vo_id);           		   //返回的是一个  投票的头对象
		List<Option> oplist=opDao.getSingleAllOption(vo_id);	//返回头片的选项信息
		
		System.out.println("获取到返回的  选项列表的长度："+oplist.size());
		VoteInfoDAO vofodao=new VoteInfoDAO();
		List<Count> countinfo= vofodao.count(vo_id);
		
		HttpSession session=req.getSession();
		session.setAttribute("single_Vote", single_Vote);
		session.setAttribute("oplist", oplist);
		session.setAttribute("countinfo", countinfo);
	
		
	
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("showSingleVoteDetail.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
    /*  这个 请求的是 显示现在  存在的   投票的 都有啥文章*/
	
	public void getAllVote(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		
		VoteDAO redao=new VoteDAO();
		List<Vote> all_Vote_list=redao.getAll();
		HttpSession session=req.getSession();
	    session.setAttribute("all_Vote_list", all_Vote_list);
	    RequestDispatcher dispatcher=req.getRequestDispatcher("showAllvote.jsp");
		dispatcher.forward(req, resp);
	}

	public void addVoteOption(HttpServletRequest req,HttpServletResponse resp)  throws IOException, ServletException{
		String option_value=req.getParameter("option_value");
		String option_content=req.getParameter("option_content");
		String vote_id=req.getParameter("vote_id").trim();
		
		
		Option op=new Option();
		
		
		op.setOption_value(option_value);
		op.setOption_content(option_content);
		op.setVote_id(Integer.parseInt(vote_id));
		
		OptionDAO opDao=new OptionDAO();
		boolean bool=opDao.save(op);
		
		if(bool){
			
			
			 RequestDispatcher dispatcher=req.getRequestDispatcher("showAllvote.jsp");
				dispatcher.forward(req, resp);
          
		   
		}
		
	}
	
	
	
	
	
	
	
}
