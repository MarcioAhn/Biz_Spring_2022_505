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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
<title>Insert title here</title>
<style>
header {
  padding: 1.2rem;
  text-align: center;
  background-color: rgb(193, 226, 237);
  color: rgb(47.41, 41);
  font-weight: 900;
  color: white;
}
body {
	justify-content: center;
	align-items: center;
	position: relative;
	margin: 100px;
	padding: 0;
}

.all {
	margin: 10px auto;
}

table {
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	margin-left: 0 auto;
}

.tbl_middle {
	text-align: center;
}

tr {
	border: 1px solid black;
}

a {
	text-decoration: none;
	color: inherit;
}

button {
	padding: 10px;
}

.btn_below {
	float: right;
	margin: 20px auto;
}
</style>
<script>
	const rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/memo.js?20220627007"></script>
</head>
<body>
	<header>
		<div class="all">
			<c:if test="${empty USERNAME}">
				<h2>로그인이 필요한 서비스입니다</h2>
			</c:if>
			<c:if test="${not empty USERNAME}">
				<h1>${USERNAME}님의 도서목록</h1>
			</c:if>
		</div>
	</header>

	<div class="tbl_middle">
		<table class="w3-table-all books memo">
			<colgroup>
				<col width="100px">
				<col width="200px">
				<col width="200px">
				<col width="800px">
				<col width="200px">
			</colgroup>
			<tr>
				<th>순번</th>
				<th>작성일자</th>
				<th>작성시각</th>
				<th>도서명</th>
				<th>완료</th>
			</tr>
			<c:if test="${empty MEMOS}">
				<tr>
					<td colspan="4">도서목록이 없습니다</td>
				</tr>
			</c:if>
			<c:forEach items="${MEMOS}" var="MEMO" varStatus="INDEX">
				<tr data-seq="${MEMO.m_seq}">
					<td>${INDEX.count}</td>
					<td>${MEMO.m_date}</td>
					<td>${MEMO.m_time}</td>
					<td>${MEMO.m_title}</td>
					<td>
						<div>
							<input type="checkbox">
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="btn_below">
			<button>
				<a href="${rootPath}/memo/insert">도서작성하기</a>
			</button>
			<button>
				<c:if test="${empty USERNAME}">
					<a href="${rootPath}/user/login">로그인하기</a>
				</c:if>
				<c:if test="${not empty USERNAME}">
					<a href="${rootPath}/user/logout">로그아웃하기</a>
				</c:if>
			</button>
		</div>
	</div>
</body>
</html>