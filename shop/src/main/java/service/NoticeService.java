package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.repository.CustomerDao;
import shop.repository.DBUtil;
import shop.repository.GoodsDao;
import shop.repository.NoticeDao;
import shop.vo.Customer;
import shop.vo.Goods;
import shop.vo.Notice;

public class NoticeService {
	private NoticeDao noticeDao;
	
	public boolean modifyNotice(Notice noticeParam) {
		Connection conn = null;
		this.noticeDao = new NoticeDao();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		noticeDao.noticeUpdate(conn, noticeParam);
		
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
	
	
	
	public boolean deleteNotice(Notice noticeParam) {
		Connection conn = null;
		this.noticeDao = new NoticeDao();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		noticeDao.noticeDelete(conn, noticeParam);
		
	
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
	
	
	
	public Notice getNoticeOne(Notice noticeParam){
		Connection conn = null;
		this.noticeDao = new NoticeDao();
		Notice notice = new Notice();
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			notice = noticeDao.selectNoticeOne(conn, noticeParam);
			
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
			return notice;
		
		
	}
	
	
	public int getNoticeAllCount() {
		Connection conn = null;
		int totalRow = 0;
		this.noticeDao =new NoticeDao();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		
		totalRow = noticeDao.selectNoticeAllCount(conn);
		
	
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
	
	
	
	public List<Notice> getNoticeListByPage(int rowPerPage , int currentPage){
		Connection conn = null;
		List<Notice> list = new ArrayList<>();
		this.noticeDao = new NoticeDao();
		 int beginRow = (currentPage - 1) * rowPerPage;
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			 list = noticeDao.selectNoticeListByPage(conn, rowPerPage, beginRow);
			
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
}
