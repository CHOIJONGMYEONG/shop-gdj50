package shop.repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import shop.vo.Employee;
import shop.vo.Orders;

public class OrdersDao {

	
	
	
	public int ordersInsert(Connection conn,Orders orders) throws Exception {
		int a =0;
		
		String sql = "INSERT INTO orders (goods_no,customer_id,order_quantity,order_price,order_addr,order_state,update_date,create_date) VALUES(?,?,?,?,?,?,now(),now())";
		
		
		PreparedStatement stmt = null;
		
		System.out.print(orders.getOrderState());
		System.out.print(orders.getOrderNo());
	
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,orders.getGoodsNo());
			stmt.setString(2, orders.getCustomerId());
			stmt.setInt(3,orders.getOrderQuantity());
			stmt.setInt(4,orders.getOrderPrice());
			stmt.setString(5, orders.getOrderAddr());
			stmt.setString(6, orders.getOrderState());
			
			
			
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	// 5-2) 주문상세보기
	public Map<String, Object> selectOrdersOne(Connection conn, int ordersNo) throws Exception {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Map<String, Object> m = null;
		
		String sql = "SELECT \r\n"
				+ "o.order_no\r\n"
				+ ",o.order_price\r\n"
				+ ",o.order_addr\r\n"
				+ ",o.order_quantity\r\n"
				+ ",o.order_state\r\n"
				+ ",o.update_date\r\n"
				+ ",o.create_date\r\n"
				+ ",g.goods_no\r\n"
				+ ",g.goods_name\r\n"
				+ ",g.goods_price\r\n"
				+ ",g.update_date\r\n"
				+ ",g.create_date\r\n"
				+ ",g.sold_out\r\n"
				+ ",c.customer_id\r\n"
				+ ",c.customer_pass\r\n"
				+ ",c.customer_name\r\n"
				+ ",c.customer_address\r\n"
				+ ",c.customer_telephone\r\n"
				+ ",c.update_date\r\n"
				+ ",c.create_date \r\n"
				+ "FROM orders o INNER JOIN goods g\r\n"
				+ "ON o.goods_no = g.goods_no\r\n"
				+ "RIGHT JOIN customer c ON o.customer_id = c.customer_id\r\n"
				+ "WHERE o.order_no =?";

		
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ordersNo);
			
			rs = stmt.executeQuery();
			
			
//			if (rs.next()) {
//				System.out.println("체크 " + rs.getInt("g.goods_no"));
//				System.out.println("체크 " + rs.getString("g.goods_name"));
//			}

			if (rs.next()) {
				m = new HashMap<>();
				m.put("goodsNo", rs.getInt("g.goods_no"));
				m.put("goodsName", rs.getString("g.goods_name"));
				m.put("goodsPrice", rs.getInt("g.goods_price"));
				m.put("GupdateDate", rs.getString("g.update_date"));
				m.put("GcreateDate", rs.getString("g.create_date"));
				m.put("soldOut", rs.getString("g.sold_out"));
				System.out.print("중간점검" + m.get("goodsNo"));
				
				m.put("orderNo", rs.getInt("o.order_no"));
				m.put("orderPrice", rs.getInt("o.order_price"));
				m.put("orderAddr", rs.getString("o.order_addr"));
				m.put("orderQuantity", rs.getInt("o.order_quantity"));
				m.put("orderState", rs.getString("o.order_state"));
				m.put("OupdateDate", rs.getString("o.update_date"));
				m.put("OcreateDate", rs.getString("o.create_date"));
				
				m.put("customerId", rs.getString("c.customer_id"));
				m.put("customerPass", rs.getString("c.customer_pass"));
				m.put("customerName", rs.getString("c.customer_name"));
				m.put("customerAddress", rs.getString("c.customer_address"));
				m.put("customerTelephone", rs.getString("c.customer_telephone"));
				m.put("CupdateDate", rs.getString("c.update_date"));
				m.put("CcreateDate", rs.getString("c.create_date"));
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		
		
		
		return m;

	}

	// 5-1) 전체 주문 목록(관리자)
	public List<Map<String, Object>> selectOrderList(Connection conn, int rowPerPage, int beginRow) throws Exception {

		Map<String, Object> m = null;
		List<Map<String, Object>> list = new ArrayList<>(); // 다형성
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "\r\n"
				+ "\r\n"
				+ "SELECT \r\n"
				+ "				 o.order_no, o.customer_id, o.order_price, o.order_addr, o.order_quantity,o.order_state,o.update_date,o.create_date \r\n"
				+ "				 ,g.goods_no, g.goods_name, g.goods_price, g.update_date, g.create_date, g.sold_out\r\n"
				+ "				 FROM orders o LEFT JOIN goods g\r\n"
				+ "				ON o.goods_no = g.goods_no \r\n"
				+ "				 ORDER BY o.create_date DESC  \r\n"
				+ "				 LIMIT ? , ? ";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			
			
//			if (rs.next()) {
//				System.out.println("체크 " + rs.getInt("g.goods_no"));
//				System.out.println("체크 " + rs.getString("g.goods_name"));
//			}

			while (rs.next()) {
				m = new HashMap<>();
				m.put("goodsNo", rs.getInt("g.goods_no"));
				m.put("goodsName", rs.getString("g.goods_name"));
				m.put("goodsPrice", rs.getInt("g.goods_price"));
				m.put("GupdateDate", rs.getString("g.update_date"));
				m.put("GcreateDate", rs.getString("g.create_date"));
				m.put("soldOut", rs.getString("g.sold_out"));
				System.out.print("중간점검" + m.get("goodsNo"));
				m.put("orderNo", rs.getInt("o.order_no"));
				m.put("customerId", rs.getString("o.customer_id"));
				m.put("orderPrice", rs.getInt("o.order_price"));
				m.put("orderAddr", rs.getString("o.order_addr"));
				m.put("orderQuantity", rs.getInt("o.order_quantity"));
				m.put("orderState", rs.getString("o.order_state"));
				m.put("OupdateDate", rs.getString("o.update_date"));
				m.put("OcreateDate", rs.getString("o.create_date"));
				list.add(m);

			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		return list;

	}

	public int selectOrdersAllCount(Connection conn) throws Exception {
		String sql = "SELECT count(*) count from orders";
		int totalRow = 0;

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				totalRow = rs.getInt("count");

			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		System.out.print(totalRow);
		return totalRow;

	}

	// 고객 한명의 주문 목록(관리자 , 고객)
	public List<Map<String, Object>> selectOrdersListByCustomer(Connection conn, String customerId, int rowPerPage, int beginRow) throws SQLException {
		List<Map<String, Object>> list = null; 
		Map<String, Object> map = null;

		String sql = "SELECT o.order_no ordersNo, o.order_quantity ordersQuantity"
				+ ", o.order_price ordersPrice, o.order_addr ordersAddr, o.order_state ordersState"
				+ ", o.update_date updateDate, o.create_date createDate"
				+ ", g.goods_no goodsNo, g.goods_name goodsName, g.goods_price goodsPrice"
				+ ", c.customer_id customerId, c.customer_name customerName"
				+ " FROM orders o INNER JOIN goods g ON o.goods_no = g.goods_no"
				+ " INNER JOIN customer c ON o.customer_id = c.customer_id"
				+ " WHERE c.customer_id = ?"
				+ " ORDER BY o.create_date DESC LIMIT ?, ?";

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			list = new ArrayList<>();

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, customerId);
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);

			rs = stmt.executeQuery();

			while(rs.next()) {
				map = new HashMap<String, Object>();
				map.put("ordersNo", rs.getInt("ordersNo"));
				map.put("ordersQuantity", rs.getInt("ordersQuantity"));
				map.put("ordersPrice", rs.getInt("ordersPrice"));
				map.put("ordersAddr", rs.getString("ordersAddr"));
				map.put("ordersState", rs.getString("ordersState"));
				map.put("updateDate", rs.getString("updateDate"));
				map.put("createDate", rs.getString("createDate"));
				map.put("goodsNo", rs.getInt("goodsNo"));
				map.put("goodsName", rs.getString("goodsName"));
				map.put("goodsPrice", rs.getInt("goodsPrice"));
				map.put("customerId", rs.getString("customerId"));
				map.put("customerName", rs.getString("customerName"));

				list.add(map);
			}
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
		}
		return list;
	}

	
	public int adminStateUpdate(Connection conn,Orders orders) throws Exception {
		int a =0;
		
		String sql = "update orders set order_state = ? WHERE order_no = ?";
		
		
		PreparedStatement stmt = null;
		
		System.out.print(orders.getOrderState());
		System.out.print(orders.getOrderNo());
	
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orders.getOrderState());
			stmt.setInt(2,orders.getOrderNo());
			
			
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	
	
	
}
