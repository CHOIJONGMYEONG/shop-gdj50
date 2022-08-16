package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import shop.repository.DBUtil;
import shop.repository.StatisticsDao;


public class StatisticsService {

	
	private StatisticsDao statisticsDao;
	
	public List<Map<String, Object>> selectCountByHiredate(int year) {
		List<Map<String,Object>> list = null; 
		Connection  conn = null;
		list = new ArrayList<>();
		statisticsDao = new StatisticsDao();
		System.out.print(year);
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			list = statisticsDao.selectCountByHiredate(conn, year);
			conn.commit();
		}catch (Exception e) {
			e.printStackTrace();
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
		
		return list;
	}

	
	
	
	public List<Map<String, Object>> selectCountByCustomer(int year) {
		List<Map<String,Object>> list = null; 
		Connection  conn = null;
		list = new ArrayList<>();
		statisticsDao = new StatisticsDao();
		System.out.print(year);
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			list = statisticsDao.selectCountByOrder(conn, year);
			conn.commit();
		}catch (Exception e) {
			e.printStackTrace();
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
		
		return list;
	}
	
	
	public List<Map<String, Object>> selectCountByOutId(int year) {
		List<Map<String,Object>> list = null; 
		Connection  conn = null;
		list = new ArrayList<>();
		statisticsDao = new StatisticsDao();
		System.out.print(year);
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			list = statisticsDao.selectCountByOutId(conn, year);
			conn.commit();
		}catch (Exception e) {
			e.printStackTrace();
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
		
		return list;
	}
}
