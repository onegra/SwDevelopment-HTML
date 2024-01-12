package works;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class WorksDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static WorksDAO instance = new WorksDAO();
	public static WorksDAO getInstance() {
		return instance;
	}
	
	private WorksDAO() {
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
	
	private WorksDTO mapping(ResultSet rs) throws SQLException {
		WorksDTO dto = new WorksDTO();
		dto.setId(rs.getInt("id"));
		dto.setTitle(rs.getString("title"));
		dto.setWriter(rs.getString("writer"));
		dto.setGenre(rs.getString("genre"));
		dto.setContent(rs.getString("content"));
		dto.setUploadDate(rs.getDate("uploadDate"));
		dto.setShowDate(rs.getDate("showDate"));
		dto.setViewCount(rs.getInt("viewCount"));
		dto.setAgeLimit(rs.getInt("ageLimit"));
		dto.setDeleted(rs.getInt("deleted"));
		dto.setPrice(rs.getInt("price"));
		dto.setArea(rs.getString("area"));
		dto.setImage(rs.getString("image"));
		return dto;
	}
	//단일 공연
	public List<WorksDTO> selectList(String search) {
		ArrayList<WorksDTO> list = new ArrayList<>();
		String sql = "select * from works where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return list;
	}
	//공연 목록
	//공연 게시글 개수
	//공연추가
	//공연삭제
	//공연수정
	}
