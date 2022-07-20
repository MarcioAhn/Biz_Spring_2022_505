<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
input {
	margin : 20px;
}
a {
	text-decoration: none;
	color: inherit;
}
table {
	margin : 20px auto;
	width: 900px;
	text-align: center;
}


</style>	
</head>
<body>
	<div class="w3-container w3-main">
		<h2>개인주소록</h2>
	</div>
	<form method="POST">
		<input name="a_seq" type="hidden"
			value='<c:out value="${ADDR.a_seq}" default="0"/>' />
		<input name="a_name" placeholder="이름" value="${ADDR.a_name}"/>
		<input name="a_tel" placeholder="전화번호"  value="${ADDR.a_tel}"/>
		<input name="a_address" placeholder="주소"  value="${ADDR.a_address}"/>
		<button class="w3-button w3-black">저장</button>
	</form>
	<table class="w3-table-all w3-card-4">
		<colgroup>
		<col width="200px">
		<col width="400px">
		<col width="600px">
		</colgroup>
		<thead>
			<tr class="w3-light-grey">
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ADDRS}" var="ADDR">
				<tr>
					<td><a href="${rootPath}/detail?seq=${ADDR.a_seq}">${ADDR.a_name}</a></td>
					<td>${ADDR.a_tel}</td>
					<td>${ADDR.a_address}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/views/pagination.jsp" %>
</body>
</html>