package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import shop.repository.DBUtil;
import shop.repository.GoodsDao;
import shop.repository.OrdersDao;
import shop.vo.Orders;

public class OrderService {

	private OrdersDao ordersDao;
	
	public int ordesrAdd(Orders orders) {
		Connection conn = null;
		int complete = 0;
		this.ordersDao =new OrdersDao();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		
		complete = ordersDao.ordersInsert(conn, orders);
		
	
		conn.commit();
		}catch(Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
		
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return complete;
		
	}
	
	public List<Map<String,Object>> getOrderList(int rowPerPage, int currentPage){
		Connection conn = null;
		List<Map<String,Object>> list = new ArrayList<>();
		 int beginRow = (currentPage - 1) * rowPerPage;
		this.ordersDao = new OrdersDao();
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			list = ordersDao.selectOrderList(conn , rowPerPage,beginRow);
			
			conn.commit();
			}catch(Exception e) {
				e.printStackTrace(); // console에 예외메세지 출력
				
			}finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return list;
		
		
	}
	
	
	
	
	public int getOrderAllCount() {
		Connection conn = null;
		int totalRow = 0;
		this.ordersDao =new OrdersDao();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		
		totalRow = ordersDao.selectOrdersAllCount(conn);
		
	
		conn.commit();
		}catch(Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
		
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalRow;
		
	}
	
	public Map<String,Object> getOrdersOne(int orderNO){
		Connection conn = null;
		Map<String,Object> m = new HashMap<String,Object>();
		this.ordersDao = new OrdersDao();
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			 m = ordersDao.selectOrdersOne(conn , orderNO);
			
			conn.commit();
			}catch(Exception e) {
				e.printStackTrace(); // console에 예외메세지 출력
				
			}finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return m;
		
		
	}
	
	
	public List<Map<String,Object>> getOrdersListByCustomer(String customerId, int rowPerPage, int currentPage){
		Connection conn = null;
		System.out.print(customerId);
		List<Map<String,Object>> list = new ArrayList<>();
		 int beginRow = (currentPage - 1) * rowPerPage;
		this.ordersDao = new OrdersDao();
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			list = ordersDao.selectOrdersListByCustomer(conn ,customerId, rowPerPage,beginRow);
			
			conn.commit();
			}catch(Exception e) {
				e.printStackTrace(); // console에 예외메세지 출력
				
			}finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return list;
		
	}
	
	
	
	
	public int adminStateModify(Orders orders) {
		Connection conn = null;
		int complete = 0;
		this.ordersDao =new OrdersDao();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		
		complete = ordersDao.adminStateUpdate(conn, orders);
		
	
		conn.commit();
		}catch(Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
		
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return complete;
		
	}
	
}
