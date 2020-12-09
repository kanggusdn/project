package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.noticeBoardWriteProService;
import vo.ActionForward;
import vo.noticeBoardBean;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class noticeBoardWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		request.setCharacterEncoding("UTF-8");
		ActionForward forward=null;
		noticeBoardBean noticeboardBean = null;
		String realFolder="";
		String saveFolder="/boardUpload";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		noticeboardBean = new noticeBoardBean();
		noticeboardBean.setBoard_subject(multi.getParameter("BOARD_SUBJECT"));
		
		noticeBoardWriteProService noticeboardWriteProService = new noticeBoardWriteProService();
		boolean isWriteSuccess = noticeboardWriteProService.registArticle(noticeboardBean);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.html");
		}

		return forward;
		
	}  	
	
}