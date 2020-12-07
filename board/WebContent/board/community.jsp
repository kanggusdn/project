<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
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
	<div id="main">
		<h1>Hidden Page</h1>
		<hr>
		<br>
		<button type="button" class="btn btn-primary">전체글</button>
		<button type="button" class="btn btn-info">개념글</button>
		<button type="button" class="btn btn-info">공지</button>
		<br> <br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회</th>
					<th>추천</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>265121</td>
					<td>엌 아래글 진짜 관리자임?</td>
					<td>ㅇㅇ</td>
					<td>2020.04.23</td>
					<td>1000</td>
					<td>100</td>
				</tr>
				<tr>
					<td>265120</td>
					<td>본인 방금 추천 많이 받아서 개념글 상상함</td>
					<td>운영자</td>
					<td>2020.04.23</td>
					<td>7000</td>
					<td>150</td>
				</tr>
			</tbody>
		</table>

		<br> <br> <br> <br>
		<button type="button" class="btn btn-primary float-left">전체글</button>
		<button type="button" class="btn btn-info float-left">개념글</button>
		<button type="button" class="btn btn-info float-right">글쓰기</button>

		<br> <br>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="http://127.0.0.1:5500/index.html#">Previous</a></li>
				<li class="page-item"><a class="page-link"
					href="http://127.0.0.1:5500/index.html#">1</a></li>
				<li class="page-item"><a class="page-link"
					href="http://127.0.0.1:5500/index.html#">2</a></li>
				<li class="page-item"><a class="page-link"
					href="http://127.0.0.1:5500/index.html#">3</a></li>
				<li class="page-item"><a class="page-link"
					href="http://127.0.0.1:5500/index.html#">4</a></li>
				<li class="page-item"><a class="page-link"
					href="http://127.0.0.1:5500/index.html#">5</a></li>
				<li class="page-item"><a class="page-link"
					href="http://127.0.0.1:5500/index.html#">Next</a></li>
			</ul>
		</nav>
	</div>
	<script src="./Document_files/jquery.min.js.다운로드"></script>
	<script type="text/javascript" src="./Document_files/bootstrap.js.다운로드"></script>
	<!-- Code injected by live-server -->
	<script type="text/javascript">
		// <![CDATA[  <-- For SVG support
		if ('WebSocket' in window) {
			(function() {
				function refreshCSS() {
					var sheets = [].slice.call(document
							.getElementsByTagName("link"));
					var head = document.getElementsByTagName("head")[0];
					for (var i = 0; i < sheets.length; ++i) {
						var elem = sheets[i];
						var parent = elem.parentElement || head;
						parent.removeChild(elem);
						var rel = elem.rel;
						if (elem.href && typeof rel != "string"
								|| rel.length == 0
								|| rel.toLowerCase() == "stylesheet") {
							var url = elem.href.replace(
									/(&|\?)_cacheOverride=\d+/, '');
							elem.href = url
									+ (url.indexOf('?') >= 0 ? '&' : '?')
									+ '_cacheOverride='
									+ (new Date().valueOf());
						}
						parent.appendChild(elem);
					}
				}
				var protocol = window.location.protocol === 'http:' ? 'ws://'
						: 'wss://';
				var address = protocol + window.location.host
						+ window.location.pathname + '/ws';
				var socket = new WebSocket(address);
				socket.onmessage = function(msg) {
					if (msg.data == 'reload')
						window.location.reload();
					else if (msg.data == 'refreshcss')
						refreshCSS();
				};
				if (sessionStorage
						&& !sessionStorage
								.getItem('IsThisFirstTime_Log_From_LiveServer')) {
					console.log('Live reload enabled.');
					sessionStorage.setItem(
							'IsThisFirstTime_Log_From_LiveServer', true);
				}
			})();
		} else {
			console
					.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
		}
		// ]]>
	</script>
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