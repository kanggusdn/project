package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.BoardBean;

public class BoardDAO {
	DataSource ds;
	Connection conn;
	private static BoardDAO boardDAO;
	
	private BoardDAO() {
	}
	
	public static BoardDAO getInstance() {
		if(boardDAO == null) boardDAO = new BoardDAO();
		return boardDAO;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
				
			}
		} catch (Exception e) {
			System.out.println("getListCount 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<BoardBean> selectArticleList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "select * from board order by board_re_ref desc, board_re_seq asc limit ?, ?";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startRow = (page - 1) * 10;
		
		try {
			pstmt = conn.prepareStatement(board_list_sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("board_num"));
				board.setBOARD_NAME(rs.getString("board_name"));
				board.setBOARD_SUBJECT(rs.getString("board_subject"));
				board.setBOARD_CONTENT(rs.getString("board_content"));
				board.setBOARD_FILE(rs.getString("board_file"));
				board.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				board.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				board.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				board.setBOARD_READCOUNT(rs.getInt("board_readcount"));
				board.setBOARD_DATE(rs.getDate("board_date"));
				articleList.add(board);
			}
		} catch (Exception e) {
			System.out.println("getBoardList 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
	public BoardBean selectArticle(int board_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;
		
		try {
			pstmt = conn.prepareStatement("select * from board where board_num = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardBean = new BoardBean();
				boardBean.setBOARD_NUM(rs.getInt("board_num"));
				boardBean.setBOARD_NAME(rs.getString("board_name"));
				boardBean.setBOARD_SUBJECT(rs.getString("board_subject"));
				boardBean.setBOARD_CONTENT(rs.getString("board_content"));
				boardBean.setBOARD_FILE(rs.getString("board_file"));
				boardBean.setBOARD_RE_REF(rs.getInt("board_re_ref"));
				boardBean.setBOARD_RE_LEV(rs.getInt("board_re_lev"));
				boardBean.setBOARD_RE_SEQ(rs.getInt("board_re_seq"));
				boardBean.setBOARD_READCOUNT(rs.getInt("board_readcount"));
				boardBean.setBOARD_DATE(rs.getDate("board_date"));
			}
		}catch (Exception e) {
			System.out.println("getDetail 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return boardBean;
	}
	
	public int insertArticle(BoardBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		
		try {
			pstmt = conn.prepareStatement("select max(board_num) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) num = rs.getInt(1) + 1;
			else num = 1;
			
			sql = "insert into board values (?,?,?,?,?,?,?,?,?,?,now())";
			if(rs != null) close(rs);
			if(pstmt != null) close(pstmt);

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setString(6, article.getBOARD_FILE());
			pstmt.setInt(7,  num);
			pstmt.setInt(8,  0);
			pstmt.setInt(9,  0);
			pstmt.setInt(10,  0);
			
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("boardInsert 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	public int updateReadCount(int board_num) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update board set board_readcount = board_readcount + 1 where board_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			updateCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("setReadCountUpdate 에러: " + e);
		} finally {
			if(pstmt != null) close(pstmt);
		}
		
		return updateCount;
	}

	public int insertReplyArticle(BoardBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql = "select max(board_num) from board";
		String sql = "";
		int num = 0;
		int insertCount = 0;
		int re_ref = article.getBOARD_RE_REF();
		int re_lev = article.getBOARD_RE_LEV();
		int re_seq = article.getBOARD_RE_SEQ();
		
		try {
			pstmt = conn.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next()) num = rs.getInt(1) + 1;
			else num = 1;
			if(rs != null) close(rs);
			if(pstmt != null) close(pstmt);

			sql = "update board set board_re_seq=board_re_seq+1 where board_re_ref=? and board_re_seq>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			int updateCount = pstmt.executeUpdate();
			
			if(updateCount > 0) commit(conn);
			re_seq = re_seq + 1;
			re_lev = re_lev + 1;
			sql = "insert into board values (?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setString(6, "");
			pstmt.setInt(7,  re_ref);
			pstmt.setInt(8,  re_lev);
			pstmt.setInt(9,  re_seq);
			pstmt.setInt(10,  0);
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardReply 에러: " + e);
		} finally {
			if(pstmt != null) close(pstmt);
		}
		
		return insertCount;
	}

	public boolean isArticleBoardWriter(int board_num, String pass) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql = "select board_pass from board where board_num=?";
		boolean isWriter = false;
		
		try {
			pstmt = conn.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(pass.equals(rs.getString("board_pass"))) {
					isWriter = true;
				}
			}
		} catch (SQLException e) {
			System.out.println("isBoardWriter 에러: " + e);
		} finally {
			if(pstmt != null) close(pstmt);
		}
		
		return isWriter;
	}

	public int updateArticle(BoardBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update board set board_subject=?, board_content=? where board_num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_SUBJECT());
			pstmt.setString(2, article.getBOARD_CONTENT());
			pstmt.setInt(3, article.getBOARD_NUM());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardModify 에러: " + e);
		} finally {
			if(pstmt != null) close(pstmt);
		}
		
		return updateCount;
	}

	public int deleteArticle(int board_num) {
		PreparedStatement pstmt = null;
		String board_delete_sql = "delete from board where board_num=?";
		int deleteCount = 0;
		
		try {
			pstmt = conn.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardDelete 에러: " + e);
		} finally {
			if(pstmt != null) close(pstmt);
		}
		
		return deleteCount;
	}
}
