<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	ArrayList<BoardBean> articleList = (ArrayList<BoardBean>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
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
	<!-- 2020/12/7 강현우 게시판 리스트 시작 -->

	<div id="main">
		<h2>ezCOM 게시판</h2>
		<br>
		<table class="table table-hover">
			<%
				if (articleList != null && listCount > 0) {
			%>
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
				<%
					for (int i = 0; i < articleList.size(); i++) {
				%>
				<tr>
					<td><%=articleList.get(i).getBOARD_NUM()%></td>

					<td>
						<%
							if (articleList.get(i).getBOARD_RE_LEV() != 0) {
						%> <%
 	for (int a = 0; a <= articleList.get(i).getBOARD_RE_LEV() * 2; a++) {
 %> &nbsp; <%
 	}
 %> ▶ <%
 	} else {
 %> <%
 	}
 %> <a
						href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
							<%=articleList.get(i).getBOARD_SUBJECT()%>
					</a>
					</td>

					<td><%=articleList.get(i).getBOARD_NAME()%></td>
					<td><%=articleList.get(i).getBOARD_DATE()%></td>
					<td><%=articleList.get(i).getBOARD_READCOUNT()%></td>
				</tr>
				<%
					}
				%>
			
		</table>
		<br>
		<button type="button" class="btn btn-info float-primary">
			<a href="boardWriteForm.bo">글쓰기</a>
		</button>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="boardList.bo?page=<%=nowPage - 1%>">이전</a></li>
				<li class="page-item"><a class="page-link"
					href="boardList.bo?page=<%=nowPage + 1%>">다음</a></li>
			</ul>
		</nav>
	</div>
	<%
		} else {
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
		}
	%>
	<!-- 게시판 리스트 끝 -->
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