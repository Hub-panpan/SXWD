package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.DB.DBConnection;
import com.model.Code;
import com.model.ShoppingOrder;
import com.model.Vote;

public class ShoppingOrderDAO {
	/* 保存 产生一个订单 */
	public boolean save(ShoppingOrder sco) {
		Connection conn = DBConnection.getConnection();// 声明一个连接对象
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("INSERT INTO `SXWD`.`ShoppingOrder` (`order_id`, `food_id`, `food_name`,`food_price`,`order_number`,`sum_price`,`member_phone`,`order_date`,`order_state`,`order_code`) VALUES(?,?,?,?,?,?,?,?,?,?)");

			if (sco == null) {
				System.out.println("当前传入的订单对象为空！！！！");
				return false;
			}
			System.out.println("将要执行增加订单记录一条 ：" + sco.getFood_id());

			ps.setInt(1, sco.getOrder_id());
			ps.setString(2, sco.getFood_id());
			ps.setString(3, sco.getFood_name());
			ps.setFloat(4, sco.getFood_price());
			ps.setInt(5, sco.getOrder_number());
			ps.setFloat(6, sco.getSum_price());
			ps.setString(7, sco.getMember_phone());
			ps.setString(8, sco.getOrder_date());
			ps.setInt(9, sco.getOrder_state());
			ps.setString(10, sco.getOrder_code());

			System.out
					.println("当前正在执行 插入一条  选项信息：" + sco.getOrder_id() + "选项！");

			int i = ps.executeUpdate();
			if (i == 1) {
				DBConnection.close(ps, conn);
				return true;
			} else {
				DBConnection.close(ps, conn);
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(ps, conn);
		return false;
	}

	/* 删除一个 订单信息 */

	public boolean delete(String order_id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn
					.prepareStatement("delete from ShoppingCart_order where `order_code`=? ");

			ps.setString(1, order_id);// 将传进来的名字

			int i = ps.executeUpdate();
			if (i == 1) {
				DBConnection.close(ps, conn);
				return true;
			} else {
				DBConnection.close(ps, conn);
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(ps, conn);
		return false;
	}

	/* 更改订单信息 目前我们只修改 一个 订单编号的状态 */
	public boolean update(String order_id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;

		try {
			ps = conn
					.prepareStatement("update ShoppingOrder set `order_state`=1  where `order_code`=? ");

			ps.setString(1, order_id);

			int i = ps.executeUpdate();
			if (i > 0) {
				DBConnection.close(ps, conn);
				return true;
			} else {
				DBConnection.close(ps, conn);
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(ps, conn);
		return false;
	}

	/* 通过 会员ID 来寻找其订单信息 */
	public List<ShoppingOrder> get(String mem_code, int state) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		ShoppingOrder sco = null;// 得先初始化为空
		List<ShoppingOrder> scolist = new ArrayList<ShoppingOrder>();
		String sql;

		System.out.println("ShoppingOederDAO当前查询mem_id:" + mem_code	+ "   state:" + state);

		try {/* 如果传入的是 11位 我们就查 用户 否则我们查订单 */
			if (mem_code.length() != 11) {
				sql = "select `order_id`, `food_id`, `food_name`,`food_price`,`order_number`,`sum_price`,`member_phone`,`order_date`,`order_state`,`order_code` from ShoppingOrder where `order_code`=?";
				ps = conn.prepareStatement(sql);
				//ps.setInt(1, state);
				ps.setString(1,mem_code);

			} else {
				sql = "select `order_id`, `food_id`, `food_name`,`food_price`,`order_number`,`sum_price`,`member_phone`,`order_date`,`order_state`,`order_code` from ShoppingOrder where `member_phone`=? and `order_state`=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, mem_code);
				ps.setInt(2, state);
			}

			rs = ps.executeQuery();
			while (rs.next()) {
				sco = new ShoppingOrder();
				System.out.println("ShoppingOrDAO get方法 执行中：查到当前会员ID:"
						+ rs.getString("member_phone") + "选项值："
						+ rs.getString("food_id"));

				sco.setOrder_id(rs.getInt("order_id"));
				sco.setFood_id(rs.getString("food_id"));
				sco.setFood_name(rs.getString("food_name"));
				sco.setFood_price(rs.getFloat("food_price"));
				sco.setOrder_number(rs.getInt("order_number"));
				sco.setSum_price(rs.getFloat("sum_price"));
				sco.setMember_phone(rs.getString("member_phone"));
				sco.setOrder_date(rs.getString("order_date"));
				sco.setOrder_state(rs.getInt("order_state"));
				sco.setOrder_code(rs.getString("order_code"));
				System.out
						.println("ShoppingCart_orderDAOget()方法执行中 获得到cart_id："
								+ sco.getOrder_id());
				scolist.add(sco);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs, ps, conn);
		return scolist;
	}

	public List<Code> getCode() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Code co = null;// 得先初始化为空
		List<Code> colist = new ArrayList<Code>();
		String sql;

		System.out.println("ShoppingOederDAO当前查询订单列表中");

		try {

			sql = "SELECT DISTINCT member_phone ,order_code ,order_state from ShoppingOrder;";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			int n = 1;
			while (rs.next()) {
				co = new Code();
				System.out.println("ShoppingOrderDAO getCode方法 执行中：查到当前订单ID:"
						+ rs.getString("order_code"));
				co.setCode_id(n);
				co.setMember_phone(rs.getString("member_phone"));
				co.setOrder_code(rs.getString("order_code"));
				co.setOrder_state(rs.getInt("order_state"));

				colist.add(co);
				n++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConnection.close(rs, ps, conn);
		return colist;
	}

	public Boolean passCode(String or_code) {

		return null;

	}

}
