package bugs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;	

public class BugsDAO {
	//�̱���
	private static BugsDAO instance = new BugsDAO();
	public static BugsDAO getInstance() {
		return instance;
	}
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init; //context.xml���� �ۼ��� �������� ��ü�� �����ϴ� �����̳�
	private DataSource ds; //���� Ŀ�ؼ��� �����ϴ� datasource��ü
	//Ŀ�ؼ�Ǯ : ��û�� ���� �� ���� ���ο� Ŀ�ؼ��� �������� ���� 
	// �̸� ����� ����� ��ŭ�� Ŀ�ؼ��� �����صΰ�, �������鼭 ����ϱ� ���ؼ�
	
	public BugsDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("������ �̸��� ��ü�� ã�� �� �����ϴ�: " + e);
		}finally {
			if(conn != null) try{conn.close();}catch (SQLException e) {}
		}
	}
		
		private void close() {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {}
				// TODO: handle exception
			}
		//mapping
		private BugsDTO mapping (ResultSet rs) throws SQLException {
			BugsDTO dto = new BugsDTO();
			dto.setId(rs.getInt("id"));
			dto.setArtist_name(rs.getString("artist_name"));
			dto.setArtist_img(rs.getString("artist_img"));
			dto.setAlbum_name(rs.getString("album_name"));
			dto.setAlbum_img(rs.getString("album_img"));
			dto.setName(rs.getString("name"));
			dto.setPlayTime(rs.getInt("playTime"));
			dto.setLyrics(rs.getString("lyrics"));
			dto.setIsTitle(rs.getInt("isTitle"));
			return dto;
		}
		
		//�����Լ�
			//List<BugsDTO> selectAll()
			//select * from bugs order by artist_name, id
		public List<BugsDTO> selectAll(String search) {
			ArrayList<BugsDTO> list = new ArrayList<>();
			String sql = "select * from bugs "
					+ "where name like '%' || ? || '%'"
					+ "or "
					+ "artist_name like '%' || ? || '%'"
					+ " order by artist_name, id";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
				pstmt.setString(2, search);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					list.add(mapping(rs));
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {close();}
			System.out.println("�ҷ��� ��� ����: " + list.size());
			return list;
			}
		
		public BugsDTO selectOne(int id) {
			BugsDTO dto = null;
			String sql = "select * from bugs where id = ?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					dto = mapping(rs);
					return dto;
				}
			}catch (SQLException e) {
				e.printStackTrace();
			} finally {close();}
			return dto;
		}
		
		public int delete(int id) {
			int row = 0;
			String sql = "delete from bugs where id = ?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				row = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {close();}
			return row;
		}
	
}
