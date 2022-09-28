package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import shop.vo.Cart;


public class CartDao {
	public int insertCart(Connection conn, Cart cart) throws SQLException {
		System.out.println("-------------- CartDao.insertCart()");
		int row = 0;
		
		PreparedStatement stmt = null;
		String sql = "insert into cart(goods_no, customer_id, cart_quantity, update_date, create_date)"
				+ " values(?, ?, ?, now(), now())";
		
		try {
			stmt = conn.prepareStatement(sql);
			System.out.println(stmt);
			
			stmt.setInt(1, cart.getGoodsNo());
			stmt.setString(2, cart.getCustomerId());
			stmt.setInt(3, cart.getCartQuantity());
			
			row = stmt.executeUpdate();
		} finally {
			
			if(stmt != null) {
				stmt.close();
			}
		}
		
		return row;		
	}
	
	public List<Map<String, Object>> selectCartList(Connection conn, String id) throws Exception{
		System.out.println("-------------- CartDao.selectCartList()");
		
		List<Map<String, Object>> cartList = new ArrayList<>();
		ResultSet rs =  null;
		PreparedStatement stmt = null;
		
		String sql = "select c.goods_no goodsNo, g.goods_name goodsName, g.goods_price goodsPrice, c.cart_quantity cartQuantity,gi.filename filename"
				+ " from cart c inner join goods g on c.goods_no = g.goods_no"
				+ " inner join goods_img gi"
				+ " on g.goods_no = gi.goods_no"
				+ " where customer_id = ?"
				+ " order by c.create_date desc;";
		
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			
			System.out.println(stmt);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				
				m.put("goodsNo", rs.getInt("goodsNo"));
				m.put("goodsName", rs.getString("goodsName"));
				m.put("cartQuantity", rs.getInt("cartQuantity"));
				m.put("goodsPrice", rs.getInt("goodsPrice"));
				m.put("filename", rs.getString("filename"));

				cartList.add(m);
			}
		
		} finally {
			
			if(rs != null) { rs.close(); }
			if(stmt != null) { stmt.close(); }
		
		}
		
		return cartList;
	}
	
	public int updateCart(Connection conn, Cart cart) throws SQLException{
		System.out.println("-------------- CartDao.updateCart()");
		int row = 0;
		
		PreparedStatement stmt = null;
		String sql = "update cart set cart_quantity = ?, update_date = now() where goods_no = ? and customer_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			System.out.println(stmt);
			
			stmt.setInt(1, cart.getCartQuantity());
			stmt.setInt(2, cart.getGoodsNo());
			stmt.setString(3, cart.getCustomerId());
			
			row = stmt.executeUpdate();
			
		} finally {
			
			if(stmt != null) {
				stmt.close();
			}
		}
		
		return row;		
	}
	
	public int deleteCart(Connection conn, Cart cart) throws SQLException{
		int row = 0;
		
		PreparedStatement stmt = null;
		String sql = "delete from cart where customer_id = ? and goods_no = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, cart.getCustomerId());
			stmt.setInt(2, cart.getGoodsNo());
			
			row = stmt.executeUpdate();
		} finally {
			
			if(stmt != null) { stmt.close(); }
		
		}
		
		return row;
	}
	
	public int deleteCart(Connection conn, Map<String, Object> map) throws SQLException{
		int row = 0;
		
		PreparedStatement stmt = null;
		String sql = "delete from cart where customer_id = ? and goods_no = ?";
		
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, (String)map.get("customerId"));
			stmt.setInt(2, (int)map.get("goodsNo"));
			
			row = stmt.executeUpdate();
		
		} finally {
			
			if(stmt != null) { stmt.close(); }
		
		}
		
		return row;
	}
	
	public int deleteAllCart(Connection conn, Cart cart) throws SQLException{
		int row = 0;
		
		PreparedStatement stmt = null;
		String sql = "delete from cart where customer_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, cart.getCustomerId());
			
			row = stmt.executeUpdate();
		} finally {
			
			if(stmt != null) { stmt.close(); }
		
		}
		
		return row;
	}
	
}
