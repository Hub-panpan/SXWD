package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnection;

import com.model.Option;
import com.model.Vote;

public class VoteDAO{

  public boolean save(Vote vo) {
	Connection conn=DBConnection.getConnection();//声明一个连接对象
	PreparedStatement ps=null;
	try {
		ps=conn.prepareStatement("insert into Vote(vote_id,vote_name,vote_mesl,vote_date) values(?,?,?,?)");
		
		
		if(vo==null){
			System.out.println("空！！！！");
			return false;
		}
		System.out.println("增加  评论头信息："+vo.getVote_id()+"  "+vo.getVote_name());
		
		ps.setInt(1,vo.getVote_id());		
		ps.setString(2,vo.getVote_name());
		
		ps.setLong(3,vo.getVote_mesl());
		ps.setString(4,vo.getVote_date());
		
		
		
	
		
		int i=ps.executeUpdate();
		if(i==1){
			System.out.println("增加  评论头信息："+vo.getVote_id()+"  "+vo.getVote_name()+"成功！");
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
  
  
  public boolean delete(int vo_id) {   //注意这个  窗口 的ID 是String 类型的 不是int
	   Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("delete from Vote where vote_id=?");
			
			ps.setInt(1, vo_id);//将传进来的名字 
			
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
  
  
  public boolean update(Vote  vo,int old_id) {   //我的投票     id 能修改
	Connection conn=DBConnection.getConnection();
	PreparedStatement ps=null;
	
	try {
		ps=conn.prepareStatement("update Vote set vote_id=?,vote_name=? vote_mesl =? vote_date=? where vote_id=?");
		ps.setInt(1,vo.getVote_id());		
		ps.setString(2,vo.getVote_name());
		
		ps.setLong(3,vo.getVote_mesl());
		ps.setString(4,vo.getVote_date());
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
	   
  
  public Vote get(int vo_id) {
		Connection conn=DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Vote vo = null;//得先初始化为空
		
		try {
			ps=conn.prepareStatement("select  vote_id,vote_name,vote_mesl, vote_date from  Vote where vote_id=?");
			ps.setInt(1, vo_id);
			
			rs = ps.executeQuery();
			while(rs.next()){
				vo = new Vote();
				System.out.println("DAO查到  评论 头信 息"+rs.getString("vote_id")+rs.getString("vote_name"));
				
				vo.setVote_id(rs.getInt("vote_id"));			
				vo.setVote_name(rs.getString("vote_name"));	
				vo.setVote_mesl(Long.parseLong(rs.getString("vote_mesl")));
				vo.setVote_date((rs.getString("vote_date")));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return vo;
	}
  
  
  /*这个 方法 将在 监听器中被调用  数据初始化*/
  public List<Vote> getAll(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Vote> volist = new ArrayList<Vote>();//声名  一个集合 是用来放置  窗口对象
		try {
			ps = conn.prepareStatement("select vote_id ,vote_name,vote_mesl, vote_date from Vote");
			rs = ps.executeQuery();
			while(rs.next()){
				Vote vo = new Vote();
				vo.setVote_id(rs.getInt("vote_id"));
				vo.setVote_name(rs.getString("vote_name"));
				vo.setVote_mesl(Long.parseLong(rs.getString("vote_mesl")));
				vo.setVote_date((rs.getString("vote_date")));
				
				
				System.out.println("DAO getAll()方法执行中 获得到vote_id："+vo.getVote_id());
				volist.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return volist;
	}
}