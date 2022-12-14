package shop.repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import shop.vo.Employee;
import shop.vo.Goods;


public class GoodsDao {
	
	public int goodsOneDelete(Connection conn, int goodsNo) throws Exception {
		int a =0;
		
		String sql = "DELETE FROM goods WHERE goods_no= ?";
		
		
		PreparedStatement stmt = null;
		
		
	
		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,goodsNo);
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	
	public int goodsOneUpdate(Connection conn, Goods goods) throws Exception {
		int a =0;
		
		String sql = "update goods set goods_name = ?,goods_price =? WHERE goods_no = ?";
		
		
		PreparedStatement stmt = null;
		
		
	
		try {
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,goods.getGoodsName());
			stmt.setInt(2,goods.getGoodsPrice());
			stmt.setInt(3,goods.getGoodsNo());
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	
	
	public int goodsSoldOutUpdate(Connection conn, Goods goods) throws Exception {
		int a =0;
		
		String sql = "update goods set sold_out = ? WHERE goods_no = ?";
		
		
		PreparedStatement stmt = null;
		
		
	
		try {
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,goods.getSoldOut());
			stmt.setInt(2,goods.getGoodsNo());
			
			
			a = stmt.executeUpdate();
			
		
		}finally {
			if(stmt!=null) {stmt.close();}
			
		}
	
		return a;
		
	}
	
	public Map<String,Object> selectCustomerOneGoods(Connection conn , int goodsNO) throws Exception{
		
		Map<String,Object> m = new HashMap<String,Object>();
		PreparedStatement stmt = null;
		PreparedStatement hitstmt = null;
		ResultSet rs =null;
		int row = 0;
		String sql=  "SELECT g.goods_no,g.goods_name,g.goods_price,g.update_date ,g.create_date ,g.sold_out ,gi.filename , gi.origin_filename,gi.content_type , gi.create_date FROM goods g INNER JOIN goods_img gi ON g.goods_no = gi.goods_no WHERE g.goods_no = ?";
		String sql1= "UPDATE goods SET hit=hit+1 WHERE goods_no = ?";
		/*
		    SELECT g.*, gi.*
			FROM goods g INNER JOIN goods_img gi
			ON g.goods_no = gi.goods_no
			WHERE g.goods_no = 1
		  
		 
		while(rs.next()) {
			Map<String,Object> m = new HashMap<String, Object>();
			m.put("goodsNo", rs.getInt("goodsNo"));		
			
		}
		???????????? where ????????? ????????? ..???????????? List<Map<String,Object>> list
		*/
		
		
		try {
			
			hitstmt =conn.prepareStatement(sql1);
			hitstmt.setInt(1, goodsNO);
			row = hitstmt.executeUpdate();
			
		
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
			System.out.print("?????????????????? ??"+row);
			System.out.println(m.get("goodsNo"));
			System.out.println(m.get("goodsName"));
		
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return m;
	}
	
	public int insertGoods(Connection conn, Goods goods) throws SQLException {
		
		int keyId= 0;
		String sql = "INSERT INTO goods (goods_name, goods_price , update_date , create_date) VALUES(?,?,now(),now())"; //Statement.RETURN_GENERATED_KEYS;
		PreparedStatement stmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		// 1) insert
		// 2) select last_ai_key 
		stmt.setString(1,goods.getGoodsName() );
		stmt.setInt(2,goods.getGoodsPrice());
	
		
		stmt.executeUpdate(); // insert ????????? row??? 
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
		???????????? where ????????? ????????? ..???????????? List<Map<String,Object>> list
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
	public List<Map<String,Object>> selectCustomerGoodsListByPage (Connection conn ,int rowrPerpage  ,int beginRow) throws Exception {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		/*
		 ????????? ???????????? ????????? ??????
		SELECT g.*, IFNULL( t.sumNum,0) sumNum 
		FROM
		 goods g LEFT JOIN (SELECT orders, SUM(order_quantity)
				 FROM orders
				 GROUP BY goods_no) t 
				
		 		ON g.goods_no = t.goods_no
		 			INNER JOIN goods_img gi
		 			ON g.goods_no = go.goods_no
		 ORDER BY IFNULL( t.sumNum,0) DESC
		 */
		
		String sql = "SELECT g.goods_no goodsNo\r\n"
				+ ", g.goods_name goodsName\r\n"
				+ ", g.goods_price goodsPrice\r\n"
				+ ", g.sold_out soldOut\r\n"
				+ ", gi.filename filename\r\n"
				+ " FROM\r\n"
				+ " goods g LEFT JOIN (SELECT goods_no, SUM(order_quantity) sumNum\r\n"
				+ " FROM orders\r\n"
				+ " GROUP BY goods_no) t\r\n"
				+ " ON g.goods_no = t.goods_no\r\n"
				+ "INNER JOIN goods_img gi\r\n"
				+ " ON g.goods_no = gi.goods_no\r\n"
				+ "ORDER BY IFNULL(t.sumNUm, 0) DESC LIMIT ?, ? \r\n";
			
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,beginRow );
			stmt.setInt(2,rowrPerpage );
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String ,Object> map =new HashMap<String,Object>();
				map.put("goodsNo", rs.getInt("goodsNo"));
				map.put("goodsName", rs.getString("goodsName"));
				map.put("goodsPrice", rs.getInt("goodsPrice"));
				map.put("soldOut", rs.getString("soldOut"));
				map.put("filename", rs.getString("filename"));
				
				list.add(map);
				
			}
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return list;

		
		
	}
	
	public List<Map<String,Object>> selectCustomerRowGoodsListByPage (Connection conn ,int rowrPerpage  ,int beginRow) throws Exception {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		/*
		 ????????? ???????????? ????????? ??????
		SELECT g.*, IFNULL( t.sumNum,0) sumNum 
		FROM
		 goods g LEFT JOIN (SELECT orders, SUM(order_quantity)
				 FROM orders
				 GROUP BY goods_no) t 
				
		 		ON g.goods_no = t.goods_no
		 			INNER JOIN goods_img gi
		 			ON g.goods_no = go.goods_no
		 ORDER BY IFNULL( t.sumNum,0) DESC
		 */
		
		String sql = "SELECT g.goods_no goodsNo\r\n"
				+ ", g.goods_name goodsName\r\n"
				+ ", g.goods_price goodsPrice\r\n"
				+ ", g.sold_out soldOut\r\n"
				+ ", gi.filename filename\r\n"
				+ " FROM\r\n"
				+ " goods g LEFT JOIN (SELECT goods_no, SUM(order_quantity) sumNum\r\n"
				+ " FROM orders\r\n"
				+ " GROUP BY goods_no) t\r\n"
				+ " ON g.goods_no = t.goods_no\r\n"
				+ "INNER JOIN goods_img gi\r\n"
				+ " ON g.goods_no = gi.goods_no\r\n"
				+ "ORDER BY goodsPrice LIMIT ?, ? \r\n";
			
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,beginRow );
			stmt.setInt(2,rowrPerpage );
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String ,Object> map =new HashMap<String,Object>();
				map.put("goodsNo", rs.getInt("goodsNo"));
				map.put("goodsName", rs.getString("goodsName"));
				map.put("goodsPrice", rs.getInt("goodsPrice"));
				map.put("soldOut", rs.getString("soldOut"));
				map.put("filename", rs.getString("filename"));
				
				list.add(map);
				
			}
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return list;

		
		
	}
	
	
	public List<Map<String,Object>> selectCustomerHighGoodsListByPage (Connection conn ,int rowrPerpage  ,int beginRow) throws Exception {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		/*
		 ????????? ???????????? ????????? ??????
		SELECT g.*, IFNULL( t.sumNum,0) sumNum 
		FROM
		 goods g LEFT JOIN (SELECT orders, SUM(order_quantity)
				 FROM orders
				 GROUP BY goods_no) t 
				
		 		ON g.goods_no = t.goods_no
		 			INNER JOIN goods_img gi
		 			ON g.goods_no = go.goods_no
		 ORDER BY IFNULL( t.sumNum,0) DESC
		 */
		
		String sql = "SELECT g.goods_no goodsNo\r\n"
				+ ", g.goods_name goodsName\r\n"
				+ ", g.goods_price goodsPrice\r\n"
				+ ", g.sold_out soldOut\r\n"
				+ ", gi.filename filename\r\n"
				+ " FROM\r\n"
				+ " goods g LEFT JOIN (SELECT goods_no, SUM(order_quantity) sumNum\r\n"
				+ " FROM orders\r\n"
				+ " GROUP BY goods_no) t\r\n"
				+ " ON g.goods_no = t.goods_no\r\n"
				+ "INNER JOIN goods_img gi\r\n"
				+ " ON g.goods_no = gi.goods_no\r\n"
				+ "ORDER BY goodsPrice DESC LIMIT ?, ? \r\n";
			
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,beginRow );
			stmt.setInt(2,rowrPerpage );
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String ,Object> map =new HashMap<String,Object>();
				map.put("goodsNo", rs.getInt("goodsNo"));
				map.put("goodsName", rs.getString("goodsName"));
				map.put("goodsPrice", rs.getInt("goodsPrice"));
				map.put("soldOut", rs.getString("soldOut"));
				map.put("filename", rs.getString("filename"));
				
				list.add(map);
				
			}
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return list;

		
		
	}
	
	public List<Map<String,Object>> selectCustomerNewGoodsListByPage (Connection conn ,int rowrPerpage  ,int beginRow) throws Exception {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		/*
		 ????????? ???????????? ????????? ??????
		SELECT g.*, IFNULL( t.sumNum,0) sumNum 
		FROM
		 goods g LEFT JOIN (SELECT orders, SUM(order_quantity)
				 FROM orders
				 GROUP BY goods_no) t 
				
		 		ON g.goods_no = t.goods_no
		 			INNER JOIN goods_img gi
		 			ON g.goods_no = go.goods_no
		 ORDER BY IFNULL( t.sumNum,0) DESC
		 */
		
		String sql = "SELECT g.goods_no goodsNo\r\n"
				+ ", g.goods_name goodsName\r\n"
				+ ", g.goods_price goodsPrice\r\n"
				+ ", g.sold_out soldOut\r\n"
				+ ", gi.filename filename\r\n"
				+ " FROM\r\n"
				+ " goods g LEFT JOIN (SELECT goods_no, SUM(order_quantity) sumNum\r\n"
				+ " FROM orders\r\n"
				+ " GROUP BY goods_no) t\r\n"
				+ " ON g.goods_no = t.goods_no\r\n"
				+ "INNER JOIN goods_img gi\r\n"
				+ " ON g.goods_no = gi.goods_no\r\n"
				+ "ORDER BY goodsNo DESC LIMIT ?, ? \r\n";
			
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,beginRow );
			stmt.setInt(2,rowrPerpage );
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String ,Object> map =new HashMap<String,Object>();
				map.put("goodsNo", rs.getInt("goodsNo"));
				map.put("goodsName", rs.getString("goodsName"));
				map.put("goodsPrice", rs.getInt("goodsPrice"));
				map.put("soldOut", rs.getString("soldOut"));
				map.put("filename", rs.getString("filename"));
				
				list.add(map);
				
			}
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return list;

		
		
	}
	
	public List<Map<String,Object>> selectCustomerHotGoodsListByPage (Connection conn ,int rowrPerpage  ,int beginRow) throws Exception {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		/*
		 ????????? ???????????? ????????? ??????
		SELECT g.*, IFNULL( t.sumNum,0) sumNum 
		FROM
		 goods g LEFT JOIN (SELECT orders, SUM(order_quantity)
				 FROM orders
				 GROUP BY goods_no) t 
				
		 		ON g.goods_no = t.goods_no
		 			INNER JOIN goods_img gi
		 			ON g.goods_no = go.goods_no
		 ORDER BY IFNULL( t.sumNum,0) DESC
		 */
		
		String sql = "SELECT g.goods_no goodsNo\r\n"
				+ ", g.goods_name goodsName\r\n"
				+ ", g.goods_price goodsPrice\r\n"
				+ ", g.sold_out soldOut\r\n"
				+ ", g.hit hit\r\n"
				+ ", gi.filename filename\r\n"
				+ " FROM\r\n"
				+ " goods g LEFT JOIN (SELECT goods_no, SUM(order_quantity) sumNum\r\n"
				+ " FROM orders\r\n"
				+ " GROUP BY goods_no) t\r\n"
				+ " ON g.goods_no = t.goods_no\r\n"
				+ "INNER JOIN goods_img gi\r\n"
				+ " ON g.goods_no = gi.goods_no\r\n"
				+ "ORDER BY hit DESC LIMIT ?, ? \r\n";
			
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,beginRow );
			stmt.setInt(2,rowrPerpage );
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String ,Object> map =new HashMap<String,Object>();
				map.put("goodsNo", rs.getInt("goodsNo"));
				map.put("goodsName", rs.getString("goodsName"));
				map.put("goodsPrice", rs.getInt("goodsPrice"));
				map.put("soldOut", rs.getString("soldOut"));
				map.put("filename", rs.getString("filename"));
				
				list.add(map);
				
			}
		
		}finally {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		
		}
		
		
		return list;

		
		
	}
	
}
