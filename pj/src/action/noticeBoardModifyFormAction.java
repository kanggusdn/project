package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.noticeBoardDetailService;
import vo.ActionForward;
import vo.noticeBoardBean;

public class noticeBoardModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			noticeBoardDetailService noticeboardDetailService
			= new noticeBoardDetailService();	
		   	noticeBoardBean article =noticeboardDetailService.getArticle(board_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("/notice/notice_board_modify.jsp");
	   		return forward;
	   		
	 }
	 
}