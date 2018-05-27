package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.eclipse.persistence.internal.oxm.record.BinaryDataUnmarshalRecord;

import model.User;

public class UserDB {
	public static boolean insertUser(User user) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		String query = "Insert into user values(?,?,?,?)";
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, user.getId());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setBoolean(4, user.isUserRole());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			DBUtil.closePrepareStatement(ps);
			pool.freeConnection(con);
		}
		return false;
	}

	public static User login(String email, String pass) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "Select * from user where Email=?,Password=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			User u = new User();
			while (rs.next()) {
				u.setId(rs.getLong("UserId"));
				u.setEmail(rs.getString("Email"));
				u.setPassword(rs.getString("Password"));
				u.setUserRole(rs.getBoolean("UserRole"));
			}
			return u;

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePrepareStatement(ps);
			pool.freeConnection(con);
		}
		return null;
	}

}
