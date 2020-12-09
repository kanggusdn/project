package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.noticeBoardDetailService;
import vo.ActionForward;
import vo.noticeBoardBean;

public class noticeBoardReplyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	ActionForward forward = new ActionForward();
	   		String nowPage = request.getParameter("page");
	   		int board_num=Integer.parseInt(request.getParameter("board_num"));
	   		noticeBoardDetailService noticeboardDetailService = new noticeBoardDetailService();
	   		noticeBoardBean article=noticeboardDetailService.getArticle(board_num);	
	   		request.setAttribute("article", article);
	   		request.setAttribute("page", nowPage);
	   		forward.setPath("/notice/notice_board_reply.jsp");
	   		return forward;
	   		
	}
	 
}