package shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import shop.model.*;
import shop.vo.*;

public class CustomerDao {

	public Customer Customerlogin(Customer customer) throws Exception {
		Customer loginCustomer = null;
		
		String sql = "SELECT customer_id , customer_pass, customer_name, customer_address, customer_telephone , update_date , create_date FROM customer WHERE customer_id=? AND customer_pass = PASSWORD(?)";
		
		Connection conn =null;
		PreparedStatement stmt = null;
		
		DBUtil dbutil= new DBUtil();
		ResultSet rs =null;
		
		try {
			conn =dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,customer.getCustomerId());
			stmt.setString(2, customer.getCustomerPass());
			rs = stmt.executeQuery();
			
			loginCustomer = new Customer();	
			if(rs.next()) {
				
				loginCustomer.setCustomerId(rs.getString("customer_id"));
				loginCustomer.setCustomerPass(rs.getString("customer_pass"));
				loginCustomer.setCustomerName(rs.getString("customer_name"));
				loginCustomer.setCustomerAddress(rs.getString("customer_address"));
				loginCustomer.setCustomerTelephone(rs.getString("customer_telephone"));
				loginCustomer.setCreateDate(rs.getString("update_date"));
				loginCustomer.setUpdateDate(rs.getString("create_date"));
			}
				
			System.out.println(loginCustomer.getCustomerId());
			System.out.println(loginCustomer.getCustomerPass());
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
			if(conn!=null) {conn.close();}
		}
	
		
		
		
		return loginCustomer;

		
		
	}
	
	
}
