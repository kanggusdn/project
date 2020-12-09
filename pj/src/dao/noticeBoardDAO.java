package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.noticeBoardBean;

public class noticeBoardDAO {
	DataSource ds;
	Connection conn;
	private static noticeBoardDAO noticeboardDAO;
	
	private noticeBoardDAO() {
	}
	
	public static noticeBoardDAO getInstance() {
		if(noticeboardDAO == null) noticeboardDAO = new noticeBoardDAO();
		return noticeboardDAO;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select count(*) from notice");
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
	
	public ArrayList<noticeBoardBean> selectArticleList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "select * from notice order by board_re_ref desc, board_re_seq asc limit ?, ?";
		ArrayList<noticeBoardBean> articleList = new ArrayList<noticeBoardBean>();
		noticeBoardBean board = null;
		int startRow = (page - 1) * 10;
		
		try {
			pstmt = conn.prepareStatement(board_list_sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new noticeBoardBean();
				board.setBoard_total(rs.getInt("board_total"));
				board.setBoard_subject(rs.getString("board_subject"));
				board.setBoard_readcount(rs.getInt("board_readcount"));
				board.setBoard_date(rs.getDate("board_date"));
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
	
	public noticeBoardBean selectArticle(int board_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		noticeBoardBean noticeboardBean = null;
		
		try {
			pstmt = conn.prepareStatement("select * from notice where board_num = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				noticeboardBean = new noticeBoardBean();
				noticeboardBean.setBoard_total(rs.getInt("board_total"));
				noticeboardBean.setBoard_subject(rs.getString("board_subject"));
				noticeboardBean.setBoard_readcount(rs.getInt("board_readcount"));
				noticeboardBean.setBoard_date(rs.getDate("board_date"));
			}
		}catch (Exception e) {
			System.out.println("getDetail 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return noticeboardBean;
	}
	
	public int insertArticle(noticeBoardBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		
		try {
			pstmt = conn.prepareStatement("select max(board_num) from notice");
			rs = pstmt.executeQuery();
			
			if(rs.next()) num = rs.getInt(1) + 1;
			else num = 1;
			
			sql = "insert into notice values (?,?,?,?,?,?,?,?,?,?,now())";
			if(rs != null) close(rs);
			if(pstmt != null) close(pstmt);

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  num);
			pstmt.setString(2, article.getBoard_subject());
			pstmt.setInt(3,  num);
			pstmt.setInt(4,  0);
			
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
		String sql = "update notice set board_readcount = board_readcount + 1 where board_num = ?";
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

	public int insertReplyArticle(noticeBoardBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql = "select max(board_num) from notice";
		String sql = "";
		int num = 0;
		int insertCount = 0;
		
		try {
			pstmt = conn.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if(rs.next()) num = rs.getInt(1) + 1;
			else num = 1;
			if(rs != null) close(rs);
			if(pstmt != null) close(pstmt);

			sql = "update notice set board_re_seq=board_re_seq+1 where board_re_ref=? and board_re_seq>?";
			pstmt = conn.prepareStatement(sql);
			int updateCount = pstmt.executeUpdate();
			
			if(updateCount > 0) commit(conn);
			sql = "insert into notice values (?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBoard_subject());
			pstmt.setString(3, "");
			pstmt.setInt(4,  num);
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
		String board_sql = "select board_pass from notice where board_num=?";
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

	public int updateArticle(noticeBoardBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update notice set board_subject=?, board_content=? where board_num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getBoard_subject());
			pstmt.setInt(3, article.getBoard_total());
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
		String board_delete_sql = "delete from notice where board_num=?";
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
