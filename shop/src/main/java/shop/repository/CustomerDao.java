package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import shop.repository.*;
import shop.vo.*;

public class CustomerDao {
	
	// 탈퇴
	// CustomerService.removeCustomer(Customer paramCustomer)가 호출
	public int deleteCustomer(Connection conn, Customer paramCustomer) throws Exception {
		
		// 동일한 conn
		// conn.close()X
		int row = 0;
		String sql = "DELETE FROM customer WHERE customer_id= ?";
		
		 PreparedStatement stmt=null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			row =stmt.executeUpdate();
		 
		
		}finally {
			stmt.close();
		}
	
		return row;
		
		
		
		
	}
	
	
	// CustomerService가 호출
	public Customer selectCustomerByidAndPw(Connection conn, Customer paramCustomer) throws Exception {
		Customer loginCustomer = null;
		
		String sql = "SELECT customer_id , customer_pass, customer_name, customer_address, customer_telephone , update_date , create_date FROM customer WHERE customer_id=? AND customer_pass = PASSWORD(?)";
		
		
		PreparedStatement stmt = null;
		
		
		ResultSet rs =null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,paramCustomer.getCustomerId());
			stmt.setString(2, paramCustomer.getCustomerPass());
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
			
		}
	
		
		
		
		return loginCustomer;

		
		
	}
	
	public int CustomeInsert(Customer customer) throws Exception {
		int a =0;
		
		String sql = "insert into customer (customer_id,customer_pass,customer_name,customer_address,customer_telephone,update_date,create_date) values(?,password(?),?,?,?,now(),now())";
		
		Connection conn =null;
		PreparedStatement stmt = null;
		
		DBUtil dbutil= new DBUtil();
		
		try {
			conn =dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,customer.getCustomerId());
			stmt.setString(2, customer.getCustomerPass());
			stmt.setString(3, customer.getCustomerName());
			stmt.setString(4, customer.getCustomerAddress());
			stmt.setString(5, customer.getCustomerTelephone());
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			if(conn!=null) {conn.close();}
		}
	
		return a;
		
	}
	
}
