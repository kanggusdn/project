<%@ page language="java" contentType="text/html; charset=UTF-8"%>

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
	<!-- 2020/12/7 강현우 게시판 글 등록 시작 -->
	<section id="writeForm">
		<h2>ezCom 글 등록</h2>
			<form action="boardWritePro.bo" method="post"
			enctype="multipart/form-data" name="boardform">
		<div class="form-col">
			<div class="form-group col-md-2">
				<label for="BOARD_NAME">글쓴이</label> <input type="text"
					class="form-control" id="BOARD_NAME" name="BOARD_NAME" required="required" />
			</div>
			<div class="form-group col-md-2">
				<label for="BOARD_PASS">비밀번호</label> <input type="password"
					class="form-control" id="BOARD_PASS" name="BOARD_PASS" required="required" />
			</div>
			<div class="form-group col-md-2">
				<label for="BOARD_SUBJECT">제 목</label> <input type="text"
					class="form-control" id="BOARD_SUBJECT" name="BOARD_SUBJECT" required="required" />
			</div>
			<div class="form-group col-md-6">
				<label for="BOARD_CONTENT">내 용</label>
				<textarea class="form-control is-invalid" id="validationTextarea" name="BOARD_CONTENT"
					placeholder="내용을 적어 주세요." style="resize: none;" required></textarea>
			</div>
			<div class="form-group col-md-2">
				<label for="BOARD_FILE">파일 첨부</label> <input type="file"
					class="form-control" name="BOARD_FILE" id="BOARD_FILE" />
			</div>
		</div>
		<button type="submit" class="btn btn-primary">글 등록</button>
		<button type="reset" class="btn btn-info">다시 쓰기</button>
	</form>
	</section>
	<!-- 게시판 글 등록 끝 -->
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