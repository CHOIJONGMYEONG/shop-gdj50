package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import shop.repository.CustomerDao;
import shop.repository.DBUtil;
import shop.repository.EmployeeDao;
import shop.repository.OutIdDao;
import shop.vo.Customer;
import shop.vo.Employee;


public class EmployeeService {

	public boolean removeEmployee(Employee paramEmployee) {
		Connection conn = null;
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		EmployeeDao employeeDao= new EmployeeDao();
		
		
		if(employeeDao.deleteEmployee(conn, paramEmployee)==1) {
			OutIdDao outIdDao = new OutIdDao();	
			if(outIdDao.insertOutId(conn, paramEmployee.getEmployeeId())!=1) {
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
	
	public Employee getEmpolyee(Employee paramEmployee) {
		Connection conn = null;
		Employee employee = new Employee();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		EmployeeDao employeeDao= new EmployeeDao();
		employee = employeeDao.selectEmployeeByidAndPw(conn, paramEmployee);
		
	
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
		return employee;
		
	}
	
	public boolean addEmpolyee(Employee paramEmpolyee) {
		Connection conn = null;
		
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		EmployeeDao employeeDao= new EmployeeDao();
		employeeDao.EmployeeInsert(conn, paramEmpolyee);
		
	
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
	
	
	
	public ArrayList<Employee> getinfoEmpolyee(int rowPerPage , int currentPage) {
		 int beginRow = (currentPage - 1) * rowPerPage;
		Connection conn = null;
		ArrayList<Employee> employeeList = new ArrayList<Employee>();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		EmployeeDao employeeDao= new EmployeeDao();
		employeeList = employeeDao.selectEmployeeInfo(conn, rowPerPage ,beginRow );
		
	
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
		return employeeList;
		
	}
	
	
	public boolean modifyAppovalEmpolyee(Employee paramEmpolyee) {
		Connection conn = null;
		
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		EmployeeDao employeeDao= new EmployeeDao();
		employeeDao.EmployeeAppovalUpdate(conn, paramEmpolyee);
		
	
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
	
	public int getEmployeeAllCount() {
		Connection conn = null;
		int totalRow = 0;
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		EmployeeDao employeeDao= new EmployeeDao();
		totalRow = employeeDao.selectEmployeeAllCount(conn);
		
	
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
		return totalRow;
		
	}
	
	
}
