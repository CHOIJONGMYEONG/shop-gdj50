package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
		
		String sql = "SELECT employee_id , employee_pass, employee_name, update_date, create_date , active,lev FROM employee WHERE employee_id=? AND employee_pass = PASSWORD(?) AND active='Y'";
		
	
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
				loginEmployee.setLev(rs.getInt("lev"));
			}
				
			System.out.println(loginEmployee.getEmployeeId());
		
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
	
		
		
		
		return loginEmployee;

		
		
	}
	
	public ArrayList<Employee> selectEmployeeInfo(Connection conn,int rowPerPage , int beginRow) throws Exception {
		Employee infoEmployee = null;
		ArrayList<Employee> infoList =null; 
		String sql = "SELECT employee_id , employee_pass, employee_name, update_date, create_date , active FROM employee ORDER BY employee_id DESC LIMIT ?, ?";
		
	
		PreparedStatement stmt = null;
		
		
		ResultSet rs =null;
		
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			
			
			infoList = new ArrayList<Employee>();
			while(rs.next()) {
				infoEmployee = new Employee();	
				infoEmployee.setEmployeeId(rs.getString("employee_id"));
				infoEmployee.setEmployeePass(rs.getString("employee_pass"));
				infoEmployee.setEmployeeName(rs.getString("employee_name"));
				infoEmployee.setUpdateDate(rs.getString("update_date"));
				infoEmployee.setCreateDate(rs.getString("create_date"));
				infoEmployee.setActive(rs.getString("active"));
				infoList.add(infoEmployee);
			}
				
			System.out.println(infoEmployee.getEmployeeId());
		
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
	
		
		
		
		return infoList;

		
		
	}
	
	public int EmployeeAppovalUpdate(Connection conn,Employee paramEmpolyee) throws Exception {
		int a =0;
		
		String sql = "update employee set active = ? WHERE employee_id = ?";
		
		
		PreparedStatement stmt = null;
		
		System.out.print(paramEmpolyee.getEmployeeId());
		System.out.print(paramEmpolyee.getActive());
	
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramEmpolyee.getActive());
			stmt.setString(2,paramEmpolyee.getEmployeeId());
			
			
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	
	public int selectEmployeeAllCount(Connection conn) throws Exception {
		String sql = "SELECT count(*) count from employee";
		 int totalRow = 0;
	
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				totalRow= rs.getInt("count");
				
			}
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return totalRow;

		
		
	}
	
	public Employee selectOneEmployee(Connection conn, Employee ParamEmployee) throws Exception {

		String sql = "SELECT employee_id,employee_pass,employee_name,create_date,update_date ,active FROM employee WHERE employee_id=?";

		PreparedStatement stmt = null;
		Employee employee =new Employee();
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ParamEmployee.getEmployeeId());

			rs = stmt.executeQuery();

			if (rs.next()) {
				employee.setEmployeeId(rs.getString("employee_id"));
				employee.setEmployeePass(rs.getString("employee_pass"));
				employee.setEmployeeName(rs.getString("employee_name"));
				employee.setCreateDate(rs.getString("create_date"));
				employee.setUpdateDate(rs.getString("update_date"));
				employee.setActive(rs.getString("active"));

			}
			System.out.println("ParamEmployee 다오 확인 "+ParamEmployee.getEmployeeId());
			System.out.println("다오 확인 "+employee.getEmployeeId());

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		return employee;
	}
	
	public Employee updateEmployee(Connection conn, Employee ParamEmployee) throws Exception {

		String sql = "UPDATE employee SET employee_pass = PASSWORD(?) ,employee_name = ?,update_date= NOW() WHERE employee_id=?";

		PreparedStatement stmt = null;
		Employee employee =new Employee();

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ParamEmployee.getEmployeePass());
			stmt.setString(2, ParamEmployee.getEmployeeName());
			stmt.setString(3, ParamEmployee.getEmployeeId());

			stmt.executeUpdate();

			System.out.println("ParamEmployee 업데이트 다오 확인 "+ParamEmployee.getEmployeeId());

		} finally {
			if (stmt != null) {
				stmt.close();
			}

		}

		return employee;
	}
	
	
	
}
