package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.noticeBoardDAO;
import vo.noticeBoardBean;

public class noticeBoardReplyProService {

	public boolean replyArticle(noticeBoardBean article) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isReplySuccess = false;
		int insertCount = 0;
		Connection con = getConnection();
		noticeBoardDAO noticeboardDAO = noticeBoardDAO.getInstance();
		noticeboardDAO.setConnection(con);
		insertCount = noticeboardDAO.insertReplyArticle(article);
		
		if(insertCount > 0){
			commit(con);
			isReplySuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
		
	}

}
