package com.listener;


import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;

import com.DAO.FoodsDAO;
import com.DAO.MenuDAO;
import com.DAO.RemarkDAO;
import com.DAO.VoteDAO;
import com.model.Foods;
import com.model.FoodsPage;
import com.model.Menu;
import com.model.Remark;
import com.model.Vote;



/**
 * Application Lifecycle Listener implementation class InitListener
 *
 */
public class initListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public initListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
        //数据初始化
    	/*List<Channel> clist = DB.getClist();*/
    	
    	/*List<Content> contentlist = DB.getContentList();*/
    	//存入application范围
    	/*sce.getServletContext().setAttribute("clist", clist);
    	sce.getServletContext().setAttribute("contentlist", contentlist);
    */
    	
    	MenuDAO meDao=new MenuDAO();
		List<Menu> melist=meDao.getAll();
		sce.getServletContext().setAttribute("melist", melist);
		
	
		
		
		FoodsDAO foDao=new FoodsDAO();//初始化 数据操作  订餐首页
		FoodsPage pp=foDao.getPage(1,"A");
		List<Foods> index_foods=foDao.split_page_food_list(pp,"A");
		sce.getServletContext().setAttribute("pp", pp);
		sce.getServletContext().setAttribute("index_foods", index_foods);
		
		
		
		
		VoteDAO vodao=new VoteDAO();//初始化 数据操作  订餐首页
		List<Vote> all_Vote_list=vodao.getAll();
		sce.getServletContext().setAttribute("all_Vote_list", all_Vote_list);
		
		
		
		
		
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
