package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnection;
import com.model.Option;


public class OptionDAO {

	 public boolean save(Option op) {
			Connection conn=DBConnection.getConnection();//声明一个连接对象
			PreparedStatement ps=null;
			try {
				ps=conn.prepareStatement("INSERT INTO `Option` ( `option_value`, `option_content`, `vote_id`) VALUES(?,?,?)");
				
				
				if(op==null){
					System.out.println("空！！！！");
					return false;
				}
				System.out.println("增加 投票选项信息 ："+op.getOption_id());
				
				//ps.setInt(1,op.getOption_id());		
				ps.setString(1,op.getOption_value());
				ps.setString(2,op.getOption_content());
				ps.setInt(3,op.getVote_id());
				
				
				
				System.out.println("当前正在执行 插入一条  选项信息："+op.getOption_content()+"选项！");
				
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
		  
		  
		  public boolean delete(int op_id) {   //
			   Connection conn = DBConnection.getConnection();
				PreparedStatement ps = null;
				try {
					ps = conn.prepareStatement("delete from Option where option_id=?");
					
					ps.setInt(1, op_id);//将传进来的名字 
					
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
		  
		  
		  public boolean update(Option  op,int old_id) {   //我的投票     id 能修改
			Connection conn=DBConnection.getConnection();
			PreparedStatement ps=null;
			
			try {
				ps=conn.prepareStatement("update Option set option_id=?,option_value=?,option_content=? vote_id =?  where option_id=?");
				ps.setInt(1,op.getOption_id());		
				ps.setString(2,op.getOption_value());
				
				ps.setString(3,op.getOption_content());
				ps.setInt(4,op.getVote_id());
				ps.setInt(5, old_id);

				
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
			   
		  
		  public Option get(int op_id) {
				Connection conn=DBConnection.getConnection();
				PreparedStatement ps=null;
				ResultSet rs=null;
				Option op = null;//得先初始化为空
				
				try {
					ps=conn.prepareStatement("select option_id,option_value,option_content,vote_id from Option where option_id=?");
					ps.setInt(1, op_id);
					
					rs = ps.executeQuery();
					while(rs.next()){
						op = new Option();
						System.out.println("DAO  get方法 执行中：查到选项ID:"+rs.getString("option_id")+"选项值："+rs.getString("option_value"));
						
						op.setOption_id(rs.getInt("option_id"));
						op.setOption_value(rs.getString("option_value"));
						op.setOption_content(rs.getString("option_content"));
						op.setVote_id((rs.getInt("vote_id")));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				DBConnection.close(rs,ps,conn);
				return op;
			}
		  
		  
		 /*这个方法是 用来显示再  投票详情的时候 列出的  选项详情*/
		  public List<Option> getSingleAllOption(int vo_id){
				Connection conn = DBConnection.getConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				List<Option> oplist = new ArrayList<Option>();//声名  一个集合 是用来放置  窗口对象
				try {
					ps = conn.prepareStatement("select option_id,option_value,option_content,vote_id  FROM SXWD.`Option`  where vote_id="+vo_id);
					rs = ps.executeQuery();
					while(rs.next()){
						Option op = new Option();
						op.setOption_id(rs.getInt("option_id"));
						op.setOption_value(rs.getString("option_value"));
						op.setOption_content(rs.getString("option_content"));
						op.setVote_id((rs.getInt("vote_id")));
						
						
						System.out.println("option DAO 获得到Option_value："+op.getOption_value());
						oplist.add(op);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				DBConnection.close(rs,ps,conn);
				return oplist;
			}
	
}
