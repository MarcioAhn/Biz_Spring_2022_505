<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>나의 API App</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="${rootPath}/static/css/main.css?ver=2022-06-02-003" />
<link rel="stylesheet"
	href="${rootPath}/static/css/home.css?ver=2022-06-02-001" />
<link rel="stylesheet"
	href="${rootPath}/static/css/table.css?ver=2022-06-02-001" />
<link rel="stylesheet"
	href="${rootPath}/static/css/input.css?ver=2022-05-31-001" />

<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/static/js/input.js?ver=2022-05-31-008"></script>
</head>
<body>
	<header>
		<h1>My Api</h1>
		<p>Naver API를 활용한 도서, 뉴스, 영화 정보 서비스</p>
	</header>
	<nav>
		<ul>
			<li><a href="${rootPath}/">Home</a></li>
			<li><a href="${rootPath}/books/list">도서정보</a></li>
			<li><a href="${rootPath}/news">오늘의 뉴스</a></li>
			<li><a href="${rootPath}/movies">영화정보</a></li>
			<li><a href="${rootPath}/naver">네이버체험</a></li>
			<%// 로그인을 하지 않았을 때 %>
			<c:if test="${empty MEMBER}">
			<li><a href="${rootPath}/member/login">로그인</a></li>
			<li><a href="${rootPath}/member/join">회원가입</a></li>
			</c:if>
			<%// 로그인을 하였을 때는 MEMBER 객체에 로그인한 사용자 정보가 담겨 있다 %>
			<c:if test="${not empty MEMBER}">
				<li><a href="${rootPath}/member/mypage">My Page</a></li>
				<li><a href="${rootPath}/member/logout">Logout</a></li>
			</c:if>
		</ul>
	</nav>
	<section class="main">
		<c:choose>
			<c:when test="${LAYOUT == 'BOOK-INPUT}">
				<%@ include file="/WEB-INF/views/books/insert.jsp" %>
			</c:when>
			<c:when test="${LAYOUT == 'BOOK-LIST}">
				<%@ include file="/WEB-INF/views/books/list.jsp" %>
			</c:when>
			<c:when test="${LAYOUT == 'BOOK-DETAIL}">
				<%@ include file="/WEB-INF/views/books/detail.jsp" %>
			</c:when>
		</c:choose>
	</section>
	<footer class="main">
		<address>CopyRight &copy; dksgur52@naver.com</address>
	</footer>
	<div class="w3-modal modal-result">
		<div class="w3-modal-content w3-card-4">
			<header class="w3-container w3-teal">
				<span class="w3-button w3-display-topright modal-close">&times;</span>
				<h2>도서 검색 정보</h2>
			</header>
			<div class="w3-container search-content">
				<p>여기는 검색결과가 보여지는 곳
			</div>
			<footer class="w3-container w3-teal">
				<address>CopyRight &copy; dksgur52@naver.com</address>
			</footer>
		</div>
		<script>
			document.querySelector("span.modal-close")?.addEventListener("click",()=>{
				document.querySelector("div.modal-result").style.display='none'
			})
			
			document.querySelector("footer.main").addEventListener("click",()=>{
				document.querySelector("div.modal-result").style.display='block'
			})
		</script>
	</div>
</body>
</html>