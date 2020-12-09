package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.noticeBoardReplyProService;
import vo.ActionForward;
import vo.noticeBoardBean;

public class noticeBoardReplyProAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 
		 	ActionForward forward = null;
		    String nowPage = request.getParameter("page");
		 	noticeBoardBean article = new noticeBoardBean();  		
		 	article.setBoard_total(Integer.parseInt(request.getParameter("BOARD_total")));
		 	article.setBoard_subject(request.getParameter("BOARD_SUBJECT"));	   		
		 	noticeBoardReplyProService noticeboardReplyProService = new noticeBoardReplyProService();
		 	boolean isReplySuccess = noticeboardReplyProService.replyArticle(article);
		 	
	   		if(isReplySuccess){
	   			forward = new ActionForward();
	   			forward.setRedirect(true);
	   			forward.setPath("noticeboardList.bo?page=" + nowPage);
	   		}
	   		else{
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('답장 실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
	   		}
	   		
	   		return forward;
	   		
	}  	
	 
}