package kr.co.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.ezen.LoginDTO;
import kr.co.ezen.MemberDTO;

public class MemberDAO {
	
	private DataSource dataFactory;
	
	public MemberDAO() {
		
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle11g");
			
		} catch (NamingException e) {
			
			e.printStackTrace();
		}
		
	}
	
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		
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

	public MemberDTO updateui(String id) {
		
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT name, pw, email, to_char(birth, 'yyyy-mm-dd') birth, tel FROM mb_tbl WHERE id = ? ";
		
		try {
			
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				String birth = rs.getString("birth");
				int tel = rs.getInt("tel");
				
				dto = new MemberDTO(id, name, email, pw, birth, tel);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return dto;
	}

	public void update(MemberDTO dto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE mb_tbl SET name = ?, pw = ?, email = ?, birth = ?, tel = ? WHERE id = ?";
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getBirth());
			pstmt.setInt(5, dto.getTel());
			pstmt.setString(6, dto.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
	}

	public void insert(MemberDTO dto) {
		
		Connection conn = null;
 		PreparedStatement pstmt = null;
 		String sql = "INSERT INTO mb_tbl (id, name, email, pw, birth, tel) VALUES (?,?,?,?,?,?)";

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
 		}finally {
 			closeAll(null, pstmt, conn);
 		}
		
	}
	
	

	public MemberDTO read(String id) {
		
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id, name, email, to_char(birth, 'yyyy-mm-dd') birth, pw, tel FROM mb_tbl WHERE id = ? ";
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				int tel = rs.getInt("tel");
				
				dto = new MemberDTO(id, name, email, pw, birth, tel);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	
	public void delete(String id) {

 		Connection conn = null;
 		PreparedStatement pstmt = null;
 		
 		String sql = "DELETE FROM mb_tbl WHERE id=?";

 		try {
 			
 			conn = dataFactory.getConnection();
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, id);

 			pstmt.executeUpdate();
 			
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			closeAll(null, pstmt, conn);
 		}
 	}
	
	
	
	public int loginCheck(String id, String pw) {
 		
		int i = -1;
 		
		Connection conn = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs =null;
 		String sql = "select * from mb_tbl where id = ?";
 		String dbpw = "";
 		
 		try {
 			conn = dataFactory.getConnection();
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, id);
 			rs = pstmt.executeQuery();
 			if (rs.next()) {
 				
 				dbpw = rs.getString("password");
 				
 				if (dbpw.equals(pw)) {
 					i = 1;
 				} else {
 					i = 0;
 				}
 				
 			}else {
 				i = -1;
 			}
 			
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			closeAll(rs, pstmt, conn);
 		}
 		
 		return i;
 	}

	public LoginDTO login(LoginDTO loginDTO) {
		
		LoginDTO result = new LoginDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM mb_tbl WHERE id = ? AND pw = ? ";
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, loginDTO.getId());
			pstmt.setString(2, loginDTO.getPw());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				String name = rs.getString("name");
				
				result = new LoginDTO();
				
				result.setId(loginDTO.getId());
				result.setPw(loginDTO.getPw());
				result.setName(name);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		
		
		return result;
	}

	public MemberDTO idCheck(String id) {
		
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM mb_tbl WHERE id = ? ";
		
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				
				dto = new MemberDTO(id, name, email, pw, birth, 0);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		
		return dto;
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
 			closeAll(rs, pstmt, conn);
 		}

 		return check;
	}

	public List<MemberDTO> list() {
		
		List<MemberDTO> list = new ArrayList<MemberDTO>();

 		Connection conn = null;
 		PreparedStatement pstmt = null;
 		String sql = "SELECT * FROM mb_tbl";
 		ResultSet rs = null;

 		try {
 			conn = dataFactory.getConnection();
 			pstmt = conn.prepareStatement(sql);
 			rs = pstmt.executeQuery();

 			while (rs.next()) {
 				String id = rs.getString("id");
 				String name = rs.getString("name");
 				String email = rs.getString("email");
 				String pw = rs.getString("pw");
 				String birth = rs.getString("birth");
 				int tel = rs.getInt("tel");

 				MemberDTO dto = new MemberDTO(id, name, email, pw, birth, tel);
 				list.add(dto);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			closeAll(rs, pstmt, conn);
 		}
 		return list;
	}


}
