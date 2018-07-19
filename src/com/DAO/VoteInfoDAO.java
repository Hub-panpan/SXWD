package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnection;

import com.model.Count;
import com.model.Vote;
import com.model.VoteInfo;

public class VoteInfoDAO{

  public boolean save(VoteInfo vofo) {
	Connection conn=DBConnection.getConnection();//声明一个连接对象
	PreparedStatement ps=null;
	try {
		ps=conn.prepareStatement("insert into VoteInfo(member_phone,vote_id,vote_name,option_value) values(?,?,?,?)");
		
		
		if(vofo==null){
			System.out.println("空！！！！");
			return false;
		}
		
			
		ps.setString(1,vofo.getMember_phone());		
		ps.setInt(2,vofo.getVote_id());		
		ps.setString(3,vofo.getVote_name());			
		ps.setString(4,vofo.getOption_value());
	// 	ps.setString(5,vofo.getVote_time());  我插入的时间 就是 这个投票的时间
		
		
		
		ps.setString(1,vofo.getMember_phone());		
		
		int i=ps.executeUpdate();
		if(i==1){
			
			System.out.println(vofo.getMember_phone()+"投票信息 一条成功！！：");
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
  
  
  public boolean delete(String vofo_mem_phone) {   //注意这个   传进来一个手机号 删除
	   Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("delete from VoteInfo where member_id=?");
			
			ps.setString(1, vofo_mem_phone);//将传进来的名id
			
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
  
  
  /*public boolean update(VoteInfo  vofo,int old_id) {   //我的投票     id 能修改
	Connection conn=DBConnection.getConnection();
	PreparedStatement ps=null;
	
	try {
		ps=conn.prepareStatement("update VoteInfo set member_phone=?,vote_id=?,vote_name=?,option_value=? vwhere vote_id=?");
		ps.setString(1,vofo.getMember_phone());		
		ps.setInt(2,vofo.getVote_id());		
		ps.setString(3,vofo.getVote_name());			
		ps.setString(4,vofo.getOption_value());
		
		int i = ps.executeUpdate();
		if(i==1){
			DBConnection.close(ps,conn);
			return true;
		}else{
			DBConnection.close(ps,conn);
			return false;
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	DBConnection.close(ps,conn);
	return false;
  }*/
	   
  
  public boolean  get(String mem_phone,int vo_id) {
		Connection conn=DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
	    boolean bool=false;
		//VoteInfo vofo = null;//得先初始化为空
		try {
			ps=conn.prepareStatement("select  member_phone,vote_id,vote_name,option_value,vote_time from  VoteInfo where member_phone=? and vote_id =?");
			ps.setString(1, mem_phone);
			ps.setInt(2,vo_id);
			
			rs = ps.executeQuery();
			while(rs.next()){
			
				//vofo = new VoteInfo();
				bool=true;
				
				System.out.println("DAO查到 当前用户"+rs.getString("member_phone")+"信息信息!已经在"+rs.getString("vote_time")+"时间投过"+rs.getString("vote_name"));
				
				/*vo.setVote_id(rs.getInt("vote_id"));			
				vo.setVote_name(rs.getString("vote_name"));	
				vo.setVote_deadline(rs.getString("vote_deadline"));
				vo.setVote_outdate((rs.getInt("vote_id")));*/
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		//return vo;
		
		return bool;
	}
  
  
  /*这个 方法 将在 监听器中被调用  数据初始化*/
  public List<VoteInfo> getAll(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<VoteInfo> volist = new ArrayList<VoteInfo>();//声名  一个集合 是用来放置  窗口对象
		try {
			ps = conn.prepareStatement("select member_phone,vote_id,vote_name,option_value, vote_time from VoteInfo");
			rs = ps.executeQuery();
			while(rs.next()){
				VoteInfo vofo = new VoteInfo();
				vofo.setMember_phone(rs.getString("member_phone"));
				vofo.setVote_id(Integer.parseInt(rs.getString("vote_id")));
				
			vofo.setVote_name(rs.getString("vote_name"));
				vofo.setOption_value(rs.getString("option_value"));
				vofo.setVote_time(rs.getString("vote_time"));
				
				System.out.println("VoteInfoDAO:获得到member_phone："+vofo.getMember_phone());
				volist.add(vofo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return volist;
	}




/*测试的时候  2 B 用  返回的是  ：一个封装好的对象  包含选项信息  和 计算  信息*/
  public List<Count>  count(int vo_id){
	  System.out.println("已经进去 count 方法内！");
	    Connection conn=DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		
		List<Count> colist=new ArrayList<Count>();
		try {
			ps=conn.prepareStatement("select vote_id,option_value ,count(option_value) from  VoteInfo where vote_id=? group by option_value");
			
			ps.setInt(1,vo_id);			
			rs = ps.executeQuery();
			while(rs.next()){
			
				Count count = new Count();
				count.setVote_id(rs.getInt("vote_id"));
				count.setOption_value(rs.getString("option_value"));
				count.setCount(rs.getInt(3));
						
				colist.add(count);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		//return vo;
		
		System.out.println("已经封装好 计数对象!共有"+colist.size()+"项");
		
		
		return colist;
	}



}