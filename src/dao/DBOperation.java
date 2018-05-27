package dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Connection;

public class DBOperation {
	private Connection conn;

	public ResultSet getData(String sql) throws Exception {
		ResultSet rs = null;
		openConnection();
		Statement st = conn.createStatement();
		rs = st.executeQuery(sql);
		return rs;
	}

	public void openConnection() throws Exception {
		if (conn == null || conn.isClosed()) {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("connect database");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/personalweb", "root",
					"Yeudoibecon524@");
		}
	}

	public Connection getConnection() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/personalweb", "root",
					"Yeudoibecon524@");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		}
		return conn;
	}

	public void closeConnection() throws Exception {
		if (conn != null && !conn.isClosed()) {
			conn.close();
		}
	}

	public int updateData(String sql) throws Exception {
		int result = 0;
		openConnection();
		Statement st = conn.createStatement();
		result = st.executeUpdate(sql);
		closeConnection();
		return result;
	}

	public static void main(String[] args) throws Exception {
		DBOperation db = new DBOperation();
		Connection con = db.getConnection();
		if (con == null) {
			System.out.println("chua ket noi db");
		} else
			System.out.println("connected");

		ResultSet rs = db.getData("select* from product");
		String s = "";
		while (rs.next()) {
			s += rs.getInt("productID");
			s += rs.getString("productCode");
			s += rs.getString("productDescription");
			s += rs.getString("productImage");
			s += rs.getString("productPrice");
			s += "\n";

		}
		System.out.println(s);
	}
}
