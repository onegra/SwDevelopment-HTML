package youtube;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.driver.OracleDriver;

	public class YoutubeDAO {
		private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
		private String user = "c##itbank";
		private String password = "it";
		
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		
		private Connection getConnection() throws Exception {
			Class.forName(OracleDriver.class.getName());
			Connection conn = DriverManager.getConnection(url, user, password);
			return conn;
		}
		
		private void close() {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (SQLException e) {}
		
}
	}
