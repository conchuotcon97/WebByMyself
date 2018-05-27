package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class ProductDao {
	public ProductDao() {

	}

	public static ArrayList<Product> getListProduct() {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM product";
		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			ArrayList<Product> products = new ArrayList<>();
			while (rs.next()) {
				Product p = new Product();

				p.setProductCode(rs.getString("ProductCode"));
				p.setProductName(rs.getString("ProductName"));
				p.setProductDescription(rs.getString("ProductDescription"));
				p.setImageUrl(rs.getString("ProductImage"));
				p.setPrice(rs.getDouble("ProductPrice"));
				p.setCategoryId(rs.getString("CategoryId"));
				products.add(p);
				System.out.println(p);
			}
			return products;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}

	public static ArrayList<Product> getListProductByCategoryID(String categogyId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM product where CategoryId=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, categogyId);
			rs = ps.executeQuery();
			ArrayList<Product> products = new ArrayList<>();
			while (rs.next()) {
				Product p = new Product();

				p.setProductCode(rs.getString("ProductCode"));
				p.setProductName(rs.getString("ProductName"));
				p.setProductDescription(rs.getString("ProductDescription"));
				p.setImageUrl(rs.getString("ProductImage"));
				p.setPrice(rs.getDouble("ProductPrice"));
				p.setCategoryId(rs.getString("CategoryId"));
				products.add(p);
				System.out.println(p);
			}
			return products;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}

	public static boolean deleteProduct(String productCode) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		String query = "DELETE FROM product where ProductCode=?";
		int i;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, productCode);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		} finally {
			DBUtil.closePrepareStatement(ps);
			pool.freeConnection(con);
		}
		if (i > 0)
			return true;
		return false;
	}

	public static Product getProduct(String productCode) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM product where ProductCode=?";
		int i;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, productCode);
			rs = ps.executeQuery();
			Product p = new Product();
			while (rs.next()) {
				p.setProductCode(rs.getString("ProductCode"));
				p.setImageUrl(rs.getString("ProductImage"));
				p.setProductName(rs.getString("ProductName"));
				p.setProductDescription(rs.getString("ProductDescription"));
				p.setCategoryId(rs.getString("CategoryId"));
				p.setPrice(rs.getDouble("ProductPrice"));
			}
			return p;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
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
				pro.setProductName(rs.getString("ProductName"));
				pro.setProductDescription(rs.getString("ProductDescription"));
				pro.setCategoryId(categoryId);
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

	public static void updateProduct(String code, double price) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "Update product set ProductPrice=? where ProductCode=?";
		try {
			ps = con.prepareStatement(query);
			ps.setDouble(1, price);
			ps.setString(2, code);
			ps.executeUpdate();

			return;
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			DBUtil.closePrepareStatement(ps);
			pool.freeConnection(con);
		}
	}

	public static void insertProduct(Product p) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		String query = "Insert into product values(?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, p.getProductCode());
			ps.setString(2, p.getProductName());
			ps.setString(3, p.getProductDescription());
			ps.setString(4, p.getImageUrl());
			ps.setDouble(5, p.getPrice());
			ps.setString(6, p.getCategoryId());
			ps.executeUpdate();

			return;
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			DBUtil.closePrepareStatement(ps);
			pool.freeConnection(con);
		}
	}

	public static void main(String[] args) {
		getListProductByCategoryID("CG001");
		getListProduct().toString();
		updateProduct("P010", 666);
		deleteProduct("p1111");
	}

}
