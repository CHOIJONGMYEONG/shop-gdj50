package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shop.vo.Employee;
import shop.vo.Goods;
import shop.vo.Notice;

public class NoticeDao {
	
	
	public int noticeDelete(Connection conn,Notice paramNotice) throws Exception {
		int a =0;
		
		String sql = "DELETE FROM notice WHERE notice_no = ?";
		
		
		PreparedStatement stmt = null;
		
		System.out.print(paramNotice.getNoticeTitle());
	
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,paramNotice.getNoticeNo());
			
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	
	public int noticeUpdate(Connection conn,Notice paramNotice) throws Exception {
		int a =0;
		
		String sql = "update notice set notice_title = ?, notice_content = ? WHERE notice_no = ?";
		
		
		PreparedStatement stmt = null;
		
		System.out.print(paramNotice.getNoticeTitle());
	
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramNotice.getNoticeTitle());
			stmt.setString(2,paramNotice.getNoticeContent());
			stmt.setInt(3,paramNotice.getNoticeNo());
			
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	
	public Notice selectNoticeOne(Connection conn, Notice noticeParam) throws Exception {

		String sql = "SELECT notice_no,notice_title,notice_content,update_date , create_date  FROM notice WHERE notice_no = ?";

		PreparedStatement stmt = null;
		Notice notice = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, noticeParam.getNoticeNo());
			rs = stmt.executeQuery();

			while (rs.next()) {
				notice = new Notice();
				notice.setNoticeNo(rs.getInt("notice_no"));
				notice.setNoticeTitle(rs.getString("notice_title"));
				notice.setNoticeContent(rs.getString("notice_content"));
				notice.setUpdateDate(rs.getString("update_date"));
				notice.setCreateDate(rs.getString("create_date"));

			}

			System.out.println(notice.getNoticeTitle());

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		return notice;

	}
	
	
	
	public int selectNoticeAllCount(Connection conn) throws Exception {
		String sql = "SELECT count(*) count from notice";
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
	
	
	
	
	public List<Notice> selectNoticeListByPage(Connection conn, final int rowPerPage, int beginRow) throws Exception {

		String sql = "SELECT notice_no,notice_title,notice_content,update_date , create_date  FROM notice ORDER BY notice_no DESC LIMIT ?, ?";
		List<Notice> list = new ArrayList<Notice>();

		PreparedStatement stmt = null;
		Notice notice = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();

			while (rs.next()) {
				notice = new Notice();
				notice.setNoticeNo(rs.getInt("notice_no"));
				notice.setNoticeTitle(rs.getString("notice_title"));
				notice.setNoticeContent(rs.getString("notice_content"));
				notice.setUpdateDate(rs.getString("update_date"));
				notice.setCreateDate(rs.getString("create_date"));

				list.add(notice);
			}

			System.out.println(notice.getNoticeTitle());

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		return list;

	}
}
