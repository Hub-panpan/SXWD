 package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnection;
import com.model.Menu;;

public class MenuDAO {

   public boolean save(Menu me) {
	Connection conn=DBConnection.getConnection();//声明一个连接对象
	PreparedStatement ps=null;
	try {
		ps=conn.prepareStatement("insert into Menu(menu_id,menu_name) values(?,?)");
		
		
		if(me==null){
			System.out.println("空！！！！");
		}
		System.out.println("增加新窗口："+me.getMenu_id());
		
		ps.setString(1,me.getMenu_id());
		ps.setString(2,me.getMenu_name());
		
		System.out.println(me.getMenu_name());
		
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
   
   
   public boolean delete(String me_id) {   //注意这个  窗口 的ID 是String 类型的 不是int
	   Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("delete from Menu where menu_id=?");
			
			ps.setString(1, me_id);//将传进来的名字 
			
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
   
   
   public boolean update(Menu  me,String old_id) {   //我的菜单     id 能修改
	Connection conn=DBConnection.getConnection();
	PreparedStatement ps=null;
	
	try {
		ps=conn.prepareStatement("update Menu set menu_id=?,menu_name=? where menu_id=?");
		ps.setString(1, me.getMenu_id());
		ps.setString(2, me.getMenu_name());
		ps.setString(3, old_id);

		
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
	   
   
   public Menu get(String me_id) {
		Connection conn=DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Menu me = null;//得先初始化为空
		
		try {
			ps=conn.prepareStatement("select  menu_id,menu_name from  Menu where menu_id=?");
			ps.setString(1, me_id);
			
			rs = ps.executeQuery();
			while(rs.next()){
				me = new Menu();
				System.out.println("DAO查到 菜单信息信息"+rs.getString("menu_id")+rs.getString("menu_name"));
				
				me.setMenu_id(rs.getString("menu_id"));			
				me.setMenu_name(rs.getString("menu_name"))    ;	
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return me;
	}
   
   
   /*这个 方法 将在 监听器中被调用  数据初始化*/
   public List<Menu> getAll(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Menu> melist = new ArrayList<Menu>();//声名  一个集合 是用来放置  窗口对象
		try {
			ps = conn.prepareStatement("select menu_id ,menu_name from Menu");
			rs = ps.executeQuery();
			while(rs.next()){
				Menu me = new Menu();
				me.setMenu_id(rs.getString("menu_id"));
				me.setMenu_name(rs.getString("menu_name"));
				System.out.println("获得到menu_id："+me.getMenu_id());
				melist.add(me);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return melist;
	}
}