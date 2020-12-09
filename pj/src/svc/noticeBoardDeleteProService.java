package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.noticeBoardDAO;

public class noticeBoardDeleteProService {

	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		noticeBoardDAO noticeboardDAO = noticeBoardDAO.getInstance();
		noticeboardDAO.setConnection(con);
		isArticleWriter = noticeboardDAO.isArticleBoardWriter(board_num, pass);
		close(con);
		return isArticleWriter;
		
	}

	public boolean removeArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		noticeBoardDAO noticeboardDAO = noticeBoardDAO.getInstance();
		noticeboardDAO.setConnection(con);
		int deleteCount = noticeboardDAO.deleteArticle(board_num);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
