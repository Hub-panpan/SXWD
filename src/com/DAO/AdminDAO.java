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
import com.model.Member;


public class AdminDAO {
   public boolean save(Admin adm) {
	Connection conn=DBConnection.getConnection();//声明一个连接对象
	PreparedStatement ps=null;
	
	try {
		ps=conn.prepareStatement("insert into Admin(admin_name,admin_password,admin_rights) values(?,?,?)");
		
		ps.setString(1,adm.getAdmin_name());
		ps.setString(2, adm.getAdmin_password());
		ps.setString(3, adm.getAdmin_rights());
		
		System.out.println(adm.getAdmin_name());
		
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
   
   
   public boolean delete(String adname) {
	   Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("delete from Admin where admin_name=?");
			
			ps.setString(1, adname);//将传进来的名字 
			
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
   
   
   public boolean update(Admin adm) {
	Connection conn=DBConnection.getConnection();
	PreparedStatement ps=null;
	
	try {
		ps=conn.prepareStatement("update Admin set admin_name=?,admin_password=?,admin_rights=? where admin_name=?");
		ps.setString(1, adm.getAdmin_name());
		ps.setString(2, adm.getAdmin_password());
		ps.setString(3, adm.getAdmin_rights());
		
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
	   
   
   
   
   public Admin get(String adname) {
		Connection conn=DBConnection.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		Admin adm=null;
		
		try {
			ps=conn.prepareStatement("select  admin_name,admin_password,admin_rights from  Admin where admin_name=?");
			ps.setString(1, adname);
			
			rs = ps.executeQuery();
			while(rs.next()){
				adm = new Admin();
				System.out.println("DAO查单一用户信息"+rs.getString("admin_name"));
				adm.setAdmin_name(rs.getString("admin_name"));
				adm.setAdmin_password(rs.getString("admin_password"));
				adm.setAdmin_rights(rs.getString("admin_rights"));			
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs,ps,conn);
		return adm;
	}
   
   
}