package shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;

import shop.vo.Cart;


public class CartDao {
	public int cartInsert(Connection conn, Cart cart) throws Exception {
		int a = 0;

		String sql = "insert into cart (goods_no,customer_id,cart_quantity,update_date,create_date) values(?,?,?,now(),now())";

		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cart.getGoodsNo());
			stmt.setString(2, cart.getCustomerId());
			stmt.setInt(3, cart.getCartQuantity());

			a = stmt.executeUpdate();

		} finally {
			if (stmt != null) {
				stmt.close();
			}

		}

		return a;

	}
}
