package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.repository.*;
import shop.vo.*;

public class CustomerDao {

	public int updatePwCustomer(Connection conn, Customer paramCustomer , String nowPw) throws Exception {

		// 동일한 conn
		// conn.close()X
		int row = 0;
		String sql = "UPDATE customer SET customer_pass = password(?) WHERE customer_pass = password(?) and customer_id = ?";

		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerPass());
			stmt.setString(2, nowPw);
			stmt.setString(3, paramCustomer.getCustomerId());
			
			row = stmt.executeUpdate();

		} finally {
			stmt.close();
		}

		return row;

	}
	
	
	public int adminDeleteCustomer(Connection conn, Customer paramCustomer) throws Exception {
		int row = 0;
		String sql = "DELETE FROM customer WHERE customer_id = ?";

		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			row = stmt.executeUpdate();

		} finally {
			stmt.close();
		}

		return row;

	}

	public Customer adminSelectCustomer(Connection conn, Customer paramCustomer) throws Exception {

		String sql = "SELECT customer_id,customer_pass,customer_name,customer_address , customer_telephone ,create_date,update_date FROM customer WHERE customer_id=?";

		PreparedStatement stmt = null;
		Customer customer = new Customer();
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());

			rs = stmt.executeQuery();

			if (rs.next()) {
				customer = new Customer();
				customer.setCustomerId(rs.getString("customer_id"));
				customer.setCustomerPass(rs.getString("customer_pass"));
				customer.setCustomerName(rs.getString("customer_name"));
				customer.setCustomerAddress(rs.getString("customer_address"));
				customer.setCustomerTelephone(rs.getString("customer_telephone"));
				customer.setCreateDate(rs.getString("create_date"));
				customer.setUpdateDate(rs.getString("update_date"));

			}
			System.out.println(customer.getCustomerId());

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		return customer;
	}

	public int adminUpdateCustomer(Connection conn, Customer paramCustomer) throws Exception {

		// 동일한 conn
		// conn.close()X
		int row = 0;
		String sql = "UPDATE customer SET customer_address = ?,customer_pass=password(?) ,customer_telephone = ? ,customer_name =?,update_date=now() WHERE customer_id = ?";

		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerAddress());
			stmt.setString(2, paramCustomer.getCustomerPass());
			stmt.setString(3, paramCustomer.getCustomerTelephone());
			stmt.setString(4, paramCustomer.getCustomerName());
			stmt.setString(5, paramCustomer.getCustomerId());
			row = stmt.executeUpdate();

		} finally {
			stmt.close();
		}

		return row;

	}

	public int selectCustomerAllCount(Connection conn) throws Exception {
		String sql = "SELECT count(*) count from customer";
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

		return totalRow;

	}

	public List<Customer> selectCustomerListByPage(Connection conn, final int rowPerPage, int beginRow)
			throws Exception {

		String sql = "SELECT customer_id,customer_pass,customer_name,customer_address , customer_telephone ,create_date,update_date FROM customer ORDER BY create_date DESC LIMIT ?, ?";
		List<Customer> list = new ArrayList<Customer>();

		PreparedStatement stmt = null;
		Customer customer = new Customer();
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();

			while (rs.next()) {
				customer = new Customer();
				customer.setCustomerId(rs.getString("customer_id"));
				customer.setCustomerPass(rs.getString("customer_pass"));
				customer.setCustomerName(rs.getString("customer_name"));
				customer.setCustomerAddress(rs.getString("customer_address"));
				customer.setCustomerTelephone(rs.getString("customer_telephone"));
				customer.setCreateDate(rs.getString("create_date"));
				customer.setUpdateDate(rs.getString("update_date"));

				list.add(customer);
			}
			System.out.println(customer.getCustomerId());

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

	public int updateCustomer(Connection conn, Customer paramCustomer) throws Exception {

		// 동일한 conn
		// conn.close()X
		int row = 0;
		String sql = "UPDATE customer SET customer_address = ? ,customer_telephone = ? ,customer_name =?,update_date=now() WHERE customer_id = ?";

		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerAddress());
			stmt.setString(2, paramCustomer.getCustomerTelephone());
			stmt.setString(3, paramCustomer.getCustomerName());
			stmt.setString(4, paramCustomer.getCustomerId());
			row = stmt.executeUpdate();

		} finally {
			stmt.close();
		}

		return row;

	}

	// 탈퇴
	// CustomerService.removeCustomer(Customer paramCustomer)가 호출
	public int deleteCustomer(Connection conn, Customer paramCustomer) throws Exception {

		// 동일한 conn
		// conn.close()X
		int row = 0;
		String sql = "DELETE FROM customer WHERE customer_id = ? AND customer_pass = password(?)";

		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			stmt.setString(2, paramCustomer.getCustomerPass());
			row = stmt.executeUpdate();

		} finally {
			stmt.close();
		}

		return row;

	}

	// CustomerService가 호출
	public Customer selectCustomerByidAndPw(Connection conn, Customer paramCustomer) throws Exception {
		Customer loginCustomer = null;

		String sql = "SELECT customer_id , customer_pass, customer_name, customer_address, customer_telephone , update_date , create_date FROM customer WHERE customer_id=? AND customer_pass=password(?)";

		PreparedStatement stmt = null;

		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			stmt.setString(2, paramCustomer.getCustomerPass());
			rs = stmt.executeQuery();

			loginCustomer = new Customer();
			if (rs.next()) {

				loginCustomer.setCustomerId(rs.getString("customer_id"));
				loginCustomer.setCustomerPass(rs.getString("customer_pass"));
				loginCustomer.setCustomerName(rs.getString("customer_name"));
				loginCustomer.setCustomerAddress(rs.getString("customer_address"));
				loginCustomer.setCustomerTelephone(rs.getString("customer_telephone"));
				loginCustomer.setCreateDate(rs.getString("create_date"));
				loginCustomer.setUpdateDate(rs.getString("update_date"));
			}

			System.out.println(loginCustomer.getCustomerId());
			System.out.println(loginCustomer.getCustomerPass());

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		return loginCustomer;

	}
	
	
	public Customer selectCustomerInfo(Connection conn, Customer paramCustomer) throws Exception {
		Customer loginCustomer = null;

		String sql = "SELECT customer_id , customer_pass, customer_name, customer_address, customer_telephone , update_date , create_date FROM customer WHERE customer_id=?";

		PreparedStatement stmt = null;

		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramCustomer.getCustomerId());
			rs = stmt.executeQuery();

			loginCustomer = new Customer();
			if (rs.next()) {

				loginCustomer.setCustomerId(rs.getString("customer_id"));
				loginCustomer.setCustomerPass(rs.getString("customer_pass"));
				loginCustomer.setCustomerName(rs.getString("customer_name"));
				loginCustomer.setCustomerAddress(rs.getString("customer_address"));
				loginCustomer.setCustomerTelephone(rs.getString("customer_telephone"));
				loginCustomer.setCreateDate(rs.getString("create_date"));
				loginCustomer.setUpdateDate(rs.getString("update_date"));
			}

			System.out.println(loginCustomer.getCustomerId());
			System.out.println(loginCustomer.getCustomerPass());

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		return loginCustomer;

	}
	

	public int CustomerInsert(Connection conn, Customer customer) throws Exception {
		int a = 0;

		String sql = "insert into customer (customer_id,customer_pass,customer_name,customer_address,customer_telephone,update_date,create_date) values(?,password(?),?,?,?,now(),now())";

		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, customer.getCustomerId());
			stmt.setString(2, customer.getCustomerPass());
			stmt.setString(3, customer.getCustomerName());
			stmt.setString(4, customer.getCustomerAddress());
			stmt.setString(5, customer.getCustomerTelephone());

			a = stmt.executeUpdate();

		} finally {
			if (stmt != null) {
				stmt.close();
			}

		}

		return a;

	}

	public String selectIdCheck(Connection conn, String idck) throws SQLException {
		String id = null;

		/*
		 * SELECT t.id FROM (SELECT customer_id id FROM customer UNION SELECT
		 * employee_id id FROM employee UNION SELECT out_id id FROM outid) t WHERE t.id
		 * = ?
		 */
		String sql = "SELECT t.id FROM (SELECT customer_id id FROM customer UNION SELECT employee_id id FROM employee UNION SELECT out_id id FROM outid) t WHERE t.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, idck);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			id = rs.getString("t.id");
		}

		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		return id; // 사용가능한 아이디면 null 반환
	}

}
