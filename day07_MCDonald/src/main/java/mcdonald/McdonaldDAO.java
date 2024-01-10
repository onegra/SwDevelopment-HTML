package mcdonald;

import java.sql.*;
import java.util.*;
import oracle.jdbc.driver.OracleDriver;
public class McdonaldDAO {
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//getConnection
	private Connection getConnection() throws Exception {
		Class.forName(OracleDriver.class.getName());
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
	
	//close
	private void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch (SQLException e) {}
	}
	//mapping
	private McdonaldDTO mapping(ResultSet rs) throws SQLException {
		McdonaldDTO dto = new McdonaldDTO();
		dto.setCategory(rs.getString("category"));
		dto.setIdx(rs.getInt("idx"));
		dto.setImgName(rs.getString("imgName"));
		dto.setMemo(rs.getString("memo"));
		dto.setName(rs.getString("name"));
		dto.setPrice(rs.getInt("price"));
		return dto;
	}
	//전체목록 (select * from mcdonald)
	public List<McdonaldDTO>selectList() {
		ArrayList<McdonaldDTO> list = new ArrayList<>();
		String sql ="select * from mcdonald";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return list;
			
		}
	//카테고리별 목록 (select * from mdonald where category = ?)
	public List<McdonaldDTO> selectListByCategory(String category) {
		ArrayList<McdonaldDTO> list = new ArrayList<>();
		String sql ="select * from mcdonald where category = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return list;
	}
	//단일조회 (select * from mcdonald where idx = ?)
	public McdonaldDTO selectOne(int idx) {
		String sql ="select * from mdonald where idx = ?";
		McdonaldDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return dto;
	}
	//추가 (insert into mcdonald (category, name, price, imgName, memo) values (?, ?, ?, ?))
	public int insert(McdonaldDTO dto) {
		int row = 0;
		String sql = "insert into mcdonald (category, name, price, imgName, memo) values (?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getImgName());
			pstmt.setString(5, dto.getMemo());
			row = pstmt.executeUpdate();
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return row;
	}
	//삭제
	public int delete(int idx) {
		int row = 0;
		String sql ="delete mdonald where idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return row;
	}
	
	public int selectCurrSeq() {
		int idx = 0;
		String sql ="select max(idx) from";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				idx = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return idx;
	}
	
}
