package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import shop.repository.DBUtil;
import shop.repository.GoodsDao;
import shop.repository.ReviewDao;
import shop.vo.Review;

public class ReviewService {
		
	public boolean addReview(Review paramReview) {
		Connection conn = null;
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		ReviewDao reviewDao= new ReviewDao();
		reviewDao.reviewInsert(conn, paramReview);
		
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
	
	public List<Review> getReviewListByPage(int goodsNo, int rowPerPage, int currentPage){
		Connection conn = null;
		System.out.println("Review List 굿즈노"+goodsNo);
		List<Review> list = new ArrayList<Review>();
		 int beginRow = (currentPage - 1) * rowPerPage;
		ReviewDao reviewDao = new ReviewDao();
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			list = reviewDao.selectReviewListByPage(conn ,rowPerPage,beginRow,goodsNo);
			
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
	public int getReviewAllCount() {
		Connection conn = null;
		int totalRow = 0;
		ReviewDao reviewDao = new ReviewDao();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		
		totalRow = reviewDao.selectReviewAllCount(conn);
		
	
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
	
	
	public boolean modifyReview(Review paramReview) {
		Connection conn = null;
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		ReviewDao reviewDao= new ReviewDao();
		reviewDao.reviewUpdate(conn, paramReview);
		
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
	public boolean removeReview(Review paramReview) {
		Connection conn = null;
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		ReviewDao reviewDao= new ReviewDao();
		reviewDao.reviewDelete(conn, paramReview);
		
		
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
