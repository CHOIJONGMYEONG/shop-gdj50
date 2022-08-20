package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.repository.DBUtil;
import shop.repository.GoodsDao;
import shop.repository.NoticeDao;
import shop.vo.Goods;
import shop.vo.Notice;

public class NoticeService {
	private NoticeDao noticeDao;
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
