package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPool {
	private static ConnectionPool pool = null;
//	private static DataSource dataSource = null;
	static Connection con=null;

	private ConnectionPool() {
//		 try {
//		 InitialContext ic = new InitialContext();
//		 dataSource = (DataSource) ic.lookup("java:comp/env/jdbc/personalweb");
//		 } catch (NamingException e) {
//		 System.out.println(e);
//		 }
	}

	public static synchronized ConnectionPool getInstance() {
		if (pool == null) {
			pool = new ConnectionPool();
		}
		return pool;
	}

	public Connection getConnection() {
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/personalweb", "root",
					"Yeudoibecon524@");
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		return con;
//		 try {
//		 return dataSource.getConnection();
//		 } catch (SQLException e) {
//		 System.out.println(e);
//		 return null;
//		 }
	}

	public void freeConnection(Connection c) {
		try {
			c.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
public static void main(String[] args) {
	ConnectionPool p= ConnectionPool.getInstance();
	Connection con= p.getConnection();
	if(con==null) System.out.println("khong connect");
	System.out.println("connect");
}
}
