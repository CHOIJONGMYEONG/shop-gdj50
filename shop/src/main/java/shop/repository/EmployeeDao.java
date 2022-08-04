package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import shop.vo.Customer;
import shop.vo.Employee;

public class EmployeeDao {
	
public int deleteEmployee(Connection conn, Employee paramEmployee) throws Exception {
		
		// 동일한 conn
		// conn.close()X
		int row = 0;
		String sql = "DELETE FROM employee WHERE employee_id = ? AND employee_pass = password(?)";
		
		 PreparedStatement stmt=null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramEmployee.getEmployeeId());
			stmt.setString(2, paramEmployee.getEmployeePass());
			row =stmt.executeUpdate();
		 
		
		}finally {
			stmt.close();
		}
	
		return row;
		
		
	}
	
	
	
	public int EmployeeInsert(Connection conn,Employee employee) throws Exception {
		int a =0;
		
		String sql = "insert into employee (employee_id,employee_pass,employee_name,update_date,create_date) values(?,password(?),?,now(),now())";
		
		
		PreparedStatement stmt = null;
		
		System.out.print(employee.getEmployeeId());
		System.out.print(employee.getEmployeePass());
		System.out.print(employee.getEmployeeName());
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,employee.getEmployeeId());
			stmt.setString(2, employee.getEmployeePass());
			stmt.setString(3, employee.getEmployeeName());
			
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	
	
	
	public Employee selectEmployeeByidAndPw(Connection conn, Employee paramEmployee) throws Exception {
		Employee loginEmployee = null;
		
		String sql = "SELECT employee_id , employee_pass, employee_name, update_date, create_date , active FROM employee WHERE employee_id=? AND employee_pass = PASSWORD(?) AND active='Y'";
		
	
		PreparedStatement stmt = null;
		
		
		ResultSet rs =null;
		
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,paramEmployee.getEmployeeId());
			stmt.setString(2, paramEmployee.getEmployeePass());
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
		
		}
	
		
		
		
		return loginEmployee;

		
		
	}
}
