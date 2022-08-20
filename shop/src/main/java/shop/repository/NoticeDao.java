package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shop.vo.Goods;
import shop.vo.Notice;

public class NoticeDao {
	public List<Notice> selectNoticeListByPage(Connection conn, final int rowPerPage, int beginRow) throws Exception {

		String sql = "SELECT notice_no,notice_title,notice_content,update_date , create_date  FROM notice ORDER BY goods_no DESC LIMIT ?, ?";
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
