package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	// kiem tra Statement, PreparedStatement,ResultSet is null? Nếu là null you can
	// avoid NullpointerException by not calling close() method
	public static void closeStatement(Statement st) {
		try {
			if (st != null) {
				st.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public static void closePrepareStatement(Statement st) {
		try {
			if (st != null) {
				st.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
