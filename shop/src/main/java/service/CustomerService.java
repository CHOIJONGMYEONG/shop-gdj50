package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import shop.repository.CustomerDao;
import shop.repository.DBUtil;
import shop.repository.OutIdDao;
import shop.vo.Customer;

public class CustomerService {
	 private CustomerDao customerDao;
	 
	 
	
	 
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
	
	
	
	
	 public String getIdCheck(String idck) {
	      
	      Connection conn = null;
	      String id = null;
	      
	      try {
	         Class.forName("org.mariadb.jdbc.Driver");
	         conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shop","root","1234");
	         this.customerDao = new CustomerDao();
	         id = customerDao.selectIdCheck(conn, idck);
	      } catch(Exception e) {
	         e.printStackTrace();
	         if(conn != null) {
	            try {
	               conn.rollback();
	            } catch (SQLException e1) {
	               // TODO Auto-generated catch block
	               e1.printStackTrace();
	            }
	         }
	      } finally {
	         if(conn != null) {
	            try {
	               conn.close();
	            } catch (SQLException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            }
	         }
	      }
	      
	      return id;
	   }
	
	
	
}
