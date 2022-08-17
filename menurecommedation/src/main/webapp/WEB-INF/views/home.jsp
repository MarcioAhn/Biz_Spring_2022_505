<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://kit.fontawesome.com/464cf13c93.js"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border;
	margin: 0;
	padding: 0;
}

html {
	width: 100vw;
	height: 100vh;
}

body {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
}

header {
	padding: 2rem;
	color: white;
	background-color: #13c4d1;
	display: flex;
	justify-content: center;
	align-items: center;
}

nav {
	background-color: #23dbc6;
	color: white;
}

nav ul {
	list-style: none;
	display: flex;
}

nav li {
	padding: 16px 12px;
}

nav a {
	text-decoration: none;
	color: inherit;
	magin: 5px 0;
	padding: 0 12px;
	border-bottom: 3px solid transparent;
	transition: 1s;
}

nav a:hover {
	border-bottom: 3px solid #ddd
}

nav li:nth-of-type(4) {
	margin-left: auto;
}

nav li:nth-of-type(1) {
	margin-left: 20px;
}

nav li:last-of-type {
	margin-right: 30px;
}

section.main {
	flex: 1;
}

article.welcome {
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<header>
		<h1>Menu Recommendation</h1>
	</header>
	<nav>
		<ul>
			<li><a href="${rootPath}/">HOME</a></li>
			<li><a href="${rootPath}/food">음식 기록 일지</a></li>
			<li><a href="${rootPath}/about">About</a></li>

			<sec:authorize access="isAnonymous()">
				<li><a href="${rootPath}/user/login">로그인</a></li>
				<li><a href="${rootPath}/user/join">회원가입</a></li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li><a href="${rootPath}/">로그아웃</a></li>
				<li><a href="${rootPath}/user/mypage">myPage</a></li>
			</sec:authorize>
		</ul>
	</nav>
	<section class="main">
		<c:choose>
			<c:when test="${LAYOUT == 'JOIN' }">
				<%@ include file="/WEB-INF/views/user/join.jsp"%>
			</c:when>
			<c:when test="${LAYOUT == 'LOGIN' }">
				<%@ include file="/WEB-INF/views/user/login.jsp"%>
			</c:when>
			<c:when test="${LAYOUT == 'FOOD_LIST' }">
				<%@ include file="/WEB-INF/views/food/list.jsp"%>
			</c:when>

		</c:choose>
			<c:if test="${empty principal.username}">

				<article class="welcome">
					<h1>메뉴추천 애플리케이션 2022</h1>
					<p>MR을 이용하시려면 회원가입, 로그인을 해 주세요</p>
				</article>

			</c:if>
			<c:if test="${not empty principal.username}">
				<div class="list_box cho-list-containerVer2">
					<ul id="list_today">
						<c:forEach items="${RECIPES}" var="RAND">
							<li>
								<div class="cho-list-boxVer2" data-seq="${RAND.RCP_SEQ}"
									data-nm="${RAND.RCP_NM}">
									<img class="img-list-home" src="${RAND.ATT_FILE_NO_MK}" />
								</div>
								<div class="text-box">${RAND.RCP_NM}</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<button>
					<i class="fa-solid fa-rotate-left"></i>
				</button>
			</c:if>
	</section>
	<form:form class="logout" action="${rootPath}/logout" />

</body>
</html>