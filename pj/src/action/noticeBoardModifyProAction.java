package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.noticeBoardModifyProService;
import vo.ActionForward;
import vo.noticeBoardBean;

public class noticeBoardModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		boolean isModifySuccess = false;
		int board_num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		noticeBoardBean article=new noticeBoardBean();
		noticeBoardModifyProService noticeboardModifyProService = new noticeBoardModifyProService();
		boolean isRightUser=noticeboardModifyProService.isArticleWriter(board_num, request.getParameter("BOARD_PASS"));

		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			article.setBoard_total(board_num);
			article.setBoard_subject(request.getParameter("BOARD_SUBJECT"));
			isModifySuccess = noticeboardModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("noticeboardDetail.bo?board_num="+article.getBoard_total() + "&page=" + request.getParameter("page")); 
			}

		}

		return forward;
	}

}