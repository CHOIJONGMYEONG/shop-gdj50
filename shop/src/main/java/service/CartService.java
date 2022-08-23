package service;

import java.sql.Connection;
import java.sql.SQLException;

import shop.repository.CartDao;
import shop.repository.DBUtil;
import shop.vo.Cart;

public class CartService {
	 public boolean addCart(Cart cart) {
			Connection conn = null;
			
			
			try{conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);// executeUpdate() 실행시 자동 커밋을 막음
			
			CartDao cartDao= new CartDao();
			cartDao.cartInsert(conn, cart);
			
		
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
