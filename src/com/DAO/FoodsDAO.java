package com.DAO;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.COMM_FAILURE;

import com.DB.DBConnection;
import com.basefunction.Regex;
import com.model.Admin;
import com.model.Foods;
import com.model.FoodsPage;
import com.model.Menu;;

public class FoodsDAO {

/*增加一个新菜品*/
   public boolean save(Foods fo) {
	Connection conn=DBConnection.getConnection();//声明一个连接对象
	PreparedStatement ps=null;
	
	try {
		ps=conn.prepareStatement("insert into Foods(food_id,food_name,food_price,food_info,isremark,menu_id) values(?,?,?,?,?,?)");
		
		ps.setString(1,fo.getFood_id());
		ps.setString(2, fo.getFood_name());
		ps.setFloat(3, fo.getFood_price());   //   我传进来的参数 是 Float类型的 
		ps.setString(4, fo.getFood_info());
		ps.setInt(5, fo.getIsremark());   /*  注意 插入数据的   类型  这是 int 类型*/
		ps.setString(6, fo.getMenu_id());
		
		
		System.out.println("Food保存"+fo.getFood_name());
		
		int i=ps.executeUpdate();
		if(i==1){
			DBConnection.close(ps,conn);
			return true;
		}else{
			DBConnection.close(ps,conn);
			return false;
		}
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	DBConnection.close(ps,conn);
	return false;
  }
   
  /*删除一个菜品*/
   public boolean delete(String fo_id) {   //注意这个  窗口 的ID 是String 类型的 不是int
	   Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("delete from Menu where food_id=?");
			
			ps.setString(1, fo_id);//将传进来的名字 
			
			int i = ps.executeUpdate();
			if(i==1){
				DBConnection.close(ps,conn);
				return true;
			}else{
				DBConnection.close(ps,conn);
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(ps,conn);
		return false;
	}
   
   /*更新一个菜品信息*/
   public boolean update(Foods  fo,String fo_id) {   //我的菜单     食物 id 能修改
	Connection conn=DBConnection.getConnection();
	PreparedStatement ps=null;
	
	try {
		ps=conn.prepareStatement("update Foods set food_id=?,food_name=?,food_price=?,food_info=?,isremark=?,menu_id=? where food_id=?");
		ps.setString(1,fo.getFood_id());
		ps.setString(2, fo.getFood_name());
		ps.setFloat(3, fo.getFood_price());
		ps.setString(4, fo.getFood_info());
		ps.setInt(5, fo.getIsremark());   /*  注意 插入数据的   类型  这是 int 类型*/
		ps.setString(6, fo.getMenu_id());
		ps.setString(7, fo_id);
		

		
		int i = ps.executeUpdate();
		if(i==1){
			DBConnection.close(ps,conn);
			return true;
		}else{
			DBConnection.close(ps,conn);
			return false;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	DBConnection.close(ps,conn);
	return false;
   }
	   
   /*通过一个ID 获得一个菜品信息*/
   public Foods get(String fo_id) {
		Connection conn=DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Foods fo = null;//得先初始化为空
		try {
			ps=conn.prepareStatement("select food_id,food_name,food_price,food_info,isremark,menu_id  from  Foods where food_id=?");
			ps.setString(1, fo_id);
			rs = ps.executeQuery();
			while(rs.next()){
				fo = new Foods();
				System.out.println("DAO查到 食物  信息信息"+rs.getString("food_id")+rs.getString("food_name"));
				
				
				fo.setFood_id(rs.getString("food_id"));
				fo.setFood_name(rs.getString("food_name"));
				fo.setFood_price(rs.getFloat("food_price"));
				fo.setFood_info(rs.getString("food_info"));
	            fo.setIsremark(rs.getInt("isremark"));
	            fo.setMenu_id(rs.getString("menu_id"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return fo;
	}
   
   
   
   /*这个 方法 将在 监听器中被调用  数据初始化*/
  /* public List<Foods> getAll(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Foods> folist = new ArrayList<Foods>();//声名  一个集合 是用来放置  窗口对象
		try {
			ps = conn.prepareStatement("select food_id,food_name,food_price,food_info,isremark,menu_id from Menu");
			rs = ps.executeQuery();
			while(rs.next()){
				Foods fo = new Foods();
				fo.setFood_id(rs.getString("food_id"));
				fo.setFood_name(rs.getString("food_name"));
				fo.setFood_price(rs.getFloat("food_price"));
				fo.setFood_info(rs.getString("food_info"));
				fo.setIsremark(rs.getInt("isremark"));
				fo.setMenu_id(rs.getString("Menu_id"));
				
				folist.add(fo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return folist;
	}
   */
   /*************************************************/
   
   public FoodsPage getPage(int page,String me_id){
		Connection conn = DBConnection.getConnection();
		FoodsPage fp=new FoodsPage();
		
		String x="\'"+me_id+"\'";
		
		try {
			PreparedStatement ps = conn.prepareStatement("select count(*) from Foods where menu_id="+x);
			ResultSet rs = ps.executeQuery();//查询返回很多的记录 
			rs.next();
			 int totalcount = rs.getInt(1);   //得到记录的总数   是从数据库中查询出来的
			 int count=6;                     //每页显示条数 自己设置
			 
			//总记录数  /10  >0  加一页       =0   则为商
			int totalpage = totalcount%count>0?totalcount/count+1:totalcount/count; //总共多少页
			//这个也很好理解   得到页数之后 -1 *10  就为？
		    int 	pagecount = (page-1)*count;//下次查询的起始  值
		    
		    fp.setTotalcount(totalcount);
		    fp.setTotalpage(totalpage);
		    fp.setCount(count);		  
		    fp.setCurrentpage(page);
		    fp.setPagecount(pagecount);
	   
    } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			return fp;
   
  }
   public List<Foods> split_page_food_list(FoodsPage fp,String me_id){
		//我只需要你给我  传入进来一个页数   我返回给你一个产品列表的集合 
		Connection conn = DBConnection.getConnection();
		//声明 连接  目的是为了  连接将数据库中的所有记录都给放到    产品集合里面去
		
		String x="\'"+me_id+"\'";
		
		System.out.println("转义字符："+x);
		
		List<Foods> split_page_list = new ArrayList<Foods>();
		
		
			  int totalcount=fp.getTotalcount();//总条数
			  int count=fp.getCount();//设置默认显示的 条数为10条
			  int totalpage=fp.getTotalpage();//总页数
			  int pagecount=fp.getPagecount();// 
			  int currentpage=fp.getCurrentpage();	
		
		try {
			PreparedStatement ps = conn.prepareStatement("select food_id,food_name,food_price,food_info,isremark,menu_id  from  Foods where menu_id="+x+"  limit "+pagecount+","+count);
			ResultSet rs = ps.executeQuery();//查询返回很多的记录 
				
			
	
			while(rs.next()){
				Foods fo = new Foods();
				fo.setFood_id(rs.getString("food_id"));
				fo.setFood_name(rs.getString("food_name"));
				fo.setFood_price(rs.getFloat("food_price"));
				fo.setFood_info(rs.getString("food_info"));
				fo.setIsremark(rs.getInt("isremark"));
				fo.setMenu_id(rs.getString("Menu_id"));
				split_page_list.add(fo);
			}
			DBConnection.close(rs, ps, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return split_page_list;
	}
   /***************************************************************/
   
   
   /* 实际 上  用户和 管理员 都完成！！！！！！*/
   public List<Foods> sigle_menu_list(String menu_id) {
	  
	    Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Foods> sigle_menu_list = new ArrayList<Foods>();//声名  一个集合 是用来放置  窗口对象
		try {
			ps = conn.prepareStatement("select food_id,food_name,food_price,food_info,isremark,menu_id from Foods where Menu_id=?");
			ps.setString(1,menu_id);
			rs = ps.executeQuery();
			while(rs.next()){
				Foods fo = new Foods();
				fo.setFood_id(rs.getString("food_id"));
				fo.setFood_name(rs.getString("food_name"));
				fo.setFood_price(rs.getFloat("food_price"));
				fo.setFood_info(rs.getString("food_info"));
				fo.setIsremark(rs.getInt("isremark"));
				fo.setMenu_id(rs.getString("Menu_id"));
				
				sigle_menu_list.add(fo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return sigle_menu_list;
	}
   
   
   
   
   
   
}