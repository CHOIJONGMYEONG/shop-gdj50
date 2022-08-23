package service;

import java.sql.Connection;
import java.sql.SQLException;

import shop.repository.CounterDao;
import shop.repository.DBUtil;


public class CounterService {
	private CounterDao counterDao;

	public void count() {
		counterDao = new CounterDao();
		Connection conn = null;
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			if (counterDao.selectCounterToday(conn) == null) { // 오늘날짜 카운터가 없으면 1 입력
				counterDao.insertCounter(conn);
			} else { // 오늘날짜의 카운터가 있으면 +1 업데이터
				counterDao.updateCounter(conn);
			}
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public int getTotalCount() {
		counterDao = new CounterDao();
		Connection conn = null;
		int totalCount = 0;
		
		try {conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			totalCount = counterDao.selectTotalCount(conn);
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		return totalCount;
	}

	public int getTodayCount() {
		counterDao = new CounterDao();
		Connection conn = null;
		int todayCount = 0;
		try {conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);
		todayCount = counterDao.selectTodayCount(conn);
		
		conn.commit();
		} catch (Exception e) {
			e.printStackTrace(); // console에 예외메세지 출력
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return todayCount;
	}
	// 2개 추가
}