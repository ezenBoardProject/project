package kr.co.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle11g");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insert(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO mb_tbl (id, name, email, pw, birth, tel)"
				+ " VALUES (?,?,?,?,?,?)";

		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPw());
			pstmt.setString(5, dto.getBirth());
			pstmt.setInt(6, dto.getTel());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
	}


	public MemberDTO idCheck(String id) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM mb_tbl WHERE id = ?";
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String pw = rs.getString("pw");
				String birth = rs.getString("birth");
				int tel = rs.getInt("tel");	
				
				dto = new MemberDTO(id, name, email, pw, birth, tel);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return dto;
	}

}
