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
	<section id="writeForm">
		<h2>ezCOM 댓글 달기</h2>
		<form action="boardReplyPro.bo" method="post" name="boardform">
			<input type="hidden" name="page" value="<%=nowPage%>" /> <input
				type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM()%>">
			<input type="hidden" name="BOARD_RE_REF"
				value="<%=article.getBOARD_RE_REF()%>"> <input type="hidden"
				name="BOARD_RE_LEV" value="<%=article.getBOARD_RE_LEV()%>">
			<input type="hidden" name="BOARD_RE_SEQ"
				value="<%=article.getBOARD_RE_SEQ()%>">
			<div class="form-col">
				<div class="form-group col-md-2">
					<label for="BOARD_NAME">글쓴이</label> <input type="text"
						name="BOARD_NAME" id="BOARD_NAME" />
				</div>
				<div class="form-group col-md-2">
					<label for="BOARD_PASS">비밀번호</label> <input name="BOARD_PASS"
						type="password" id="BOARD_PASS" />
				</div>
				<div class="form-group col-md-2">
					<label for="BOARD_SUBJECT">제 목</label> <input name="BOARD_SUBJECT"
						type="text" id="BOARD_SUBJECT" />
				</div>
				<div class="form-group col-md-6">
					<label for="BOARD_CONTENT">내 용</label>
					<textarea class="form-control is-invalid" id="validationTextarea"
						name="BOARD_CONTENT" placeholder="내용을 적어 주세요." cols="40" rows="15"
						style="resize: none;"></textarea>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">댓글 등록</button>
			<button type="reset" class="btn btn-info">다시 작성</button>
		</form>
	</section>
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