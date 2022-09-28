package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shop.vo.Notice;
import shop.vo.Review;

public class ReviewDao {
	public int reviewInsert(Connection conn, Review paramReview) throws Exception {
		int a = 0;

		String sql = "INSERT INTO review (customer_id,order_no,review_content ,update_date,create_date) values(?,?,?,now(),now())";

		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramReview.getCustomerId());
			stmt.setInt(2, paramReview.getOrderNo());
			stmt.setString(3, paramReview.getReviewContent());

			a = stmt.executeUpdate();

		} finally {
			if (stmt != null) {
				stmt.close();
			}

		}

		return a;

	}
	
	public List<Review> selectReviewListByPage(Connection conn, final int rowPerPage, int beginRow, int goodsNo) throws Exception {
		
		System.out.println("Dao goods no"+ goodsNo);
		
		String sql = "select r.customer_id, r.order_no,r.review_content,r.update_date , r.create_date\n"
				+ "from review r inner join orders o \n"
				+ "on r.order_no = o.order_no \n"
				+ "where o.goods_no=? "
				+ "ORDER BY o.create_date DESC LIMIT ?, ? ";
				
		List<Review> list = new ArrayList<Review>();

		PreparedStatement stmt = null;
		Review review = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, goodsNo);
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
			
			rs = stmt.executeQuery();

			while (rs.next()) {
				review = new Review();
				review.setCustomerId(rs.getString("customer_id"));
				review.setOrderNo(rs.getInt("order_no"));
				review.setReviewContent(rs.getString("review_content"));
				review.setUpdateDate(rs.getString("update_date"));
				review.setCreateDate(rs.getString("create_date"));

				list.add(review);
			}

			System.out.println(review.getReviewContent());

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
	
	public int selectReviewAllCount(Connection conn) throws Exception {
		String sql = "SELECT count(*) count from review";
		int totalRow = 0;

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				totalRow = rs.getInt("count");

			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}

		}

		return totalRow;

	}
	public int reviewUpdate(Connection conn, Review paramReview) throws Exception {
		int a = 0;

		String sql = "UPDATE review SET review_content=? , update_date=NOW() WHERE customer_id = ? and order_no = ?";

		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramReview.getReviewContent());
			stmt.setString(2, paramReview.getCustomerId());
			stmt.setInt(3, paramReview.getOrderNo());

			a = stmt.executeUpdate();

		} finally {
			if (stmt != null) {
				stmt.close();
			}

		}

		return a;

	}
	
	public int reviewDelete(Connection conn, Review paramReview) throws Exception {
		int a = 0;

		String sql = "DELETE FROM review WHERE customer_id = ? and order_no = ?";

		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramReview.getCustomerId());
			stmt.setInt(2, paramReview.getOrderNo());

			a = stmt.executeUpdate();

		} finally {
			if (stmt != null) {
				stmt.close();
			}

		}

		return a;

	}
	
}
