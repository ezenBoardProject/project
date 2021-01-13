package kr.co.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



import kr.co.domain.LoginDTO;




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
	public void CloseAll(ResultSet rs, Connection conn, PreparedStatement pstmt) {
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
	
	
	
	
	
	public LoginDTO login(LoginDTO loginDTO) {
		LoginDTO login = new LoginDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from mb_tbl where id = ? and pw = ?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginDTO.getId());
			pstmt.setString(2, loginDTO.getPw());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				login = new LoginDTO();
				login.setId(loginDTO.getId());
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseAll(rs, conn, pstmt);
		}
		return login;
	}
	public boolean loginCheck(LoginDTO dto) {
		boolean check = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from mb_tbl where id = ? and pw = ?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			rs = pstmt.executeQuery();
			check = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseAll(rs, conn, pstmt);
		}
		
		return check;
		
	}
	public String findId(String name, String email) {
		String id = null;
	
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select id from mb_tbl where name = ? and email = ?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseAll(rs, conn, pstmt);
		}
		
		
		return id;
	}
	public String findPw(String name, String email) {
		String pw = null;
	
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select pw from mb_tbl where name = ? and email = ?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString("pw");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseAll(rs, conn, pstmt);
		}
		
		
		return pw;
	}


}
