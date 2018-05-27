package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.Product;

public class CategoryDAO {
	public static List<Category> getCategorys() {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from category";

		try {
			List<Category> list = new ArrayList<>();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Category c = new Category();
				c.setId(rs.getString("CategoryId"));
				c.setCategoryName(rs.getString("CategoryName"));
				list.add(c);
			}
			return list;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePrepareStatement(ps);
			pool.freeConnection(con);
		}
	}

	public static List<Product> getProducts(String categoryId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from product where CategoryId=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, categoryId);
			rs = ps.executeQuery();
			List<Product> products = new ArrayList<>();
			while (rs.next()) {
				Product pro = new Product();
				pro.setProductCode(rs.getString("ProductCode"));
				pro.setProductName(rs.getString("ProductDescription"));
				pro.setImageUrl(rs.getString("ProductImage"));
				pro.setPrice(rs.getDouble("ProductPrice"));
				products.add(pro);
			}
			return products;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePrepareStatement(ps);
			pool.freeConnection(con);
		}
	}


}
