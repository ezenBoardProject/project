package kr.co.dao;

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

import kr.co.domain.BoardDTO;

public class BoardDAO {
	private DataSource dataFactory;

	public BoardDAO() {
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

	public BoardDTO bd_read(int num) {
		BoardDTO dto = null;
	
		Connection conn = null;
		PreparedStatement pstmt = null;	
		String sql = "SELECT * FROM bd_tbl WHERE num = ?";	
		ResultSet rs = null;
	
		boolean isOk = false;
	

		try {
			conn = dataFactory.getConnection();
			conn.setAutoCommit(false);

			increaseReadcnt(conn, num);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readcnt = rs.getInt("readcnt");

				dto = new BoardDTO(id, num, title, content, writeday, readcnt, -1, -1, -1);
			}

			isOk = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (isOk) {
					conn.commit();
				} else {
					conn.rollback();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			closeAll(rs, pstmt, conn);
		}
		return dto;

	}

	private void increaseReadcnt(Connection conn, int num) {
		PreparedStatement pstmt = null;
		String sql = "UPDATE bd_tbl SET readcnt = readcnt + 1 WHERE num = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}

	}

	public BoardDTO bd_updateui(int num) {
		BoardDTO dto = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM bd_tbl WHERE num = ?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeday = rs.getString("writeday");
				int readcnt = rs.getInt("readcnt");
				int repRoot = rs.getInt("repRoot");
				int repStep = rs.getInt("repStep");
				int repIndent = rs.getInt("repIndent");

				dto = new BoardDTO(id, num, title, content, writeday, readcnt, repRoot, repStep, repIndent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			closeAll(rs, pstmt, conn);
		}
		return dto;
	}

	public void bd_update(BoardDTO dto) {
	     Connection conn = null;
	      PreparedStatement pstmt = null;
	      String sql = "UPDATE bd_tbl SET title = ?, id = ?, "
	            + "content=?, writeday=sysdate WHERE num=?";
	      try {
	         conn = dataFactory.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getTitle());
	         pstmt.setString(2, dto.getId());
	         pstmt.setString(3, dto.getContent());
	         pstmt.setInt(4, dto.getNum());
	         
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         closeAll(null, pstmt, conn);
	      }

	}
	   public List<BoardDTO> list() {
		      List<BoardDTO> list = new ArrayList<BoardDTO>();
		      
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      String sql = "SELECT num, author, title, "
		            + "to_char(writeday, 'yyyy/mm/dd') writeday, "
		            + "readcnt, repRoot, repStep, repIndent  "
		            + "FROM bd_tbl "
		            + "ORDER BY repRoot desc, repStep asc";
		      ResultSet rs = null;
		      
		      try {
		         conn = dataFactory.getConnection();
		                  
		         pstmt = conn.prepareStatement(sql);
		         rs = pstmt.executeQuery();
		         
		         while (rs.next()) {
		        	String id = rs.getString("id");
		            int num = rs.getInt("num");
		            String title = rs.getString("title");
		            String writeday = rs.getString("writeday");
		            int readcnt = rs.getInt("readcnt");
		            int repRoot = rs.getInt("repRoot");
		            int repStep = rs.getInt("repStep");
		            int repIndent = rs.getInt("repIndent");
		            
		            BoardDTO dto = new BoardDTO(id, num, title, null, writeday, readcnt, repRoot, repStep, repIndent);
		            list.add(dto);
		         }
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         closeAll(rs, pstmt, conn);
		      }
		      
		      return list;
		   }

	public void insert(BoardDTO dto) {
		Connection conn = null;
	      PreparedStatement pstmt = null;
	      String sql = "INSERT INTO bd_tbl (id, num, title, content, repRoot, repStep, repIndent) VALUES(?,?,?,?,?,?,?)";
	      
	      try {
	         conn = dataFactory.getConnection();
	         int num = getNum(conn);
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getId());
	         pstmt.setInt(2, num);
	         pstmt.setString(3, dto.getTitle());
	         pstmt.setString(4, dto.getContent());
	         pstmt.setInt(5, num);
	         pstmt.setInt(6, 0);
	         pstmt.setInt(7, 0);
	         
	         pstmt.executeUpdate();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         closeAll(null, pstmt, conn);
	      }
	   }

	private int getNum(Connection conn) {
		  int num = -1;
	      PreparedStatement pstmt = null;
	      String sql = "SELECT NVL2(MAX(num), MAX(num)+1, 1) FROM bd_tbl";
	      ResultSet rs = null;
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            num = rs.getInt(1);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         closeAll(rs, pstmt, null);
	      }
	      
	      return num;
	}
}
