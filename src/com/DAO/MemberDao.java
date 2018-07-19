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
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.basefunction.Regex;
import com.model.Member;

public class MemberDao {

	//插入一个会员的信息
	
	public boolean save(Member mem){//首先先传进来的一个会员的对象 
		Connection conn = DBConnection.getConnection();//声明连接
		PreparedStatement ps = null; //得到的结果集 现在为空
		try {
			ps = conn.prepareStatement("insert into Member(member_phone ,member_name ,member_password,member_address ,member_points,member_rights) values(?,?,?,?,?,?)");
			ps.setString(1, mem.getMember_phone());
			System.out.println(mem.getMember_phone());
			
			ps.setString(2, mem.getMember_name());
			System.out.println( mem.getMember_name());
			
			ps.setString(3, mem.getMember_password());
			System.out.println(mem.getMember_password());
			
			ps.setString(4, mem.getMember_address());
			
			ps.setFloat(5,mem.getMember_points() );
			
			ps.setInt(6, mem.getMember_rights());
			
			
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
	//通过 手机号 的编号 删除会员的信息
	public boolean delete(String member_phone){
		Connection conn = DBConnection.getConnection();
	PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("delete from Member where member_phone=?");
			ps.setString(1, member_phone);
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
	//通过手机号 来改变会员的信息
	public boolean update(Member mem){ //更新信息 我们是先将一个更新好的对象封装好 然后再对数据库进行操作
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("update Member set member_phone=?, member_name=?, member_password=?, member_address=?,member_points=?, member_rights=? where member_phone=?");
			
			/*理论上 就是说      应该穿进来 未修改的手机号码    和修改后的手机号  但是由于*/
			
			ps.setString(1, mem.getMember_phone());
			ps.setString(2,mem.getMember_name());
			ps.setString(3, mem.getMember_password());
			ps.setString(4,mem.getMember_address());
			ps.setFloat(5, mem.getMember_points());
			ps.setInt(6, mem.getMember_rights());
			ps.setString(7, mem.getMember_phone());
			
			
			
			int i = ps.executeUpdate();
			System.out.println("应经执行到这个 update dao");
			System.out.println("应经执行到这个 update dao"+"返回结果"+i);
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
	//加载 将数据库中的member信息加载到 列表集合中去    然后我们可以在servlet中调用这个方法 
		//得到返回的列表对象 并且将其加载到 session中   在页面山输出
	public List<Member> getAll(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			ps = conn.prepareStatement("select member_phone ,member_name ,member_password,member_address ,member_points,member_rights from Member");
			rs = ps.executeQuery();
			while(rs.next()){
				Member mem = new Member();
				mem.setMember_phone(rs.getString("member_phone"));
				mem.setMember_name(rs.getString("member_name"));
				mem.setMember_password(rs.getString("member_password"));
				mem.setMember_address(rs.getString("member_address"));
				mem.setMember_points(rs.getFloat("member_points"));
				mem.setMember_rights(rs.getInt("member_rights"));
				list.add(mem);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return list;
	}
	//通过 手机号 得到一个会员的详细的信息 当然我们是直接从数据库中查询出来的信息
	//返回的是一个 员工的信息 对象 
	public Member get(String member_phone){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Member mem = null;
		try {
			ps = conn.prepareStatement("select member_phone ,member_name ,member_password,member_address ,member_points,member_rights from Member where member_phone=?");
			ps.setString(1, member_phone);
			rs = ps.executeQuery();
			while(rs.next()){
				mem = new Member();
				System.out.println("DAO查单一用户信息"+rs.getString("member_name"));
				mem.setMember_phone(rs.getString("member_phone"));
				mem.setMember_name(rs.getString("member_name"));
				mem.setMember_password(rs.getString("member_password"));
				mem.setMember_address(rs.getString("member_address"));
				mem.setMember_points(rs.getFloat("member_points"));
				mem.setMember_rights(rs.getInt("member_rights"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
	//	System.out.println(mem.getMember_name());
		return mem;
	}
	

	/*用户名 手机号 模糊查询*/
	public List<Member> getAllLike(String find_value, String search_input){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		
		 String sql="select member_phone ,member_name ," +
		 				   "member_password,member_address ," +
		 				   "member_points,member_rights " +
		 				   "from Member where "+find_value+" LIKE"+"\'"+"%"+search_input+"%"+"\'";
			
		 System.out.println("拼接好的字符串："+sql);
				try {	
					
					ps = conn.prepareStatement(sql);
					
					rs = ps.executeQuery();
					while(rs.next()){
						
						Member mem = new Member();
						mem.setMember_phone(rs.getString("member_phone"));
						mem.setMember_name(rs.getString("member_name"));
						mem.setMember_password(rs.getString("member_password"));
						mem.setMember_address(rs.getString("member_address"));
						mem.setMember_points(rs.getFloat("member_points"));
						mem.setMember_rights(rs.getInt("member_rights"));
						list.add(mem);
						}
						for(Member m:list){
							System.out.println("我就是想看看 模糊查询的对不对"+m.getMember_phone());
						}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
		
		DBConnection.close(rs,ps,conn);
		return list;
	}
	
	
	
	
}





