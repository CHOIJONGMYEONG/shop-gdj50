package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import shop.repository.DBUtil;
import shop.repository.EmployeeDao;
import shop.repository.GoodsDao;
import shop.repository.GoodsImgDao;
import shop.repository.OrdersDao;
import shop.vo.Employee;
import shop.vo.Goods;
import shop.vo.GoodsImg;

// 트랜잭션 + action이나 dao가 해서는 안되는 일
public class GoodsService {
	
	private GoodsDao goodsDao;
	private GoodsImgDao goodsImgDao;
	
	
	public boolean goodsSoldOutModify(Goods goods) {
		Connection conn = null;
		this.goodsDao = new GoodsDao();
		
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		goodsDao.goodsSoldOutUpdate(conn, goods);
		
	
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
	
	
	
	
	
	
	
	public Map<String,Object>getCustomerOneGoods(int goodsNO) {
		Connection conn = null;
		Map<String,Object> m = new HashMap<String,Object>();
		this.goodsDao = new GoodsDao();
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			 m = goodsDao.selectCustomerOneGoods(conn , goodsNO);
			
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
			return m;
		
		
	}
	
	 public List<Map<String,Object>> selectCustomerHotGoodsListByPage(int rowPerPage , int currentPage){
		 
			Connection conn = null;
			List<Map<String,Object>> list = new ArrayList<>();
			 int beginRow = (currentPage - 1) * rowPerPage;
			this.goodsDao = new GoodsDao();
			
				try{conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
				
				list = goodsDao.selectCustomerHotGoodsListByPage(conn , rowPerPage,beginRow);
				
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
	
	
	
	
	 public List<Map<String,Object>> selectCustomerNewGoodsListByPage(int rowPerPage , int currentPage){
		 
			Connection conn = null;
			List<Map<String,Object>> list = new ArrayList<>();
			 int beginRow = (currentPage - 1) * rowPerPage;
			this.goodsDao = new GoodsDao();
			
				try{conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
				
				list = goodsDao.selectCustomerNewGoodsListByPage(conn , rowPerPage,beginRow);
				
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
	
	
	 public List<Map<String,Object>> selectCustomerHighGoodsListByPage(int rowPerPage , int currentPage){
		 
			Connection conn = null;
			List<Map<String,Object>> list = new ArrayList<>();
			 int beginRow = (currentPage - 1) * rowPerPage;
			this.goodsDao = new GoodsDao();
			
				try{conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
				
				list = goodsDao.selectCustomerHighGoodsListByPage(conn , rowPerPage,beginRow);
				
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
	
	
	
	 public List<Map<String,Object>> selectCustomerRowGoodsListByPage(int rowPerPage , int currentPage){
		 
			Connection conn = null;
			List<Map<String,Object>> list = new ArrayList<>();
			 int beginRow = (currentPage - 1) * rowPerPage;
			this.goodsDao = new GoodsDao();
			
				try{conn = new DBUtil().getConnection();
				conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
				
				list = goodsDao.selectCustomerRowGoodsListByPage(conn , rowPerPage,beginRow);
				
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
	
	
	
	
	
	
	
	
 public List<Map<String,Object>> selectCustomerGoodsListByPage(int rowPerPage , int currentPage){
		 
		Connection conn = null;
		List<Map<String,Object>> list = new ArrayList<>();
		 int beginRow = (currentPage - 1) * rowPerPage;
		this.goodsDao = new GoodsDao();
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			list = goodsDao.selectCustomerGoodsListByPage(conn , rowPerPage,beginRow);
			
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
	
	
	public void addGoods(Goods goods , GoodsImg goodsImg) {
		Connection conn = null; 
		
		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);
			
			goodsDao = new GoodsDao();
			goodsImgDao = new GoodsImgDao();
			
		int goodsNo = goodsDao.insertGoods(conn, goods);  // goodsNo가 AI로 자동생성되어 DB입력
		if(goodsNo != 0) {
			goodsImg.setGoodsNo(goodsNo);
		
			if (goodsImgDao.insertGoodsImg(conn, goodsImg) == 0) {
				throw new Exception (); // 이미지 입력실패시 강제로 롤백(catch절 이동)
			}
		}
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	
	public Map<String,Object> getGoodsAndImgOne(int goodsNO){
		Connection conn = null;
		Map<String,Object> m = new HashMap<String,Object>();
		this.goodsDao = new GoodsDao();
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			 m = goodsDao.selectGoodsAndImgOne(conn , goodsNO);
			
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
			return m;
		
		
	}
	
	
	
	
	//5개
	public List<Goods> getGoodsListByPage(int rowPerPage , int currentPage){
		Connection conn = null;
		List<Goods> list = null;
		this.goodsDao = new GoodsDao();
		 int beginRow = (currentPage - 1) * rowPerPage;
		
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			 list = goodsDao.selectGoodsListByPage(conn, rowPerPage, beginRow);
			
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
	public int getGoodsAllCount() {
		Connection conn = null;
		int totalRow = 0;
		this.goodsDao =new GoodsDao();
		try{conn = new DBUtil().getConnection();
		conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
		
		
		totalRow = goodsDao.selectGoodsAllCount(conn);
		
	
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
	
	
	
	
	
	
}
