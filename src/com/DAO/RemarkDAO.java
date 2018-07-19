package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnection;

import com.model.Remark;

public class RemarkDAO {
	   public boolean save(Remark rem) {
			Connection conn=DBConnection.getConnection();//声明一个连接对象
			PreparedStatement ps=null;
			//插入的数据 现在只有  3个字段
			
			
			try {
				ps=conn.prepareStatement("insert into Remark(remark_content,food_id,member_id,isPass)  values(?,?,?,?)");
				
				
				ps.setString(1, rem.getRemark_content());
				ps.setString(2, rem.getFood_id());
				ps.setString(3, rem.getMember_id());
				
				ps.setInt(4, 0);//默认值是 0
				
				System.out.println(rem.getRemark_id());
				
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
		   
		   
		   public boolean delete(int rem_id) {
			   Connection conn = DBConnection.getConnection();
				PreparedStatement ps = null;
				try {
					ps = conn.prepareStatement("delete from Remark where remark_id=?");
					
					ps.setInt(1, rem_id);//将传进来的名字 
					
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
		   
		   
		   public boolean update(int rem_id) {
			   Connection conn = DBConnection.getConnection();
				PreparedStatement ps = null;
				try {
					ps = conn.prepareStatement("update  Remark set isPass=1   where remark_id=?");
					
					ps.setInt(1, rem_id);//将传进来的名字 
					
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
		   
		   
		   public List<Remark> getSingleAll(String fo_id) {
			   Connection conn = DBConnection.getConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				List<Remark> single_remark_list = new ArrayList<Remark>();
				try {
					ps = conn.prepareStatement("select remark_id,remark_content,food_id,member_id,remark_date from Remark where food_id=? and isPass=1");
					
					//String x="\'"+fo_id+"\'";
					
					System.out.println("请求显示的详细的 FOOD_ID"+fo_id);
					ps.setString(1,fo_id);
					rs = ps.executeQuery();
					while(rs.next()){
						Remark rem = new Remark();
						rem.setRemark_id(rs.getInt("remark_id"));
						rem.setRemark_content(rs.getString("remark_content"));
						rem.setFood_id(rs.getString("food_id"));
						rem.setMember_id(rs.getString("member_id"));
						rem.setRemark_date(rs.getString("remark_date"));
						
						single_remark_list.add(rem);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				DBConnection.close(rs,ps,conn);
				return single_remark_list;
			}
		   
		   
		   public List<Remark> getAll() {
			   Connection conn = DBConnection.getConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				List<Remark> all_remark_list = new ArrayList<Remark>();
				try {
					ps = conn.prepareStatement("select remark_id,remark_content,food_id,member_id,remark_date ,isPass from Remark");
					
					rs = ps.executeQuery();
					while(rs.next()){
						Remark rem = new Remark();
						rem.setRemark_id(rs.getInt("remark_id"));
						rem.setRemark_content(rs.getString("remark_content"));
						rem.setFood_id(rs.getString("food_id"));
						rem.setMember_id(rs.getString("member_id"));
						rem.setRemark_date(rs.getString("remark_date"));
						System.out.println("初始化评论数据："+rem.getRemark_date());
						rem.setIsPass(Integer.parseInt(rs.getString("isPass")));
						all_remark_list.add(rem);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				DBConnection.close(rs,ps,conn);
				return all_remark_list;
			}
		   
		   
}
