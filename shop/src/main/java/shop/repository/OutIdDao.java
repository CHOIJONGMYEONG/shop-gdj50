package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;


import shop.vo.OutId;

public class OutIdDao {
	// 탈퇴 회원의 아디를 입력
	// CustomerService.removeCustomer(Customer paramCustomer)가 호출
	public int insertOutId(Connection conn ,String OutId) throws Exception {
		
		int row = 0;
		String sql = "INSERT INTO outid (out_id,out_date) values(?,now())";
		
		 PreparedStatement stmt=null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, OutId);
			row =stmt.executeUpdate();
		 
		
		}finally {
			stmt.close();
		}
	
		return row;
		
		
	}
}
