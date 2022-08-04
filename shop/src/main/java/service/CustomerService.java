package service;

import java.sql.Connection;
import java.sql.SQLException;

import shop.repository.CustomerDao;
import shop.repository.DBUtil;
import shop.repository.OutIdDao;
import shop.vo.Customer;

public class CustomerService {
	
	public boolean removeCustomer(Customer paramCustomer) {
		Connection conn = null;
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		CustomerDao customerDao= new CustomerDao();
		
		
		if (customerDao.deleteCustomer(conn, paramCustomer)==1) {
			OutIdDao outIdDao = new OutIdDao();
			if(outIdDao.insertOutId(conn, paramCustomer.getCustomerId())!=1) {
				throw new Exception();
			}
		}
		
		
		conn.commit();
		}catch(Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false;
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
		
	}
	
	
	public Customer getCustomer(Customer paramCustomer) {
		Connection conn = null;
		Customer customer = new Customer();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		CustomerDao customerDao= new CustomerDao();
		customer = customerDao.selectCustomerByidAndPw(conn, paramCustomer);
		
	
		conn.commit();
		}catch(Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return customer;
		
	}
	
	public boolean addCustomer(Customer paramCustomer) {
		Connection conn = null;
		
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		CustomerDao customerDao= new CustomerDao();
		customerDao.CustomerInsert(conn, paramCustomer);
		
	
		conn.commit();
		}catch(Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false;
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
		
	}
	
	
	
	
	
	
	
	
}
