package shop.repository;

import java.sql.*;

import shop.vo.GoodsImg;

public class GoodsImgDao {

	
	// 반환값 : key값(jdbc API)
	public int insertGoodsImg(Connection conn ,GoodsImg goodsImg) throws SQLException {
		int a= 0;
		String sql = "INSERT INTO goods_img (goods_no, filename , origin_filename , content_type, create_date) VALUES(?,?,?,?,now())"; //Statement.RETURN_GENERATED_KEYS;
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 1) insert
		// 2) select last_ai_key 
		stmt.setInt(1,goodsImg.getGoodsNo() );
		stmt.setString(2,goodsImg.getFilename());
		stmt.setString(3,goodsImg.getOriginFileName());
		stmt.setString(4,goodsImg.getContentType());
		
		a =stmt.executeUpdate(); // insert 성공한 row수 43
		
	
		
		if (stmt!=null) {
			stmt.close();
		}
		
		
		
		return a;
	}
	
	
}
