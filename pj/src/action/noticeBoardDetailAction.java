package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.noticeBoardDetailService;
import vo.ActionForward;
import vo.noticeBoardBean;

 public class noticeBoardDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		noticeBoardDetailService noticeboardDetailService = new noticeBoardDetailService();
		noticeBoardBean article = noticeboardDetailService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/notice/notice_board_view.jsp");
   		return forward;

	 }
	 
}