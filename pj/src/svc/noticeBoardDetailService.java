package svc;

import java.sql.Connection;
import dao.noticeBoardDAO;
import vo.noticeBoardBean;

import static db.JdbcUtil.*;

public class noticeBoardDetailService {

	public noticeBoardBean getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		noticeBoardBean article = null;
		Connection con = getConnection();
		noticeBoardDAO noticeboardDAO = noticeBoardDAO.getInstance();
		noticeboardDAO.setConnection(con);
		int updateCount = noticeboardDAO.updateReadCount(board_num);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = noticeboardDAO.selectArticle(board_num);
		close(con);
		return article;
		
	}

}
