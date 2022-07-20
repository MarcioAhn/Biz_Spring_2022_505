<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/resources/js/address.js?ver=2022-07-20-006" /></script>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Insert title here</title>
<style>
form input {
	width: 500px;
	margin-left: auto;
	margin-right: 200px;
	display: flex;
}

a {
	text-decoration: none;
	color: inherit;
}
table {
	margin: 20px auto;
	width: 900px;
	text-align: center;
}
.add {
	margin-right: 200px;
	margin-left: auto;
}
</style>
</head>
<body>
	<div class="w3-container w3-main">
		<h2>주소록LIST</h2>
	</div>

	<%
	// form에 한개의 input box만 있을 경우 input box text를 입력한 후 Enter를
	// 누르면 input box에 담긴 문자열을 서버로 전송하는 기능이 활성화 된다
	%>
	<form>
		<input name="search" placeholder="검색어 입력 후 Enter..." />
	</form>
	<div class="add">
		<a href="${rootPath}/insert">주소 추가하기</a>
	</div>
	<table class="address w3-table-all w3-card-4">
		<colgroup>
			<col width="200px">
			<col width="400px">
			<col width="600px">
		</colgroup>
		<thead>
			<tr  class="w3-light-grey">
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ADDRS}" var="ADDR">
				<tr data-seq="${ADDR.a_seq}">
					<td><a href="${rootPath}/detail?seq=${ADDR.a_seq}">${ADDR.a_name}</a></td>
					<td>${ADDR.a_tel}</td>
					<td>${ADDR.a_address}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/views/pagination.jsp"%>

</body>
</html>