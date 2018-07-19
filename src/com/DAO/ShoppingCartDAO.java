    package com.DAO;
	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;
	import java.util.List;
	import com.DB.DBConnection;
import com.model.ShoppingCart;
import com.model.Vote;

	public class ShoppingCartDAO {

	public boolean save(ShoppingCart sco) {
				Connection conn=DBConnection.getConnection();//声明一个连接对象
				PreparedStatement ps=null;
				try {
					ps=conn.prepareStatement("INSERT INTO `ShoppingCart` (`cart_id`, `food_id`, `food_name`,`food_price`,`order_number`,`member_phone`) VALUES(?,?,?,?,?,?)");
					
					
					if(sco==null){
						System.out.println("当前传入的订单对象为空！！！！");
						return false;
					}
					System.out.println("将要执行增加订单记录一条 ："+sco.getFood_id());
					
				
					ps.setInt(1,sco.getCart_id());
					ps.setString(2,sco.getFood_id());
					ps.setString(3,sco.getFood_name());
					ps.setFloat(4,sco.getFood_price());
					ps.setInt(5,sco.getOrder_number());
					ps.setString(6,sco.getMember_phone());
					
					System.out.println("当前正在执行 插入一条  食物信息："+sco.getFood_name()+"选项！");
					
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
			  		  
	public boolean delete(int ca_id) {   
				   Connection conn = DBConnection.getConnection();
					PreparedStatement ps = null;
					try {
						ps = conn.prepareStatement("delete from ShoppingCart where cart_id=?");
						
						ps.setInt(1, ca_id);//将传进来的名字 
					
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
			  
			  
	public boolean update(ShoppingCart  sco,int ca_id) {   //我的投票     id 能修改
				Connection conn=DBConnection.getConnection();
				PreparedStatement ps=null;
				
				try {
					ps=conn.prepareStatement("update ShoppingCart set `food_id`=?, `food_name`=?,`food_price`=?,`order_number`=?,`member_phone`=?  where cart_id=?");
					
					ps.setString(1,sco.getFood_id());
					ps.setString(2,sco.getFood_name());
					ps.setFloat(3,sco.getFood_price());
					ps.setInt(4,sco.getOrder_number());
					ps.setString(5,sco.getMember_phone());
					
					ps.setInt(8,ca_id);
					
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
				   
			  /*通过  会员ID 来寻找其 和 购物车信息 */
	public List<ShoppingCart> get(String mem_id) {
					Connection conn=DBConnection.getConnection();
					PreparedStatement ps=null;
					ResultSet rs=null;
					ShoppingCart sco = null;//得先初始化为空
					List<ShoppingCart> scolist = new ArrayList<ShoppingCart>();
					String sql;
				
					System.out.println("ShoppingCartDAO当前查询mem_id:"+mem_id);
					
					try {
						if(mem_id.equals("All")){
							

							sql="select `cart_id`, `food_id`, `food_name`,`food_price`,`order_number`,`member_phone` from ShoppingCart";
							ps=conn.prepareStatement(sql);

						}else {
							sql="select `cart_id`, `food_id`, `food_name`,`food_price`,`order_number`,`member_phone` from ShoppingCart where `member_phone`=?";
							ps=conn.prepareStatement(sql);
							ps.setString(1, mem_id);
							}					
						rs = ps.executeQuery();
						while(rs.next()){
							sco = new ShoppingCart();
							System.out.println("ShoppingCartDAO get方法 执行中：查到当前会员ID:"+rs.getString("member_phone"));
							
							sco.setCart_id(rs.getInt("cart_id"));
							sco.setFood_id(rs.getString("food_id"));
							sco.setFood_name(rs.getString("food_name"));
							sco.setFood_price(rs.getFloat("food_price"));
							sco.setOrder_number(rs.getInt("order_number"));
							sco.setMember_phone(rs.getString("member_phone"));
							System.out.println("ShoppingCartDAOget()方法执行中 获得到cart_id："+sco.getCart_id());
							scolist.add(sco);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					DBConnection.close(rs,ps,conn);
					return scolist;
				}
			
	
	public boolean jiajian(int number,int ca_id) {   //我的投票     id 能修改
		Connection conn=DBConnection.getConnection();
		PreparedStatement ps=null;

		try {
			ps=conn.prepareStatement("update ShoppingCart set `order_number`=?  where cart_id=?");


			ps.setInt(1,number);
			ps.setInt(2,ca_id);


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
				
	}
