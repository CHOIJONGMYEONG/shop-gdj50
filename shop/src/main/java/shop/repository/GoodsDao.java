package shop.repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import shop.vo.Goods;


public class GoodsDao {
	
	
	public int insertGoods(Connection conn, Goods goods) throws SQLException {
		
		int keyId= 0;
		String sql = "INSERT INTO goods (goods_name, goods_price , update_date , create_date) VALUES(?,?,now(),now())"; //Statement.RETURN_GENERATED_KEYS;
		PreparedStatement stmt = conn.prepareStatement(sql);
		// 1) insert
		// 2) select last_ai_key 
		stmt.setString(1,goods.getGoodsName() );
		stmt.setInt(2,goods.getGoodsPrice());
	
		
		stmt.executeUpdate(); // insert 성공한 row수 
		ResultSet rs = stmt.getGeneratedKeys();// select last_key
		
		if(rs.next()) {
			keyId=rs.getInt(1);
		}
		
		if (stmt!=null) {
			stmt.close();
		}
		if (rs!=null) {
			rs.close();
		}
		
		return keyId;
		
	}
	
	
	
	public Map<String,Object> selectGoodsAndImgOne(Connection conn , int goodsNO) throws Exception{
	
		Map<String,Object> m = new HashMap<String,Object>();
		PreparedStatement stmt = null;
		ResultSet rs =null;
		String sql=  "SELECT g.goods_no,g.goods_name,g.goods_price,g.update_date ,g.create_date ,g.sold_out ,gi.filename , gi.origin_filename,gi.content_type , gi.create_date FROM goods g INNER JOIN goods_img gi ON g.goods_no = gi.goods_no WHERE g.goods_no = ?";
		
		/*
		    SELECT g.*, gi.*
			FROM goods g INNER JOIN goods_img gi
			ON g.goods_no = gi.goods_no
			WHERE g.goods_no = 1
		  
		 
		while(rs.next()) {
			Map<String,Object> m = new HashMap<String, Object>();
			m.put("goodsNo", rs.getInt("goodsNo"));		
			
		}
		쿼리에서 where 조건이 없다면 ..반환타입 List<Map<String,Object>> list
		*/
		
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, goodsNO);
			rs = stmt.executeQuery();
			
			
			if(rs.next()) {
				System.out.println(rs.getInt("g.goods_no"));
				System.out.println(rs.getString("g.goods_name"));
			m.put("goodsNo", rs.getInt("g.goods_no"));
			m.put("goodsName",rs.getString("g.goods_name"));
			m.put("goodsPrice", rs.getInt("g.goods_price"));
			m.put("updateDate",rs.getString("g.update_date") );
			m.put("createDate", rs.getString("g.create_date"));
			m.put("soldOut",rs.getString("g.sold_out") );
			m.put("fileName",rs.getString("gi.filename") );
			m.put("originFilename", rs.getString("gi.origin_filename"));
			m.put("contentType",rs.getString("gi.content_type") );
			m.put("createDate",rs.getString("gi.create_date") );
				
				
			}
				
			System.out.println(m.get("goodsNo"));
			System.out.println(m.get("goodsName"));
		
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return m;
		
		
		
		
		
		
	}
	
	
	public List<Goods> selectGoodsListByPage(Connection conn, final int rowPerPage , int beginRow) throws Exception{
		
	
		String sql = "SELECT goods_no,goods_name,goods_price,update_date , create_date ,sold_out FROM goods ORDER BY goods_no DESC LIMIT ?, ?";
		List<Goods> list = new ArrayList<Goods>();
				
		PreparedStatement stmt = null;
		Goods goods =new Goods();
		ResultSet rs =null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			
			
			
			while(rs.next()) {
				goods = new Goods();	
				goods.setGoodsNo(rs.getInt("goods_no"));
				goods.setGoodsName(rs.getString("goods_name"));
				goods.setGoodsPrice(rs.getInt("goods_price"));
				goods.setUpdateDate(rs.getString("update_date"));
				goods.setCreateDate(rs.getString("create_date"));
				goods.setSoldOut(rs.getString("sold_out"));
				
				list.add(goods);
			}
				
			System.out.println(goods.getGoodsName());
		
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return list;
		
		
	}
	
	public int selectGoodsAllCount(Connection conn) throws Exception {
		String sql = "SELECT count(*) count from goods";
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
	
	
}
