package service;

import java.sql.Connection;
import java.sql.SQLException;

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
	
	
	
}
