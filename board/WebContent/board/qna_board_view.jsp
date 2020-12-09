<%@page import="vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%
	BoardBean article = (BoardBean) request.getAttribute("article");
String nowPage = (String) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- title image -->

<!-- reset -->
<link rel="stylesheet"
	href="https://meyerweb.com/eric/tools/css/reset/reset.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<!-- text -->
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>

<body>
	<!-- 2020/12/8 게시판 상세보기 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제 목 :
			<%=article.getBOARD_SUBJECT()%>
			첨부파일 :
			<%
			if (!(article.getBOARD_FILE() == null)) {
		%>
			<a href="file_down?downFile=<%=article.getBOARD_FILE()%>"> <%=article.getBOARD_FILE()%>
			</a>
			<%
				}
			%>
		</section>
		<section id="articleContentArea">
			<%=article.getBOARD_CONTENT()%>
		</section>
	</section>
	<section id="commandList">
		<a class="btn btn-primary" href="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM()%>&page=<%=nowPage%>" role="button">답변</a>&nbsp;&nbsp; 
		<a class="btn btn-primary" href="boardModifyForm.bo?board_num=<%=article.getBOARD_NUM()%>&page=<%=nowPage%>" role="button">수정</a>&nbsp;&nbsp;
		<a class="btn btn-primary" href="boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM()%>&page=<%=nowPage%>" role="button">삭제</a>&nbsp;&nbsp;
		<a class="btn btn-primary" href="boardList.bo?page=<%=nowPage%>" role="button">목록</a>&nbsp;&nbsp;
	</section>
	<!-- 상세보기 끝 -->
	<!-- Optional JavaScript -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
	<script src="js/header.js"></script>
	<script src="js/main.js"></script>
</body>
</html>