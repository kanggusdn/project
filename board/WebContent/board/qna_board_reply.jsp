<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
<style type="text/css">
	input::-webkit-input-placeholder{
  text-align:center;
}
</style>
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
	<!-- 2020/12/8 강현우 게시판 글 답변 -->
	<div class = "container text-left w-50">
	<section id="writeForm">
	<div class = "text-center mb-3">
		<h2>ezCOM 댓글 달기</h2>
		</div>
		<form action="boardReplyPro.bo" method="post" name="boardform">
			<input type="hidden" name="page" value="<%=nowPage%>" /> <input
				type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM()%>">
			<input type="hidden" name="BOARD_RE_REF"
				value="<%=article.getBOARD_RE_REF()%>"> <input type="hidden"
				name="BOARD_RE_LEV" value="<%=article.getBOARD_RE_LEV()%>">
			<input type="hidden" name="BOARD_RE_SEQ"
				value="<%=article.getBOARD_RE_SEQ()%>">
			<div class="form-col">
				<div class="form-group d-block">
					<input placeholder="글쓴이" type="text"  class = "w-100"
						name="BOARD_NAME" id="BOARD_NAME" />
				</div>
				<div class="form-group d-block">
					<input placeholder="비밀번호" name="BOARD_PASS" class = "w-100"
						type="password" id="BOARD_PASS" />
				</div>
				<div class="form-group">
					<input placeholder="제목" name="BOARD_SUBJECT"  type="text" id="BOARD_SUBJECT" class = "w-100" />
				</div>
				<div class="form-group text-center">
					<textarea class="form-control is-invalid" id="validationTextarea"
						name="BOARD_CONTENT" placeholder="내용을 적어 주세요." cols="40" rows="15"
						style="resize: none;"></textarea>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">댓글 등록</button>
			<button type="reset" class="btn btn-info">다시 작성</button>
			<a class="btn btn-primary"	href="javascript:history.go(-1)" role="button">뒤로</a>
		</form>
	</section>
	</div>
	<!-- 글 답변 끝 -->
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