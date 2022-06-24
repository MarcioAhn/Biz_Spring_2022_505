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

<title>Insert title here</title>
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/resources/input.js"></script>
</head>
<body>
	<table class="w3-table-all memo">
		<colgroup>
			<col width="100px">
			<col width="100px">
			<col width="100px">
			<col width="100px">
		</colgroup>

		<%
		/* 
				서버로 부터 받은 데이터(도서리스트)를 보여주기 위한 부분
				BOOKS : 서버로 부터 받을 데이터
				BOOK : forEach 를 사용하여 한개의 요소를 추출하여 저장할 변수
				*/
		%>
		<c:forEach items="${MEMO}" var="MEMO" varStatus="INDEX">
			<tr data-seq="${MEMO.m_seq}">
				<td>${INDEX.count}</td>
				<td>${MEMO.m_author}</td>
				<td>${MEMO.m_date}</td>
				<td>${MEMO.m_time}</td>
			</tr>
		</c:forEach>
	</table>

	<div class="btn_box">
		<a href="${rootPath}/memo/insert">메모추가</a>
	</div>
</body>
</html>