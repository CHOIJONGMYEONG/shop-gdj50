package shop.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	public Connection getConnection() throws Exception {
		
		 Class.forName("org.mariadb.jdbc.Driver");
	      String url = "jdbc:mariadb://localhost:3306/shop";
	      String dbuser = "root";
	      String dbpw = "aa900413";
	      Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
		return conn;
		
		
		}
}
