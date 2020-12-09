<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.Member"%>
<%@ page import="vo.Member, vo.Goods"%>
<%@ page import="java.util.HashMap,java.util.ArrayList"%>
<%
	Member loginMember = (Member) session.getAttribute("loginMember");
ArrayList<Goods> todayImageList = (ArrayList<Goods>) request.getAttribute("todayImageList");
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
<!-- css origin -->
<link rel="stylesheet" href="css/style.css" />
<title>컴퓨터 홈 쇼핑 사이트</title>
</head>
<body>
	<!-- 2020-12-02 haesu -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="header">
		<button class="navbar-toggler navbar-toggler__nohide" type="button"
			data-toggle="collapse" data-target="#navbarNavDropdown"
			aria-controls="navbarNavDropdown" aria-expanded="true"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon navbar-toggler__nohide"></span>
		</button>
		<ul>
			<li><a></a></li>
		</ul>
		<div class="collapse navbar-collapse mr-4" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">컴퓨터부품</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

						<a class="dropdown-item" href="goodsList.do?kind=cpu">CPU</a> <a
							class="dropdown-item" href="goodsList.do?kind=cooler">쿨러/튜닝</a> <a
							class="dropdown-item" href="goodsList.do?kind=board">메인보드</a> <a
							class="dropdown-item" href="goodsList.do?kind=mainboard">메인보드</a>
						<a class="dropdown-item" href="goodsList.do?kind=memory">메모리</a> <a
							class="dropdown-item" href="goodsList.do?kind=card">그래픽카드</a> <a
							class="dropdown-item" href="goodsList.do?kind=ssd">SSd</a> <a
							class="dropdown-item" href="goodsList.do?kind=hard">하드디스크</a> <a
							class="dropdown-item" href="goodsList.do?kind=disc">외장HDD/SSD</a>
						<a class="dropdown-item" href="goodsList.do?kind=case">케이스</a> <a
							class="dropdown-item" href="goodsList.do?kind=graphic">그래픽카드</a>
						<a class="dropdown-item" href="goodsList.do?kind=SSD">SSd</a> <a
							class="dropdown-item" href="goodsList.do?kind=harddisk">하드디스크</a>
						<a class="dropdown-item" href="goodsList.do?kind=sidedisk">외장HDD/SSD</a>
						<a class="dropdown-item" href="goodsList.do?kind=case">케이스</a> <a
							class="dropdown-item" href="goodsList.do?kind=power">파워</a> <a
							class="dropdown-item" href="goodsList.do?kind=keyboard">키보드</a> <a
							class="dropdown-item" href="goodsList.do?kind=mouse">마우스</a> <a
							class="dropdown-item" href="goodsList.do?kind=odd">ODD</a> <a
							class="dropdown-item" href="goodsList.do?kind=moniter">모니터</a> <a
							class="dropdown-item" href="goodsList.do?kind=soft">소프트웨어</a>
						<a class="dropdown-item" href="goodsList.do?kind=software">소프트웨어</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 조립PC </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">사장 추천 조립PC</a> <a
							class="dropdown-item" href="#">유저 추천 조립PC</a> <a
							class="dropdown-item" href="#">컴퓨터 부품 회사 추천 조립PC</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 브랜드PC </a>
					<div class="dropdown-menu "
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">삼성전자</a> <a
							class="dropdown-item" href="#">HP</a> <a class="dropdown-item"
							href="#">LG전자</a> <a class="dropdown-item" href="#">레노버</a> <a
							class="dropdown-item" href="#">DELL</a> <a class="dropdown-item"
							href="#">ASUS</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">컴퓨터 리뷰 커뮤니티</a> <a
							class="dropdown-item" href="#">컴퓨터 추천 커뮤니티</a>
					</div></li>
			</ul>
		</div>
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
		</form>
	</nav>
	<!-- end -->
	<!-- help  haesu  2020-12-02 -->
	<section class="container__size" id="home">
		<div class=" w-100 ">
			<div id="carouselExampleControls"
				class="carousel slide w-100 container__center " data-ride="carousel">
				<div class="carousel-inner w-100 ">
					<div class="carousel-item active w-100">
						<img src="img/picture1.jpg" class="d-block w-100" alt="..."
							style="height: 400px">
					</div>
					<div class="carousel-item w-100">
						<img src="img/picture2.jpg" class="d-block w-100" alt="..."
							style="height: 400px">
					</div>
					<div class="carousel-item w-100">
						<img src="img/picture3.jpg" class="d-block w-100" alt="..."
							style="height: 400px">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</section>
	<!-- help end -->
	<!-- 강현우 상품 목록 2020/12/2 -->
	<section id="portfolio">
		<div class="text-center">
			<h2>상품 목록</h2>
		</div>
		<div id="com">
			<ul class="board-list">
				<li><img src="img/Snote.jpg" class="com__size">
					<div class="com_show">
						<h4>[삼성전자]노트북7 Force 15형</h4>
						<p>가격 : 1,000,000원</p>
					</div></li>
				<li><img src="img/LDcom.jpg" class="com__size">
					<div class="com_show">
						<h4>[LG전자] 슬림형 데스크탑 Z80GV</h4>
						<p>가격 : 800,000원</p>
					</div></li>
				<li><img src="img/LeDcom.png" class="com__size">
					<div class="com_show">
						<h4>[레노버] 씽크센터 M70t</h4>
						<p>가격 : 900,000원</p>
					</div></li>
			</ul>
		</div>
		<div id="com">
			<ul class="board-list">
				<li><img src="img/PMo.jpg" class="com__size">
					<div class="com_show">
						<h4>[비트엠] 플래티넘 HP190ML 프리싱크 HDR</h4>
						<p>가격 : 200,000원</p>
					</div></li>
				<li><img src="img/AD4.jpg" class="com__size">
					<div class="com_show">
						<h4>[ADATA] 4GB 컴퓨터 DDR4 PC4-21300</h4>
						<p>가격 : 20,000원</p>
					</div></li>
				<li><img src="img/SC.jpg" class="com__size">
					<div class="com_show">
						<h4>[Creative] 사운드 블라스터X G6 사운드카드</h4>
						<p>가격 : 190,000원</p>
					</div></li>
			</ul>
		</div>
	</section>
	<!-- end -->
	<!-- 2020-12-02 haesu and gang -->
	<div class="card text-center m-3 ">
		<div class="card-header">
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item"><a class="nav-link active" href="#">공지사항</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
				<li class="nav-item"><a class="nav-link" href="#">쿠폰</a></li>
			</ul>
		</div>
		<div class="card-body tab-info">
			<h1>공지사항 창입니다.</h1>
		</div>
		<div class="card-body tab-info mx-auto d-none">
			<div class="d-flex justify-content-between align-items-center">
				<a href="#" class="text-decoration-none">
					<div class="card bg-white text-white card__size">
						<img src="img/picture4.jpg" class="card-img card-img__cover"
							alt="...">
						<h4>G-force를 싸게 살수 있는 기회!</h4>
					</div>
				</a> <a href="#" class="text-decoration-none">
					<div class="card bg-white text-white card__size">
						<img src="img/picture4.jpg" class="card-img card-img__cover"
							alt="...">
						<h4>나도 할수 있다! 조립!</h4>
					</div>
				</a> <a href="#" class="text-decoration-none">
					<div class="card bg-white text-white card__size">
						<img src="img/picture4.jpg" class="card-img card-img__cover"
							alt="...">
						<h4>부품 무료 나눔 이벤트</h4>
					</div>
				</a>
			</div>
		</div>
		<div class="card-body d-none tab-info mx-auto">
			<div class="d-flex">
				<a href="#" class="text-decoration-none">
					<div class="card bg-white text-white card__size">
						<img src="img/picture4.jpg" class="card-img card-img__cover"
							alt="...">
						<h4>회원 전용 쿠폰</h4>
					</div>
				</a> <a href="#" class="text-decoration-none">
					<div class="card bg-white text-white card__size">
						<img src="img/picture4.jpg" class="card-img card-img__cover"
							alt="...">
						<h4>비회원 전용 쿠폰</h4>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- end -->
	<!-- 2020-12-02 haesu -->
	<div class="controller">
		<%
			if (loginMember == null) {
		%>
		<div class="controller__menu">
			<button type="button" class="btn btn-primary btn-sm btn-block"
				data-toggle="modal" data-target="#loginModal">로그인</button>
		</div>
		<!-- 회원가입 modal만들기 -->
		<div class="controller__menu">
			<button type="button" class="btn btn-primary btn-sm btn-block"
				data-toggle="modal" data-target="#joinModal">회원가입</button>
		</div>
		<%
			} else {
		%>
		<div class="controller__menu">
			<h6>
				<%=loginMember.getId()%>님 환영합니다.
			</h6>
		</div>
		<div class="controller__menu">
			<button type="button" class="btn btn-primary btn-sm btn-block"
				onclick="location.href='logout.do'">로그아웃</button>
		</div>
		<div class="controller__menu">
			<button type="button" class="btn btn-primary btn-sm btn-block"
				data-toggle="modal" data-target="#profileModal">프로필 수정</button>
		</div>
		<%
			}
		%>
		<div class="controller__menu">
			<a class="btn btn-primary btn-sm btn-block " href="goodsListCart.do">장바구니</a>
		</div>
		<div class="controller__menu ">
			<span class="text-center">최근본상품</span>
			<div></div>
			<%
				for (int i = 0; i < todayImageList.size(); i++) {
			%>
			<div>
				<img src="images/<%=todayImageList.get(i).getImage()%>"
					id="todayImage" />
			</div>
			<%
				}
			%>
		</div>
	</div>

	<footer class="text-center bg-dark text-white">
		<div class="footer-above">
			<div class="container pt-4">
				<div class="row">
					<div class="footer-col col-md-4">
						<h3 style="color: white;">위치</h3>
						<p>
							영남기술교육원<br />대구광역시 달서구
						</p>
					</div>
					<div class="footer-col col-md-4">
						<h3 style="color: white;">소셜 미디어</h3>
						<a href="#" class="btn btn-light m-2"><img
							src="img/facebook.svg"></a> <a href="#"
							class="btn btn-light m-2"><img src="img/youtube.svg"></a> <a
							href="#" class="btn btn-light m-2"><img src="img/twitter.svg"></a>
						<a href="#" class="btn btn-light m-2"><img
							src="img/twitch.svg"></a> <a href="#" class="btn btn-light m-2"><img
							src="img/instagram.svg"></a>
					</div>
					<div class="footer-col col-md-4">
						<h3 style="color: white;">개발자 한마디</h3>
						<p>언제든지 연락주세요!!</p>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-below pb-4">
			<div class="container text-center">
				<div>Copyright &copy; JP 2020. All Right Reserved.</div>
			</div>
		</div>
	</footer>
	<!-- end -->
	<!-- Login Modal  2020-12-03 haesu-->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="loginPro.do" method="post">
						<div class="form-group">
							<label for="id">ID</label> <input type="text"
								class="form-control" id="id" aria-describedby="emailHelp"
								name="id">
						</div>
						<div class="form-group">
							<label for="passwd">Password</label> <input type="password"
								class="form-control" id="passwd" name="passwd">
						</div>
						<button type="submit" class="btn btn-primary">로그인</button>
						<button type="button" class="btn btn-primary"
							id="loginModalJoinBtn">회원가입</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Join Modal -->
	<div class="modal fade" id="joinModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="joinPro.do" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="id"
								placeholder="아이디" maxlength="20" required="required"
								autocomplete="off" />
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="passwd"
								placeholder="비밀번호" maxlength="20" required="required"
								autocomplete="off" />
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="name"
								placeholder="이름" maxlength="20" required="required"
								autocomplete="off" />
						</div>
						<div class="form-group">
							<input type="text" id="sample4_postcode" placeholder="우편번호"
								class="form-control" name="addr1" required="required"
								autocomplete="off"> <input type="button"
								onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
								class="form-control"><input type="text"
								id="sample4_roadAddress" placeholder="도로명주소"
								class="form-control" name="addr2" required="required"
								autocomplete="off"> <input class="form-control"
								type="text" id="sample4_detailAddress" placeholder="상세주소"
								name="addr3" required="required" autocomplete="off">
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="age"
								placeholder="나이" maxlength="20" required="required"
								autocomplete="off" />
						</div>
						<div class="form-group">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active"> <input
									type="radio" class="d-none" name="gender" autocomplete="off"
									value='M' checked="checked" />남자
								</label> <label class="btn btn-primary"> <input type="radio"
									class="d-none" name="gender" autocomplete="off" value='F' />여자
								</label>
							</div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email"
								placeholder="이메일" maxlength="20" required="required"
								autocomplete="no" />
						</div>
						<button type="submit" class="btn btn-primary form-control">가입</button>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- 2020/12/04 강현우 프로필 수정 -->
	<div class="modal fade" id="profileModal" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">프로필 수정 페이지</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="joinPro.do" method="post">
						<div class="form-group">
							<input type="password" class="form-control" name="passwd"
								placeholder="비밀번호" maxlength="20" required="required"
								autocomplete="off" />
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="name"
								placeholder="이름" maxlength="20" required="required"
								autocomplete="off" />
						</div>
						<div class="form-group">
							<input type="text" id="sample4_postcode" placeholder="우편번호"
								class="form-control" name="addr1" required="required"
								autocomplete="off"> <input type="button"
								onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
								class="form-control"><input type="text"
								id="sample4_roadAddress" placeholder="도로명주소"
								class="form-control" name="addr2" required="required"
								autocomplete="off"> <input class="form-control"
								type="text" id="sample4_detailAddress" placeholder="상세주소"
								name="addr3" required="required" autocomplete="off">
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="age"
								placeholder="나이" maxlength="20" required="required"
								autocomplete="off" />
						</div>
						<div class="form-group">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active"> <input
									type="radio" class="d-none" name="gender" autocomplete="off"
									value='M' checked="checked" />남자
								</label> <label class="btn btn-primary"> <input type="radio"
									class="d-none" name="gender" autocomplete="off" value='F' />여자
								</label>
							</div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email"
								placeholder="이메일" maxlength="20" required="required"
								autocomplete="no" />
						</div>
						<button type="submit" class="btn btn-primary form-control">변경</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- 프로필 수정 end -->
	<!-- Optional JavaScript -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
	<script src="js/header.js"></script>
	<script src="js/main.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/addr.js"></script>
</body>
</html>