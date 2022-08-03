package shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import shop.vo.Employee;

public class EmployeeDao {
	public Employee Employeelogin(Employee employee) throws Exception {
		Employee loginEmployee = null;
		
		String sql = "SELECT employee_id , employee_pass, employee_name, update_date, create_date , active FROM employee WHERE employee_id=? AND employee_pass = PASSWORD(?) AND active='Y'";
		
		Connection conn =null;
		PreparedStatement stmt = null;
		
		DBUtil dbutil= new DBUtil();
		ResultSet rs =null;
		
		try {
			conn =dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,employee.getEmployeeId());
			stmt.setString(2, employee.getEmployeePass());
			rs = stmt.executeQuery();
			
			loginEmployee = new Employee();	
			if(rs.next()) {
				
				loginEmployee.setEmployeeId(rs.getString("employee_id"));
				loginEmployee.setEmployeePass(rs.getString("employee_pass"));
				loginEmployee.setEmployeeName(rs.getString("employee_name"));
				loginEmployee.setUpdateDate(rs.getString("update_date"));
				loginEmployee.setCreateDate(rs.getString("create_date"));
				loginEmployee.setActive(rs.getString("active"));
			}
				
			System.out.println(loginEmployee.getEmployeeId());
		
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
			if(conn!=null) {conn.close();}
		}
	
		
		
		
		return loginEmployee;

		
		
	}
}
