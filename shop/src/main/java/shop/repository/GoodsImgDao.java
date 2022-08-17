package shop.repository;

import java.sql.*;

import shop.vo.GoodsImg;

public class GoodsImgDao {

	
	// 반환값 : key값(jdbc API)
	public int deleteGoodsImg(Connection conn ,int goodsNo) throws SQLException {
		int a= 0;
		String sql = "DELETE FROM goods_img WHERE goods_no= ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 1) insert
		// 2) select last_ai_key 
		
		try {
		stmt.setInt(1,goodsNo);
		
		a =stmt.executeUpdate(); // insert 성공한 row수 43

		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		
		
		
		return a;
	}
	
	
	
	public int insertGoodsImg(Connection conn ,GoodsImg goodsImg) throws SQLException {
		int a= 0;
		String sql = "INSERT INTO goods_img (goods_no, filename , origin_filename , content_type, create_date) VALUES(?,?,?,?,now())"; //Statement.RETURN_GENERATED_KEYS;
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 1) insert
		// 2) select last_ai_key 
		
		try {
		stmt.setInt(1,goodsImg.getGoodsNo() );
		stmt.setString(2,goodsImg.getFilename());
		stmt.setString(3,goodsImg.getOriginFileName());
		stmt.setString(4,goodsImg.getContentType());
		
		a =stmt.executeUpdate(); // insert 성공한 row수 43
		
	
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
		
		
		return a;
	}
	
	public int updateGoodsImg(Connection conn ,GoodsImg goodsImg) throws SQLException {
		int a= 0;
		String sql = "update goods_img set filename = ? ,origin_filename = ? , content_type=?, create_date=now() where goods_no =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 1) insert
		// 2) select last_ai_key 
		
		try {
		stmt.setString(1,goodsImg.getFilename() );
		stmt.setString(2,goodsImg.getOriginFileName());
		stmt.setString(3,goodsImg.getContentType());
		stmt.setInt(4,goodsImg.getGoodsNo());
		
		a =stmt.executeUpdate(); // insert 성공한 row수 43

		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		
		
		
		return a;
	}
	
	
}
