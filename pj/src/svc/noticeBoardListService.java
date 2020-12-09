package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.noticeBoardDAO;
import vo.noticeBoardBean;

public class noticeBoardListService {

	public int getListCount() {		
		int listCount = 0;
		Connection con = getConnection();
		noticeBoardDAO noticeboardDAO = noticeBoardDAO.getInstance();
		noticeboardDAO.setConnection(con);
		listCount = noticeboardDAO.selectListCount();
		if(con!=null) close(con);
		return listCount;
		
	}

	public ArrayList<noticeBoardBean> getArticleList(int page, int limit) {
		ArrayList<noticeBoardBean> articleList = null;
		Connection con = getConnection();
		noticeBoardDAO noticeboardDAO = noticeBoardDAO.getInstance();
		noticeboardDAO.setConnection(con);
		articleList = noticeboardDAO.selectArticleList(page,limit);
		if(con!=null) close(con);
		return articleList;
		
	}

}
