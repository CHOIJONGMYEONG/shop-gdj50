package shop.repository;

import java.sql.*;

public class SignDao {

	
		public String idCheck(Connection conn ,String id) throws Exception {
			String ckId = null;
			ResultSet rs= null;
			PreparedStatement stmt = null;
			String sql = "SELECT t.id\r\n"
					+ "from (SELECT customer_id id FROM customer\r\n"
					+ "UNION\r\n"
					+ "SELECT employee_id id FROM employee\r\n"
					+ "UNION\r\n"
					+ "SELECT out_id id FROM outid) t\r\n"
					+ "WHERE t.id = ?";
		
			
			System.out.println(id);
			
			
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,id);
				rs = stmt.executeQuery();
				if(rs==null) {
						rs.close();
						stmt.close();
							
				}
				else if(rs.next()) {
					ckId= rs.getString("id");
					rs.close();
					stmt.close();
				}
			System.out.println(ckId);
			
			
			
			
			/* --> null일때 사용가능한 아이디
			 
			  
			// if(rs != null) {
			// close....

			 */
			
			
			
			
			
			
			return ckId;
		}
}
