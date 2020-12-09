package svc;

import java.sql.Connection;
import dao.noticeBoardDAO;
import vo.noticeBoardBean;

import static db.JdbcUtil.*;
public class noticeBoardWriteProService {

	public boolean registArticle(noticeBoardBean noticeboardBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		noticeBoardDAO noticeboardDAO = noticeBoardDAO.getInstance();
		noticeboardDAO.setConnection(con);
		int insertCount = noticeboardDAO.insertArticle(noticeboardBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
