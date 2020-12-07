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
	<!-- 게시판 등록 -->

	<section id="writeForm">
		<h2>게시판글수정</h2>
		<form action="boardModifyPro.bo" method="post" name="modifyform">
			<input type="hidden" name="BOARD_NUM"
				value="<%=article.getBOARD_NUM()%>" /> <input type="hidden"
				name="page" value="<%=request.getParameter("page")%>" />
			<table>
				<tr>
					<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
					<td class="td_right"><input type="text" name="BOARD_NAME"
						id="BOARD_NAME" value="<%=article.getBOARD_NAME()%>" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
					<td class="td_right"><input name="BOARD_PASS" type="password"
						id="BOARD_PASS" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_SUBJECT">제 목</label></td>
					<td class="td_right"><input name="BOARD_SUBJECT" type="text"
						id="BOARD_SUBJECT" value="<%=article.getBOARD_SUBJECT()%>" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_CONTENT">내 용</label></td>
					<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT"
							cols="40" rows="15"><%=article.getBOARD_CONTENT()%></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; <a
					href="javascript:history.go(-1)">[뒤로]</a>
			</section>
		</form>
	</section>
	<section id="writeForm">
		<h2>ezCom 글 등록</h2>
		<div class="form-col">
			<div class="form-group col-md-2">
				<label for="BOARD_NAME">글쓴이</label> <input type="text"
					class="form-control" id="BOARD_NAME" required="required" />
			</div>
			<div class="form-group col-md-2">
				<label for="BOARD_PASS">비밀번호</label> <input type="password"
					class="form-control" id="BOARD_PASS" required="required" />
			</div>
			<div class="form-group col-md-2">
				<label for="BOARD_SUBJECT">제 목</label> <input type="text"
					class="form-control" id="BOARD_SUBJECT" required="required" />
			</div>
			<div class="form-group col-md-6">
				<label for="BOARD_CONTENT">내 용</label>
				<textarea class="form-control is-invalid" id="validationTextarea"
					placeholder="내용을 적어 주세요." style="resize: none;" required></textarea>
			</div>
			<div class="form-group col-md-2">
				<label for="BOARD_FILE">파일 첨부</label> <input type="file"
					class="form-control" id="BOARD_FILE" />
			</div>
		</div>
		<button type="submit" class="btn btn-primary">글 등록</button>
		<button type="reset" class="btn btn-info">다시 쓰기</button>
	</section>
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