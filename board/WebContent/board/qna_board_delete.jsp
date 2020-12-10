<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int board_num = (Integer) request.getAttribute("board_num");
String nowPage = (String) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
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
	<!-- 2020/12/8 글 삭제 시작 -->
	<section id="passForm" class="">
		<div class="container pt-4">
			<div class="text-center m-3">
				<form name="deleteForm"
					action="boardDeletePro.bo?board_num=<%=board_num%>" method="post">
					<input type="hidden" name="page" value="<%=nowPage%>" />
					<div class="form-col">
						<div class="form-group">
							<input name="BOARD_PASS" placeholder="글 비밀번호"
								class="form-control" type="password" id="BOARD_PASS"
								required="required" /> <input name="BOARD_DELETE"
								class="form-control" id="BOARD_DELETE" type="submit" value="삭제" />&nbsp;&nbsp;
							<input name="BOARD_RETURN" class="form-control" id="BOARD_RETURN"
								type="button" value="돌아가기" onClick="javascript:history.go(-1)" />
						</div>
					</div>
				</form>
			</div>
		</div>
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