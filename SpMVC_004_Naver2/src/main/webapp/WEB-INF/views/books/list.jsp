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
<link rel="stylesheet"
	href="${rootPath}/static/css/list.css?ver=2022-06-02-001" />
</head>
<%@ include file="/WEB-INF/views/include/include_head.jsp"%>
<body>
	<div class="book_d">
		<table class="book_t">
			<colgroup>
				<col style="width: 150px">
				<col style="width: 250px">
				<col style="width: 150px">
				<col style="width: 150px">
				<col style="width: 150px">
				<col style="width: 250px">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>ISBN</th>
					<th>도서명</th>
					<th>출판사</th>
					<th>저자</th>
					<th>출판일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${BOOKS}" var="BOOK">
					<tr>
						<td>${BOOK.seq}</td>
						<td>${BOOK.isbn}</td>
						<td>${BOOK.title}</td>
						<td>${BOOK.publisher}</td>
						<td>${BOOK.author}</td>
						<td>${BOOK.pubdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button>
		<a href="${rootPath}/books/insert">도서정보추가</a>
	</button>

</body>
</html>
<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>