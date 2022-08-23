package shop.repository;

import java.sql.*;

import shop.vo.Customer;

public class CounterDao {
   public String selectCounterToday(Connection conn) throws SQLException {
      String result = null;
      ResultSet rs = null;
      PreparedStatement stmt = null;
      String sql = "SELECT counter_date FROM counter WHERE counter_date = CURDATE()";
      
      try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				result= rs.getString("counter_date");
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}
      
      return result;   
      
   }
   
   public void insertCounter(Connection conn) throws SQLException {
	   PreparedStatement stmt = null;
      String sql = "INSERT INTO counter(counter_date,counter_num) VALUES(CURDATE(),1)";
      try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();


		} finally {
			if (stmt != null) {
				stmt.close();
			}

		}
   }
   
   public void updateCounter(Connection conn) throws SQLException {
	  PreparedStatement stmt = null;
      String sql = "UPDATE counter SET counter_num = counter_num+1 WHERE counter_date = CURDATE()";
      try {
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();


		} finally {
			if (stmt != null) {
				stmt.close();
			}

		}
   }
   
   
   // IndexController에서 호출
   // 전체접속자 수
   // SELECT SUM(counter_num) FROM counter; 
   
   // 오늘 접속자 수
   // SELECT counter_num FROM counter WHERE counter_date = CURDATE();
   public int selectTotalCount(Connection conn) throws SQLException {
	   PreparedStatement stmt = null;
	   ResultSet rs = null;
		int count =0;
	   String sql = "SELECT SUM(counter_num) FROM counter";
	   try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				count =rs.getInt("SUM(counter_num)");
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}
		return count;
	}
	
	// 오늘 접속자 수
	// SELECT counter_num FROM counter WHERE counter_date = CURDATE();
	public int selectTodayCount(Connection conn) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int count =0;
		String sql = "SELECT counter_num FROM counter WHERE counter_date = CURDATE()";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				count =rs.getInt("counter_num");
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}
		return count;
	}
}