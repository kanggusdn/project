<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article = (BoardBean) request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
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
	<!-- 2020/12/8 강현우 글 수정 시작 -->
	<div class="container w-50">
		<section id="writeForm">
		<div class = "text-center mb-3">
			<h2>ezCom 글 수정</h2>
			</div>
			<form action="boardModifyPro.bo" method="post" name="modifyform">
				<input type="hidden" name="BOARD_NUM"
					value="<%=article.getBOARD_NUM()%>" />
				<div class="form-col">
					<div class="form-group ">
						<input type="hidden" name="page"
							value="<%=request.getParameter("page")%>" /> <label
							for="BOARD_NAME">글쓴이</label> <input type="text"
							class="form-control" id="BOARD_NAME" name="BOARD_NAME"
							required="required" value="<%=article.getBOARD_NAME()%>" />
					</div>
				</div>
				<div class="form-group">
					<label for="BOARD_PASS">비밀번호</label> <input type="password"
						class="form-control" id="BOARD_PASS" name="BOARD_PASS"
						required="required" />
				</div>
				<div class="form-group">
					<label for="BOARD_SUBJECT">제 목</label> <input type="text"
						class="form-control" id="BOARD_SUBJECT" name="BOARD_SUBJECT"
						value="<%=article.getBOARD_SUBJECT()%>" required="required" />
				</div>
				<div class="form-group">
					<label for="BOARD_CONTENT">내 용</label>
					<textarea class="form-control is-invalid" id="validationTextarea"
						name="BOARD_CONTENT" placeholder="내용을 적어 주세요." cols="40" rows="15"
						style="resize: none;" required><%=article.getBOARD_CONTENT()%></textarea>
				</div>
				<section id="commandCell">
					<a class="btn btn-primary" href="javascript:modifyboard()"
						role="button">수정</a>&nbsp;&nbsp; <a class="btn btn-primary"
						href="javascript:history.go(-1)" role="button">뒤로</a>
				</section>
			</form>
		</section>
	</div>
	<!-- 글 수정 끝 -->
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