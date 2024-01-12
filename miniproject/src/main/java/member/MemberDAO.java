package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setId(rs.getInt("id"));
		dto.setUserid(rs.getString("userid"));
		dto.setUserpw(rs.getString("userpw"));
		dto.setUsername(rs.getString("username"));
		dto.setEmail(rs.getString("email"));
		dto.setGender(rs.getString("gender"));
		dto.setpNum(rs.getString("pNum"));
		dto.setIsAdmin(rs.getInt("isAdmin"));
		dto.setDeleted(rs.getInt("deleted"));
		dto.setAge(rs.getInt("age"));
		return dto;
	}
	
	// 로그인
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = null;
		String sql = "select * from member where userid = ? and userpw = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				login = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return login;
	}
	
	// 회원가입
	public int join(MemberDTO dto) {
		int row = 0;
		String sql = " insert into member "
				+ " (userid, userpw, username, gender, email, pNum, age) "
				+ " values (?, ?, ?, ?, ?, ?, ?)" ;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getpNum());
			pstmt.setInt(7, dto.getAge());
			row = pstmt.executeUpdate();
			System.out.println(row);
		} catch (SQLIntegrityConstraintViolationException e) {
			// 중복되는 id가 있을때
			row = -2;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	// 회원 삭제처리
	public int delete(MemberDTO dto) {
		int row = 0;
		String sql = "update member set deleted = 1 - deleted where userid = ?, userpw = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	// 회원정보 수정
	public int update(MemberDTO dto) {
		int row = 0;
		String sql = "update member set "
				+ "userid = ?, userpw = ?, username = ?, gender = ?, email = ? "
				+ "pNum = ?, isAdmin = ?, deleted = ?, age = ?"
				+ "where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getpNum());
			pstmt.setInt(7, dto.getIsAdmin());
			pstmt.setInt(8, dto.getDeleted());
			pstmt.setInt(9, dto.getAge());
			pstmt.setInt(10, dto.getId());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
}
