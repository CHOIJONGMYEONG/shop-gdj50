package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




public class StatisticsDao {

	public List<Map<String, Object>> selectCountByHiredate(Connection conn, int year) throws SQLException {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "SELECT month(create_date) m , COUNT(*) cnt \r\n"
				+ "FROM employee\r\n"
				+ "WHERE YEAR(create_date) = ?\r\n"
				+ "GROUP BY MONTH(create_date)\r\n"
				+ "ORDER BY MONTH (create_date) ASC";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		System.out.print("year"+year);
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, year);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Map<String,Object> m = new HashMap<String, Object>();
				m.put("m",rs.getInt("m") );
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
			
			
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt !=null) {
				stmt.close();
			}
		}
		
		return list;
	}
	
	
	public List<Map<String, Object>> selectCountByCustomer(Connection conn, int year) throws SQLException {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "SELECT month(create_date) m , COUNT(*) cnt \r\n"
				+ "FROM customer\r\n"
				+ "WHERE YEAR(create_date) = ?\r\n"
				+ "GROUP BY MONTH(create_date)\r\n"
				+ "ORDER BY MONTH (create_date) ASC";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, year);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Map<String,Object> m = new HashMap<String, Object>();
				m.put("m",rs.getInt("m") );
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
			
			
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt !=null) {
				stmt.close();
			}
		}
		
		return list;
	}
	
	
	public List<Map<String, Object>> selectCountByOutId(Connection conn, int year) throws SQLException {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "SELECT month(out_date) m , COUNT(*) cnt \r\n"
				+ "FROM outid\r\n"
				+ "WHERE YEAR(out_date) = ?\r\n"
				+ "GROUP BY MONTH(out_date)\r\n"
				+ "ORDER BY MONTH (out_date) ASC";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, year);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Map<String,Object> m = new HashMap<String, Object>();
				m.put("m",rs.getInt("m") );
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
			
			
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt !=null) {
				stmt.close();
			}
		}
		
		return list;
	}
	
	
	public List<Map<String, Object>> selectCountByOrder(Connection conn, int year) throws SQLException {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "SELECT month(create_date) m , COUNT(*) cnt \r\n"
				+ "FROM orders\r\n"
				+ "WHERE YEAR(create_date) = ?\r\n"
				+ "GROUP BY MONTH(create_date)\r\n"
				+ "ORDER BY MONTH (create_date) ASC";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, year);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Map<String,Object> m = new HashMap<String, Object>();
				m.put("m",rs.getInt("m") );
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
			
			
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt !=null) {
				stmt.close();
			}
		}
		
		return list;
	
}
}
